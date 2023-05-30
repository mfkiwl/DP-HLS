#include <gmp.h>

#define __gmp_const const

#include <stdio.h>
#include <math.h>
#include "params.h"
#include <cstdlib>
#include <iostream>
#include <ap_int.h>
#include "seq_align_multiple.h"
#include <hls_stream.h>
#include "PE.h"
#include "seq_align.h"

#ifdef DEBUG
#include "debug.h"
#endif // DEBUG




// Link to vitis_hls/2022.2/include

//using namespace std;
using namespace hls;

/*
 IMPORTANT: the indexing of the shift register is shift from smaller index to larger index.
 */
extern "C" {

	void seq_align_multiple(stream<char_t , max_query_length> (&query_string_comp_blocks)[N_BLOCKS],
		stream<char_t , max_reference_length> (&reference_string_comp_blocks)[N_BLOCKS],
		stream<tbp_t, max_reference_length + max_query_length> (&tb_streams)[N_BLOCKS],
		int query_lengths[N_BLOCKS], int reference_lengths[N_BLOCKS],
		type_t dummies[N_BLOCKS]) {

#ifdef DEBUG
	Debugger helper[N_BLOCKS];
	for (int i = 0; i < N_BLOCKS; i++) {
		helper[i] = Debugger("/mnt/c/Users/Yingqi/OneDrive/GitHub/DP-HLS/debug/", "debug_kernel", i);
	}
#endif

#pragma HLS INTERFACE axis port=query_string_comp_blocks
#pragma HLS INTERFACE axis port=reference_string_comp_blocks
#pragma HLS INTERFACE axis port=tb_streams

#pragma HLS array_partition variable=query_string_comp_blocks type=block factor=4 dim=1
#pragma HLS array_partition variable=reference_string_comp_blocks type=block factor=4 dim=1

		type_t dummies_inner[N_BLOCKS];  // actual alignment score, max of the dp matrix

#pragma HLS array_partition variable=dummies type=complete
#pragma HLS array_partition variable=dummies_inner type=complete

		// create alignment group
		ALIGN_TYPE align_group[N_BLOCKS];

		// to be unrolled
		align_expand:
		for (int block_i = 0; block_i < N_BLOCKS; block_i++) {
#pragma HLS unroll
			align_group[block_i].align(
				query_string_comp_blocks[block_i],
				reference_string_comp_blocks[block_i],
				query_lengths[block_i],
				reference_lengths[block_i],
				tb_streams[block_i],
#ifdef DEBUG
				helper[block_i],
#endif
				&dummies_inner[block_i]);
		}

		for (int block_i = 0; block_i < N_BLOCKS; block_i++) {
			dummies[block_i] = dummies_inner[block_i];
		}

	}

}
