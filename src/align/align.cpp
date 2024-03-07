#include "align.h"
#include "params.h"

using namespace hls;

#define MAX(x, y) (((x) > (y)) ? (x) : (y))

// void Align::ArrangeScores(
// 	dp_mem_block_t &dpmem_in,
// 	bool (&predicate)[PE_NUM], idx_t (&pe_offset)[PE_NUM],
// 	hls::vector<type_t, N_LAYERS>  (*chunk_score_out)[MAX_REFERENCE_LENGTH])
// {
// 	for (int i = 1; i < PE_NUM+1; i++)
// 	{
// #pragma HLS unroll
// 		if (predicate[i-1])
// 		{
// 			chunk_score_out[i-1][pe_offset[i-1]] = dpmem_in[i][0];
// 		}
// 	}
// }


void Align::WriteInitialColScore(int i, score_vec_t (&init_scores)[PE_NUM], hls::stream_of_blocks<dp_mem_block_t> &dp_mem_in, hls::stream_of_blocks<dp_mem_block_t> &scores_out)
{
	read_lock<dp_mem_block_t> dp_mem_rd(dp_mem_in);
	write_lock<dp_mem_block_t> scores_wr(scores_out);

#pragma HLS array_partition variable = dp_mem_rd type = complete
#pragma HLS array_partition variable = scores_wr type = complete

	for (int j = 0; j < PE_NUM; j++)
	{
#pragma HLS unroll
		scores_wr[0][j] = dp_mem_rd[0][j];
		scores_wr[1][j] = dp_mem_rd[1][j];
	}

	if (i < PE_NUM)
	{
		write_lock<dp_mem_block_t> scores_wr(scores_out);
		scores_wr[0][i] = init_scores[i];
	}
}



void Align::ShiftPredicate(bool (&predicate)[PE_NUM], int idx, int query_len, int reference_len)
{
	if (idx < PE_NUM) // query len
	{
		Utils::Array::ShiftRight<bool, PE_NUM>(predicate, true);
	}
	else if (idx >= reference_len)
	{
		Utils::Array::ShiftRight(predicate, false);
	};
}

void Align::ShiftReferece(
	char_t (&local_reference)[PE_NUM], char_t (&reference)[MAX_REFERENCE_LENGTH],
	int idx, int ref_len)
{
// #pragma HLS inline off
#pragma HLS latency max=1
	// Shift Reference
	if (idx < ref_len)
	{
		Utils::Array::ShiftRight<char_t, PE_NUM>(local_reference, reference[idx]);
	}
	else
	{
		Utils::Array::ShiftRight<char_t, PE_NUM>(local_reference, ZERO_CHAR);
	}
	// Utils::Array::ShiftRight<char_t, PE_NUM>(local_reference, reference[idx]);
}

void Align::PrepareScoresArr(
	dp_mem_block_t &dp_mem_in,
	score_vec_t (&init_col_scr)[PE_NUM], int id,
	score_vec_t (&last_chunk_scr)[2],
	wavefront_scores_t &up_out,
	wavefront_scores_t &diag_out,
	wavefront_scores_t &left_out)
{

	// prepare scores for PE 0
	up_out[0] = last_chunk_scr[0];
	diag_out[0] = last_chunk_scr[1];
	left_out[0] = dp_mem_in[0][0];

	for (int i = 1; i < PE_NUM; i++)
	{
#pragma HLS unroll
		up_out[i] = dp_mem_in[0][i - 1];
		diag_out[i] = dp_mem_in[1][i - 1];
		left_out[i] = dp_mem_in[0][i];
	}

	if (id < PE_NUM)
	{
		left_out[id] = init_col_scr[id];
	}
}

void Align::DPMemUpdateArr(
	dp_mem_block_t &dp_mem_in,
	wavefront_scores_t &score_in)
{
	for (int i = 0; i < PE_NUM; i++)
	{
#pragma HLS unroll
		dp_mem_in[1][i] = dp_mem_in[0][i];
		dp_mem_in[0][i] = score_in[i];
	}
}

void Align::InitializeChunkCoordinates(idx_t chunk_row_offset, idx_t chunk_col_offset, hls::vector<idx_t, PE_NUM> &ic, hls::vector<idx_t, PE_NUM> &jc){
	for (int i = 0; i < PE_NUM; i++)
	{
#pragma HLS unroll
		ic[i] = chunk_row_offset + i;
		jc[i] = chunk_col_offset - i;
	}
}

void Align::InitializeColumnCoordinates(idx_t (&jc)[PE_NUM]){
	for (int i = 0; i < PE_NUM; i++)
	{
#pragma HLS unroll
		jc[i] = -i;
	}
}

