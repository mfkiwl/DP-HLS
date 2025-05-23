#ifndef SYNTH
#include "../../include/frontend.h"
#else
#include "frontend.h"
#endif

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define MIN(a, b) ((a) < (b) ? (a) : (b))

// >>> Global Two Piece Affine Implementation >>>
void BandingGlobalTwoPieceAffine::PE::Compute(char_t local_query_val,
                               char_t local_reference_val,
                               score_vec_t up_prev,
                               score_vec_t diag_prev,
                               score_vec_t left_prev,
                               const Penalties penalties,
                               score_vec_t &write_score,
                               tbp_t &write_traceback)
{
    /*
     * Layer 0: Insert matrix I, moves horizontally
     * Layer 1: Match matrix M, moves diagonally
     * Layer 2: Delete matrix D, moves vertically
     * Layer 3: Long insert matrix I', moves horizontally
     * Layer 4: Long delete matrix D', moves vertically
     */

    const type_t insert_open = left_prev[1] + penalties.open + penalties.extend; // Insert open
    const type_t insert_extend = left_prev[0] + penalties.extend;                  // insert extend
    const type_t long_insert_open = left_prev[1] + penalties.long_open + penalties.long_extend;
    const type_t long_insert_extend = left_prev[3] + penalties.long_extend;
    
    const type_t delete_open = up_prev[1] + penalties.open + penalties.extend;   // delete open
    const type_t delete_extend = up_prev[2] + penalties.extend;                    // delete extend
    const type_t long_delete_open = up_prev[1] + penalties.long_open + penalties.long_extend;
    const type_t long_delete_extend = up_prev[4] + penalties.long_extend;

#ifdef CMAKEDEBUG
    auto insert_open_s = insert_open.to_float();     // Insert open
    auto insert_extend_s = insert_extend.to_float(); // insert extend
    auto delete_open_s = delete_open.to_float();
    auto delete_extend_s = delete_extend.to_float();

    auto left_prev_0_s = left_prev[0].to_float();
    auto left_prev_1_s = left_prev[1].to_float();
    auto left_prev_2_s = left_prev[2].to_float();
    auto up_prev_0_s = up_prev[0].to_float();
    auto up_prev_1_s = up_prev[1].to_float();
    auto up_prev_2_s = up_prev[2].to_float();
#endif

    tbp_t tbp_temp = 0b0000000;

    type_t insert_r, long_insert_r, delete_r, long_delete_r;
    if (insert_open < insert_extend){
        insert_r = insert_extend;
        tbp_temp += TB_INS_EXTEND;
    } else {
        insert_r = insert_open;
    }

    if (delete_open < delete_extend){
        delete_r = delete_extend;
        tbp_temp += TB_DEL_EXTEND;
    } else {
        delete_r = delete_open;
    }

    if (long_insert_open < long_insert_extend){
        long_insert_r = long_insert_extend;
        tbp_temp += TB_LONG_INS_EXTEND;
    } else {
        long_insert_r = long_insert_open;
    }

    if (long_delete_open < long_delete_extend){
        long_delete_r = long_delete_extend;
        tbp_temp += TB_LONG_DEL_EXTEND;
    } else {
        long_delete_r = long_delete_open;
    }


#ifdef CMAKEDEBUG
    auto write_score_0_s = write_score[0].to_float();
    auto write_score_2_s = write_score[2].to_float();
#endif

    const type_t match = (local_query_val == local_reference_val) ? diag_prev[1] + penalties.match : diag_prev[1] + penalties.mismatch;

#ifdef CMAKEDEBUG
    auto diag_prev_s = diag_prev[1].to_float();
    auto local_query_val_s = local_query_val.to_int();
    auto local_reference_val_s = local_reference_val.to_int();
#endif

#ifdef CMAKEDEBUG
    auto match_s = match.to_float();
    auto write_score_1_s = write_score[1].to_float();
#endif

    // compare insertion and deletion matrices 
    type_t max_value = match;
    tbp_t dir_bit = TB_MAIN;

    // Set traceback pointer based on the direction of the maximum score.
    if (max_value < long_insert_r)
    {
        max_value = long_insert_r;
        dir_bit = TB_LONG_INSERT;
    }
    if (max_value < long_delete_r)
    {
        max_value = long_delete_r;
        dir_bit = TB_LONG_DELETE;
    }
    if (max_value < insert_r)
    {
        max_value = insert_r;
        dir_bit = TB_INSERT;
    }
    if (max_value < delete_r)
    {
        max_value = delete_r;
        dir_bit = TB_DELETE;
    }

    write_score =   {insert_r, max_value, delete_r, long_insert_r, long_delete_r};  // write score to the main matrix should be the max score, not match score
    write_traceback = tbp_temp | dir_bit; //insert_tb + delete_tb + long_insert_tb + long_delete_tb;
}

void BandingGlobalTwoPieceAffine::Helper::InitCol(score_vec_t (&init_col_scr)[MAX_QUERY_LENGTH], Penalties penalties){
    type_t gap = penalties.open;
    type_t long_gap = penalties.long_open;
    for (int i = 0; i < MAX_QUERY_LENGTH; i++){
        gap += penalties.extend;
        long_gap += penalties.long_extend;
        init_col_scr[i] = score_vec_t({NINF,MAX(gap,long_gap),NINF,NINF, NINF});
    }
}

