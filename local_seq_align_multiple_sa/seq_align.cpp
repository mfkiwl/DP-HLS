#include <hls_stream.h>
#include <ap_int.h>
#include <ap_fixed.h>


#include "params.h"
#include "seq_align_multiple.h"
#include "seq_align.h"
#include "PE.h"
#include "shift_reg.h"

using namespace hls;


void SeqAlign::align(stream<ap_uint<2>, query_length> &query_stream, stream<ap_uint<2>, ref_length> &reference_stream, type_t &dummy)
{
	const type_t zero_fp = 0;

	type_t temp = 0;

	// those registers are used to hold the last_pe_score values so it can be passed into the first PE. 
	// The first PE has the parameter of the type ShiftRegister<type_t, 2>
	ShiftRegister<type_t, 2> phoney_pe;
	ShiftRegister<type_t, 1> phoney_pe_Ix; 

	type_t dp_matrix[query_length][ref_length];  // declare dp matrix

	// declare the last_pe_score even and odd fifo, because 
	// a process cannot read and write to the same fifo. 
	stream<ap_fixed<M, N>, ref_length> last_pe_score[2];
	stream<ap_fixed<M, N>, ref_length> last_pe_score_Ix[2];
	stream<ap_fixed<M, N>, ref_length> ab_reference_stream[2];  // we need to backup reference stream after processing each chunk

	// initialize the last_pe_score fifo
	for (int i = 0; i < ref_length; i++) {
		last_pe_score[0].write(zero_fp);
		last_pe_score_Ix[0].write(zero_fp);
		ab_reference_stream[0].write(reference_stream.read());
	}

	// initialize the dp matrix to 0
	for (int pp = 0; pp < query_length; pp++) {
		for (int rr = 0; rr < ref_length; rr++) {
			dp_matrix[pp][rr] = 0;
		}
	}


#pragma HLS ARRAY_PARTITION variable=dp_matrix dim=1 cyclic factor=16

	ShiftRegister<ap_uint<2>, PE_num> query;  // query shift register is used to hold a segment of query
	ShiftRegister<ap_uint<2>, PE_num> reference;  // reference shift register is used to hold a segment of reference

	AffinePE PE_group[PE_num];  // declare PE_num PEs in an array

#pragma HLS ARRAY_PARTITION variable=PE_group dim=1 type=complete


	// iterating through the chunks
compute_block:
	for (int qq = 0; qq < query_chunks; qq++) {


		int predicate = 1;  // used to index the pre-triangles and post-triangles


		// beginning loops
	compute_row_pre:
		for (int ii = 0; ii < PE_num - 1; ii++) {
#pragma HLS PIPELINE II=1

			reference.shift(ab_reference_stream[qq % 2].read());  // populate the reference shift register, one element per iteration of the wavefront. 
			ab_reference_stream[(qq+1) % 2].write(reference[0]);  // backup the reference stream


			phoney_pe.shift(last_pe_score[qq % 2].read());  // populate the phoney registers for PE[0]
			phoney_pe_Ix.shift(last_pe_score_Ix[qq % 2].read());
			
			query.shift(query_stream.read());  // populate the query stream


			PE_group[0].compute(reference[0], query[0], phoney_pe, phoney_pe_Ix, &dp_matrix[qq * PE_num][ii]);  // PE[0] compute



		pe_expand_pre:  // compute with the rest of the PEs
			for (int kk = 1; kk < PE_num; kk++) {
#pragma HLS UNROLL

				PE_group[kk].compute(reference[kk], query[kk], PE_group[kk-1].score_reg,
					PE_group[kk-1].Ix_reg, &dp_matrix[kk + qq * PE_num][ii - kk]);
			}

			// update the PE[s] accordingly. 
			for (int kk = 0; kk < predicate; kk++) {
#pragma HLS unroll factor=PE_num
				PE_group[kk].update();
			}

			++predicate;

		}

		// shifting while no predicate change is needed
		compute_row_mid:
		for (int ii = PE_num - 1; ii < ref_length; ii++) {  // ii index wavefront  32 - 1024 iterations

#pragma HLS PIPELINE II=1


			reference.shift(ab_reference_stream[qq % 2].read());  // update reference shift register
			ab_reference_stream[(qq+1) % 2].write(reference[0]);  // copy the reference stream


			phoney_pe.shift(last_pe_score[qq % 2].read());
			phoney_pe_Ix.shift(last_pe_score_Ix[qq % 2].read());

			PE_group[0].compute(reference[0], query[0], phoney_pe, phoney_pe_Ix, &dp_matrix[qq * PE_num][ii]);



		pe_expand_mid:
			for (int kk = 1; kk < PE_num; kk++) {  // for each PE, indexed by kk
#pragma HLS UNROLL

				PE_group[kk].compute(reference[kk], query[kk], PE_group[kk].score_reg,
					PE_group[kk - 1].Ix_reg, &dp_matrix[kk + qq * PE_num][ii - kk]);

			}

			for (int kk = 0; kk < PE_num; kk++) {
#pragma HLS unroll
				PE_group[kk].update();
			}

			last_pe_score[(qq+1) % 2].write(PE_group[PE_num - 1].score_reg[0]);
			last_pe_score_Ix[(qq+1) % 2].write(PE_group[PE_num - 1].Ix_reg[0]);
		}

		predicate = 1;

	compute_row_post:
		for (int ii = ref_length; ii < PE_num + ref_length - 1; ii++) {
#pragma HLS PIPELINE II=1

			reference.shift(0);
			query.shift(0);

		pe_expand_post:
			for (int kk = 1; kk < PE_num; kk++) {  
#pragma HLS UNROLL

				PE_group[kk].compute(reference[kk], query[kk], PE_group[kk-1].score_reg,
					PE_group[kk - 1].Ix_reg, &dp_matrix[kk + qq * PE_num][ii - kk]);

			}

			for (int kk = predicate; kk < PE_num; kk++) {
#pragma HLS UNROLL factor=PE_num
				PE_group[kk].update();
			}

			++predicate;

			last_pe_score[(qq+1) % 2].write(PE_group[PE_num - 1].score_reg[0]);
			last_pe_score_Ix[(qq+1) % 2].write(PE_group[PE_num - 1].Ix_reg[0]);
		}
	}

// Need to clean the rest of the FIFO or the CoSim would hang
	for (int i = 0; i < ref_length; i++) {
#pragma HLS unroll
		last_pe_score[(query_chunks + 1) % 2].read();
		last_pe_score_Ix[(query_chunks+1) % 2].read();
		ab_reference_stream[(query_chunks + 1) % 2].read();
	}

	type_t max_dp = 0;
	int max_row_value;
	int max_col_value;

pe1:
	for (int x = 0; x < query_length; x++) {

	pe2:
		for (int y = 0; y < ref_length; y++) {

			if (dp_matrix[x][y] > 0) {
				max_dp = dp_matrix[x][y];
				max_row_value = x;
				max_col_value = y;
			}

		}

	}

	type_t max_score = dp_matrix[max_row_value][max_col_value];
	dummy = max_score;

}