void Align::InitializeRowCoordinates(idx_t (&ic)[PE_NUM]){
	for (int i = 0; i < PE_NUM; i++)
	{
#pragma HLS unroll
		ic[i] = i;
	}
}

void Align::MapPredicateSquare(
	// hls::vector<idx_t, PE_NUM> &ics,
	// hls::vector<idx_t, PE_NUM> &jcs,
	idx_t (&ics)[PE_NUM], idx_t (&jcs)[PE_NUM],
	const idx_t ref_len,
	bool (&predicate)[PE_NUM]){
#pragma HLS inline off
	for (int i = 0; i < PE_NUM; i++)
	{
#pragma HLS unroll
		predicate[i] = (ics[i] >= 0 && jcs[i] >= 0 && jcs[i] < ref_len);
	}
}


void Align::ChunkCompute(
	idx_t chunk_row_offset,
	idx_t chunk_start_col,
	input_char_block_t &local_query,
	char_t (&reference)[MAX_REFERENCE_LENGTH],
	chunk_col_scores_inf_t &init_col_scr,
	score_vec_t (&init_row_scr)[MAX_REFERENCE_LENGTH],
	idx_t (&v_rows)[PE_NUM], idx_t (&v_cols)[PE_NUM],
	idx_t (&p_cols)[PE_NUM], idx_t ck_idx,
	int global_query_length, int query_length, int reference_length,
	const Penalties &penalties, 
	score_vec_t (&preserved_row_scr)[MAX_REFERENCE_LENGTH],
	ScorePack (&max)[PE_NUM],
	tbp_t (&chunk_tbp_out)[PE_NUM][MAX_QUERY_LENGTH / PE_NUM * MAX_REFERENCE_LENGTH]
#ifdef CMAKEDEBUG
	, Container &debugger
#endif
	){
#pragma HLS inline off
#pragma HLS dataflow

	bool predicate[PE_NUM];
	// score_vec_t write_row_scr[MAX_REFERENCE_LENGTH];

	Utils::Init::ArrSet<bool, PE_NUM>(predicate, false);

	char_t local_reference[PE_NUM]; // local reference
	tbp_vec_t tbp_out;
	dp_mem_block_t dp_mem;
	score_vec_t score_buff[PE_NUM + 1];

#pragma HLS array_partition variable = predicate type = complete
#pragma HLS array_partition variable = local_query type = complete

#pragma HLS array_partition variable = local_reference type = complete
#pragma HLS array_partition variable = dp_mem type = complete
#pragma HLS array_partition variable = tbp_out type = complete
#pragma HLS array_partition variable = score_buff type = complete

	dp_mem[0][0] = init_col_scr[0];

	// FIXME: We can compute scores, and set the TBP for the additional
	// space in the chunk. Then, only start the traceback appropriately
	// so we can make correct computation.
	Iterating_Wavefronts:
	for (int i = 0; i < reference_length + PE_NUM - 1; i++)
	{
#pragma HLS pipeline II = 1
		// printf("iteration %d\n", i);

		Align::MapPredicateSquare(v_rows, v_cols, reference_length, predicate);
		
		Align::ShiftReferece(local_reference, reference, i, reference_length);

		// int band_start, band_end;

        // if (i < FIXED_BANDWIDTH)
        // {
        //     band_start = 0;
        //     band_end = i + 1;
        // }
        // else if (i < (reference_length - PE_NUM + 1))
        // {
        //     band_start = i - FIXED_BANDWIDTH + 1;
        //     band_end = i + 1;
        // }
        // else
        // {
        //     band_start = i - FIXED_BANDWIDTH + 1;
        //     band_end = reference_length;
        // }

        // if (band_start <= i && i < band_end)
        // {

		Align::PrepareScoreBuffer(score_buff, i, init_col_scr, init_row_scr);
		Align::UpdateDPMemSep(dp_mem, score_buff);
		
	// 	for (int j = 0; j < PE_NUM + 1; j++)
	// 	{
	// #pragma HLS unroll
	// 		dp_mem[j][1] = dp_mem[j][0];  // shift
	// 		dp_mem[j][0] = (j - 1 == i && i < PE_NUM) ? init_col_scr[j] : score_buff[j];
	// 	}
	// 	if (i < MAX_REFERENCE_LENGTH){  // FIXME: Actually this could also be actual_reference_length
	// 		dp_mem[0][0] = init_row_scr[i];
	// 	}
	
		// PE::PEUnroll(
		// 	dp_mem,
		// 	local_query,
		// 	local_reference,
		// 	penalties,
		// 	tbp_out);

		PE::PEUnrollSep(
			dp_mem,
			local_query,
			local_reference,
			penalties,
			score_buff,
			tbp_out);
		

		Align::ArrangeTBP(tbp_out, p_cols, predicate, chunk_tbp_out);

#ifdef CMAKEDEBUG
		for (int j = 0; j < PE_NUM; j++)
		{
			debugger.set_score(chunk_row_offset, 0, j, i, score_buff[j+1], predicate[j]);
		}
#endif

		// This should happen before Arrange TBP Arr
		// Because it doesn't increment PE offsets
		// while ArrangeTBPArr does
		Align::PreserveRowScore(
			preserved_row_scr,
			score_buff[PE_NUM],  // score_buff is of the length PE_NUM+1
			predicate[PE_NUM-1],
			v_cols[PE_NUM-1]);

		ALIGN_TYPE::UpdatePEMaximum(score_buff, max, v_rows, v_cols, p_cols, ck_idx,
		predicate, global_query_length, reference_length);
		Align::CoordinateArrayOffset<PE_NUM>(v_cols);
		Align::CoordinateArrayOffset<PE_NUM>(p_cols);
	}

	// copy write_row_score to preserve_row_score
	for (int i = 0; i < MAX_REFERENCE_LENGTH; i++)
	{
// #pragma HLS unroll
		// preserved_row_scr[i] = write_row_scr[i];
	}
}