void BandingGlobalTwoPieceAffine::Helper::InitRow(score_vec_t (&init_row_scr)[MAX_REFERENCE_LENGTH], Penalties penalties){
    type_t gap = penalties.open;
    type_t long_gap = penalties.long_open;
    for (int i = 0; i < MAX_REFERENCE_LENGTH; i++){
        gap += penalties.extend;
        long_gap += penalties.long_extend;
#ifdef CMAKEDEBUG
        float gap_f = gap.to_float();
#endif
        init_row_scr[i] = score_vec_t({NINF,MAX(gap,long_gap),NINF,NINF,NINF});
    }
}   

void BandingGlobalTwoPieceAffine::InitializeScores(
    score_vec_t (&init_col_scr)[MAX_QUERY_LENGTH],
    score_vec_t (&init_row_scr)[MAX_REFERENCE_LENGTH],
    Penalties penalties)
{

    Helper::InitCol(init_col_scr, penalties);
    Helper::InitRow(init_row_scr, penalties);
}

void BandingGlobalTwoPieceAffine::UpdatePEMaximum(
        const wavefront_scores_inf_t scores,
        ScorePack (&max)[PE_NUM],
        const idx_t chunk_row_offset, const idx_t wavefront,
        const idx_t p_cols, const idx_t ck_idx,
        const bool (&predicate)[PE_NUM],
        const idx_t query_len, const idx_t ref_len){

}

void BandingGlobalTwoPieceAffine::InitializeMaxScores(ScorePack (&max)[PE_NUM], idx_t qry_len, idx_t ref_len)
{
    for (int i = 0; i < PE_NUM; i++)
    {
#pragma HLS unroll
        max[i].score = NINF;
        max[i].p_col = 0;
        max[i].ck = 0;
    }
    idx_t max_pe = (qry_len - 1) % PE_NUM;
    idx_t max_ck = (qry_len - 1)  / PE_NUM;
    max[max_pe].score = INF;
    max[max_pe].p_col = (max_ck) * (MAX_REFERENCE_LENGTH + PE_NUM - 1) + max_pe + ref_len - 1;
    max[max_pe].ck = max_ck;
}

void BandingGlobalTwoPieceAffine::Traceback::StateMapping(tbp_t tbp, TB_STATE &state, tbr_t &navigation)
{
    if (state == TB_STATE::MM)
    {
        if (tbp(2, 0) == TB_MAIN)
        {
            navigation = AL_MMI;
        }
        else if (tbp(2, 0) == TB_DELETE)
        {
            state = TB_STATE::DEL;
            navigation = AL_NULL;
        }
        else if (tbp(2, 0) == TB_INSERT)
        {
            state = TB_STATE::INS;
            navigation = AL_NULL;
        }
        else if (tbp(2, 0) == TB_LONG_DELETE)
        {
            state = TB_STATE::LONG_DEL;
            navigation = AL_NULL;
        }
        else if (tbp(2, 0) == TB_LONG_INSERT)
        {
            state = TB_STATE::LONG_INS;
            navigation = AL_NULL;
        } 
        else {
#ifdef CMAKEDEBUG
            // call an runtime error
            std::runtime_error("unknown direction");
#endif
        }
    }
    else if (state == TB_STATE::DEL)
    {
        if ((bool) tbp[5] != 1)
        {
            state = TB_STATE::MM;
        }
        // otherwise remain in the same state/matrix
        navigation = AL_DEL;
    }
    else if (state == TB_STATE::INS)
    {
        if ((bool) tbp[3] != 1)
        {
            state = TB_STATE::MM; // set the state back to MM
        }
        // otherwise remain in the same state/matrix
        navigation = AL_INS;
    }
    else if (state == TB_STATE::LONG_INS) 
    {  
        if ((bool) tbp[4] != 1) 
        {
            state = TB_STATE::MM;
        }
        // otherwise stay in the long insertion state
        navigation = AL_INS;
    }
    else if (state == TB_STATE::LONG_DEL)
    {
        if ((bool) tbp[6] != 1) 
        {
            state = TB_STATE::MM;
        }

        // otherwise stay in the long deletion state
        navigation = AL_DEL;

    }
    else
    {
        // Unknown State
// #ifdef CMAKEDEBUG
//         throw std::runtime_error("Unknown traceback state.");
// #endif
    }
    // std::cout << "NAVIGATION IS " << navigation << std::endl;
}

void BandingBandingGlobalTwoPieceAffine::Traceback::StateInit(tbp_t tbp, TB_STATE &state)
{
    if (tbp(1, 0) == TB_MAIN)
    {
        state = TB_STATE::MM;
    }
    else if (tbp(1, 0) == TB_INSERT)
    {
        state = TB_STATE::INS;
    }
    else if (tbp(1, 0) == TB_DELETE)
    {
        state = TB_STATE::DEL;
    }
    else if (tbp == TB_LONG_INSERT)
    {
        state = TB_STATE::LONG_INS;
    }
    else if (tbp == TB_LONG_DELETE)
    {
        state = TB_STATE::LONG_DEL;
    }
    else
    {
        // Unknown State
    }
}
// <<< Global Two Piece Affine Implementation <<<