void Align::UpdateDPMemSep(
	score_vec_t (&dp_mem)[PE_NUM+1][2],
	score_vec_t (&score_in)[PE_NUM + 1])
{
#pragma HLS inline off

#pragma HLS array_partition variable = dp_mem type = complete
#pragma HLS array_partition variable = score_in type = complete

	for (int j = 0; j < PE_NUM + 1; j++)
	{
#pragma HLS unroll
		dp_mem[j][1] = dp_mem[j][0];
		dp_mem[j][0] = score_in[j];
	}
}

void Align::PrepareScoreBuffer(
	score_vec_t (&score_buff)[PE_NUM + 1],
	int i, 
	chunk_col_scores_inf_t (&init_col_scr),
	score_vec_t (&init_row_scr)[MAX_REFERENCE_LENGTH]){
#pragma HLS inline off
	if (i < MAX_REFERENCE_LENGTH){  // FIXME: Actually this could also be actual_reference_length
		score_buff[0] = init_row_scr[i];
	}
	// Set the computation for the 0th column
	if (i < PE_NUM){
		score_buff[i+1] = init_col_scr[i+1];
	}
}

void Align::FindMax::ExtractScoresLayer(wavefront_scores_t &scores, idx_t layer, type_t (&extracted)[PE_NUM])
{
	for (int i = 0; i < PE_NUM; i++)
	{
#pragma HLS unroll
		extracted[i] = scores[i][layer];
	}
}

void Align::ArrangeSingleTBP(
	const idx_t i, const idx_t j, const bool pred, const tbp_t tbp_in,
	tbp_t (&chunk_tbp_out)[MAX_QUERY_LENGTH][MAX_REFERENCE_LENGTH]){
	if (pred) { chunk_tbp_out[i][j] = tbp_in; }
	}


void Align::ArrangeTBP(
	const tbp_vec_t &tbp_in,
	const idx_t (&p_cols)[PE_NUM],
	const bool (&predicate)[PE_NUM],
	tbp_t (&chunk_tbp_out)[PE_NUM][MAX_QUERY_LENGTH / PE_NUM * MAX_REFERENCE_LENGTH])
{
#pragma HLS array_partition variable = chunk_tbp_out type = cyclic factor = PE_NUM dim = 1
#pragma HLS array_partition variable = tbp_in type = complete
#pragma HLS array_partition variable = p_cols type = complete
#pragma HLS array_partition variable = predicate type = complete

	for (int i = 0; i < PE_NUM; i++)
	{
// UNBELIEVEBLE: Specifying any false depencency result in infinite loop in Vitis HLS!#pragma HLS unroll
		// Align::ArrangeSingleTBP(ics[i], jcs[i], predicate[i], tbp_in[i], chunk_tbp_out);
		if (predicate[i]) { 
			chunk_tbp_out[i][p_cols[i]] = tbp_in[i];
		}
	}
}

void Align::UpdatePEOffset(
	idx_t (&pe_offset)[PE_NUM], bool (&predicate)[PE_NUM])
{
	for (int i = 0; i < PE_NUM; i++)
	{
#pragma HLS unroll
		pe_offset[i] += (predicate[i]);
	}
}

void Align::PreserveRowScore(
	score_vec_t (&preserved_row_scr)[MAX_REFERENCE_LENGTH],
	const score_vec_t score_vec,
	const bool predicate_pe_last,
	const idx_t idx)
{
	if (predicate_pe_last)
	{
		preserved_row_scr[idx] = score_vec;
	}
}

void Align::FindMax::ReductionMaxScores(ScorePack (&packs)[PE_NUM], ScorePack &global_max)
{
	idx_t max = 0;
	for (int i = 0; i < PE_NUM; i++)
	{
		if (packs[i].score > packs[max].score)
		{
			max = i;
		}
	}
	global_max = packs[max];
}




void Align::CopyColScore(chunk_col_scores_inf_t & init_col_scr_local, score_vec_t(& init_col_scr)[MAX_QUERY_LENGTH], idx_t idx)
{
	init_col_scr_local[0] = init_col_scr_local[PE_NUM];  // backup the last element from previous chunk

	for (int j = 0; j < PE_NUM; j++)
	{
		init_col_scr_local[j+1] = init_col_scr[idx + j];
	}
}



void Align::PrepareLocalQuery(
    char_t (&query)[MAX_QUERY_LENGTH],
    char_t (&local_query)[PE_NUM],
    idx_t offset,
    idx_t len)
{
	for (int i = 0; i < PE_NUM; i++)
	{
		local_query[i] = query[offset + i];
	}
}

void Align::ChunkMax(ScorePack &max, ScorePack new_scr)
{
	if (new_scr.score > max.score)
	{
		max.score = new_scr.score;
		max.row = new_scr.row;
		max.col = new_scr.col;
	}
}

void Align::AlignStatic(
	char_t (&query)[MAX_QUERY_LENGTH],
	char_t (&reference)[MAX_REFERENCE_LENGTH],
	idx_t query_length,
	idx_t reference_length,
	const Penalties &penalties,
	idx_t &tb_i, idx_t &tb_j, 
	tbr_t (&tb_out)[MAX_REFERENCE_LENGTH + MAX_QUERY_LENGTH]
#ifdef CMAKEDEBUG
	, Container &debugger
#endif
	){
#pragma HLS inline off
	
#pragma HLS array_partition variable = query type = cyclic factor = PE_NUM dim = 1
#pragma HLS array_partition variable = reference type = cyclic factor = PE_NUM dim = 1

// >>> Initialization >>>
	score_vec_t init_col_score[MAX_QUERY_LENGTH];
	score_vec_t init_row_score[MAX_REFERENCE_LENGTH];
	static_assert(MAX_QUERY_LENGTH % PE_NUM == 0, "MAX_QUERY_LENGTH must divide PE_NUM, compilation terminated!");
	tbp_t tbp_matrix[PE_NUM][MAX_QUERY_LENGTH / PE_NUM * MAX_REFERENCE_LENGTH];
	
#pragma HLS array_partition variable = tbp_matrix type = cyclic factor = PE_NUM dim = 1

	// Those are used to iterate through the memory during the score computation
	idx_t v_rows[PE_NUM];
	idx_t v_cols[PE_NUM];
	idx_t p_cols[PE_NUM];

#pragma HLS array_partition variable = v_rows type = complete
#pragma HLS array_partition variable = v_cols type = complete
#pragma HLS array_partition variable = p_cols type = complete

	// Thos are used to retrive the traceback informations
	idx_t p_col_offsets[MAX_QUERY_LENGTH / PE_NUM + 1];  // In which column in the physicla memory starts the chunk. 
	idx_t ck_start_col[MAX_QUERY_LENGTH / PE_NUM];  // Virtual column index of each chunk
	idx_t ck_end_col[MAX_QUERY_LENGTH / PE_NUM];  // Virtual column index of each chunk

	p_col_offsets[0] = 0;  // Initialize the physical column position of the very first chunk to be 0
	ck_start_col[0] = 0;  // Initialize the start column of the very first chunk to be 0

	Align::CoordinateInitializeEquals(ck_start_col, 0);  // initialize the start column of each chunk to be 0
	Align::CoordinateInitializeEquals(ck_end_col, reference_length - 1);  // Initialize the end of each chunk to be the end of the reference_len - 1
	Align::CoordinateInitializeUniform(v_rows, 0);  // Initialize the row coordinates of each PE

	// Declare and initialize maximum scores. 
	ScorePack maximum;
	ScorePack local_max[PE_NUM];


#pragma HLS array_partition variable = init_row_score type=cyclic factor=PE_NUM dim=1
#pragma HLS array_partition variable = init_col_score type=cyclic factor=PE_NUM dim=1

	ALIGN_TYPE::InitializeScores(init_col_score, init_row_score, penalties);
	ALIGN_TYPE::InitializeMaxScores(local_max, query_length, reference_length);

	idx_t row_buffer_osc = 0;

	char_t local_query[PE_NUM];
	chunk_col_scores_inf_t local_init_col_score;
	// local_init_col_score[PE_NUM] = score_vec_t(0); // Always initialize the upper left cornor to 0
	std::fill_n(local_init_col_score, N_LAYERS, 0);

	Iterating_Chunks:
	for (idx_t i = 0, ic = 0; i < query_length; i += PE_NUM, ic ++)
	{
		idx_t local_query_length = ((idx_t)PE_NUM < query_length - i) ? (idx_t)PE_NUM : (idx_t)(query_length - i);

		Align::PrepareLocalQuery(query, local_query, i, local_query_length); // FIXME: Why not coping rest of the query
		Align::CopyColScore(local_init_col_score, init_col_score, i);  // Copy the scores

		Align::CoordinateInitializeUniformReverse(p_cols, p_col_offsets[ic]);  // Initialize physical columns to write to for each PE. 
		Align::CoordinateInitializeUniformReverse(v_cols, ck_start_col[ic]); // Initialize the column coordinates of each PE

		Align::ChunkCompute(
			i,
			ck_start_col[ic],
			local_query,
			reference,
			local_init_col_score,
			init_row_score,
			v_rows, v_cols,
			p_cols, ic,
            query_length,
			local_query_length,
			reference_length,
			penalties,
			init_row_score,
			local_max,
			tbp_matrix
#ifdef CMAKEDEBUG
			, debugger
#endif
		);

		// Set the physical column offsets for the next chunk
		p_col_offsets[ic + 1] = p_col_offsets[ic] + (ck_end_col[ic] - ck_start_col[ic] + 1);

		// Offset the virtual row number
		Align::CoordinateArrayOffsetGeneric<PE_NUM, PE_NUM>(v_rows);

	}
	Align::FindMax::ReductionMaxScores(local_max, maximum);

	// >>> Traceback >>>
	tb_i = maximum.row;
	tb_j = maximum.col;

#ifdef CMAKEDEBUG
	// print tracevack start idx
	cout << "Traceback start idx: " << tb_i << " " << tb_j << endl;
	cout << "Traceback start idx physical: " << maximum.ck << " " <<  maximum.pe << " " << maximum.p_col << endl; 
#endif

	Traceback::TracebackOptimized(tbp_matrix, tb_out, ck_start_col, ck_end_col, maximum.ck, maximum.pe, maximum.p_col, maximum.row, maximum.col);
}

void SwapBuffer(score_vec_t *&a, score_vec_t *&b){
	score_vec_t *temp = a;
	a = b;
	b = temp;
}



void Align::UpdateDPMem(dp_mem_block_t &dp_mem, idx_t i, chunk_col_scores_inf_t &init_col_scr, score_vec_t (&init_row_scr)[MAX_REFERENCE_LENGTH] ){
	Align::UpdateDPMemShift(dp_mem);
	Align::UpdateDPMemSet(dp_mem, i, init_col_scr, init_row_scr);
}

void Align::UpdateDPMemShift(dp_mem_block_t &dp_mem){
#pragma HLS array_partition variable = dp_mem type = complete dim = 0
	for (int i = 0; i < PE_NUM + 1; i++){
#pragma HLS unroll
		dp_mem[i][2] = dp_mem[i][1];
		dp_mem[i][1] = dp_mem[i][0];
	}
}

void Align::UpdateDPMemSet(dp_mem_block_t &dp_mem, idx_t i, chunk_col_scores_inf_t &init_col_scr, score_vec_t (&init_row_scr)[MAX_REFERENCE_LENGTH] ){
#pragma HLS array_partition variable = dp_mem type = complete dim = 0

	if (i < MAX_REFERENCE_LENGTH){  // FIXME: Actually this could also be actual_reference_length
		dp_mem[0][1] = init_row_scr[i];
	}
	
	// Set the computation for the 0th column
	if (i < PE_NUM){
		dp_mem[i][2] = init_col_scr[i];  // set initial diagonal score
		dp_mem[i+1][1] = init_col_scr[i+1];  // set initial left score
	}

	// FIXME: Set i = 0 case in Chunk compute loop, doesn't requires an update
}
