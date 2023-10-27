// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module seq_align_multiple_seq_align_Pipeline_VITIS_LOOP_213_7 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        reference_string_comp_0_TVALID,
        reference_string_comp_0_TDATA,
        reference_string_comp_0_TREADY,
        local_reference_address0,
        local_reference_ce0,
        local_reference_we0,
        local_reference_d0,
        local_reference_1_address0,
        local_reference_1_ce0,
        local_reference_1_we0,
        local_reference_1_d0,
        local_reference_2_address0,
        local_reference_2_ce0,
        local_reference_2_we0,
        local_reference_2_d0,
        local_reference_3_address0,
        local_reference_3_ce0,
        local_reference_3_we0,
        local_reference_3_d0,
        local_reference_4_address0,
        local_reference_4_ce0,
        local_reference_4_we0,
        local_reference_4_d0,
        local_reference_5_address0,
        local_reference_5_ce0,
        local_reference_5_we0,
        local_reference_5_d0,
        local_reference_6_address0,
        local_reference_6_ce0,
        local_reference_6_we0,
        local_reference_6_d0,
        local_reference_7_address0,
        local_reference_7_ce0,
        local_reference_7_we0,
        local_reference_7_d0,
        local_reference_8_address0,
        local_reference_8_ce0,
        local_reference_8_we0,
        local_reference_8_d0,
        local_reference_9_address0,
        local_reference_9_ce0,
        local_reference_9_we0,
        local_reference_9_d0,
        local_reference_10_address0,
        local_reference_10_ce0,
        local_reference_10_we0,
        local_reference_10_d0,
        local_reference_11_address0,
        local_reference_11_ce0,
        local_reference_11_we0,
        local_reference_11_d0,
        local_reference_12_address0,
        local_reference_12_ce0,
        local_reference_12_we0,
        local_reference_12_d0,
        local_reference_13_address0,
        local_reference_13_ce0,
        local_reference_13_we0,
        local_reference_13_d0,
        local_reference_14_address0,
        local_reference_14_ce0,
        local_reference_14_we0,
        local_reference_14_d0,
        local_reference_15_address0,
        local_reference_15_ce0,
        local_reference_15_we0,
        local_reference_15_d0
);

parameter    ap_ST_fsm_state1 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input   reference_string_comp_0_TVALID;
input  [7:0] reference_string_comp_0_TDATA;
output   reference_string_comp_0_TREADY;
output  [5:0] local_reference_address0;
output   local_reference_ce0;
output   local_reference_we0;
output  [7:0] local_reference_d0;
output  [5:0] local_reference_1_address0;
output   local_reference_1_ce0;
output   local_reference_1_we0;
output  [7:0] local_reference_1_d0;
output  [5:0] local_reference_2_address0;
output   local_reference_2_ce0;
output   local_reference_2_we0;
output  [7:0] local_reference_2_d0;
output  [5:0] local_reference_3_address0;
output   local_reference_3_ce0;
output   local_reference_3_we0;
output  [7:0] local_reference_3_d0;
output  [5:0] local_reference_4_address0;
output   local_reference_4_ce0;
output   local_reference_4_we0;
output  [7:0] local_reference_4_d0;
output  [5:0] local_reference_5_address0;
output   local_reference_5_ce0;
output   local_reference_5_we0;
output  [7:0] local_reference_5_d0;
output  [5:0] local_reference_6_address0;
output   local_reference_6_ce0;
output   local_reference_6_we0;
output  [7:0] local_reference_6_d0;
output  [5:0] local_reference_7_address0;
output   local_reference_7_ce0;
output   local_reference_7_we0;
output  [7:0] local_reference_7_d0;
output  [5:0] local_reference_8_address0;
output   local_reference_8_ce0;
output   local_reference_8_we0;
output  [7:0] local_reference_8_d0;
output  [5:0] local_reference_9_address0;
output   local_reference_9_ce0;
output   local_reference_9_we0;
output  [7:0] local_reference_9_d0;
output  [5:0] local_reference_10_address0;
output   local_reference_10_ce0;
output   local_reference_10_we0;
output  [7:0] local_reference_10_d0;
output  [5:0] local_reference_11_address0;
output   local_reference_11_ce0;
output   local_reference_11_we0;
output  [7:0] local_reference_11_d0;
output  [5:0] local_reference_12_address0;
output   local_reference_12_ce0;
output   local_reference_12_we0;
output  [7:0] local_reference_12_d0;
output  [5:0] local_reference_13_address0;
output   local_reference_13_ce0;
output   local_reference_13_we0;
output  [7:0] local_reference_13_d0;
output  [5:0] local_reference_14_address0;
output   local_reference_14_ce0;
output   local_reference_14_we0;
output  [7:0] local_reference_14_d0;
output  [5:0] local_reference_15_address0;
output   local_reference_15_ce0;
output   local_reference_15_we0;
output  [7:0] local_reference_15_d0;

reg ap_idle;
reg reference_string_comp_0_TREADY;
reg local_reference_ce0;
reg local_reference_we0;
reg local_reference_1_ce0;
reg local_reference_1_we0;
reg local_reference_2_ce0;
reg local_reference_2_we0;
reg local_reference_3_ce0;
reg local_reference_3_we0;
reg local_reference_4_ce0;
reg local_reference_4_we0;
reg local_reference_5_ce0;
reg local_reference_5_we0;
reg local_reference_6_ce0;
reg local_reference_6_we0;
reg local_reference_7_ce0;
reg local_reference_7_we0;
reg local_reference_8_ce0;
reg local_reference_8_we0;
reg local_reference_9_ce0;
reg local_reference_9_we0;
reg local_reference_10_ce0;
reg local_reference_10_we0;
reg local_reference_11_ce0;
reg local_reference_11_we0;
reg local_reference_12_ce0;
reg local_reference_12_we0;
reg local_reference_13_ce0;
reg local_reference_13_we0;
reg local_reference_14_ce0;
reg local_reference_14_we0;
reg local_reference_15_ce0;
reg local_reference_15_we0;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [0:0] icmp_ln213_fu_348_p2;
reg    ap_block_state1_pp0_stage0_iter0;
reg    ap_condition_exit_pp0_iter0_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
reg    reference_string_comp_0_TDATA_blk_n;
wire   [63:0] zext_ln215_fu_370_p1;
reg   [10:0] i_1_fu_106;
wire   [10:0] add_ln213_fu_354_p2;
wire    ap_loop_init;
reg   [10:0] ap_sig_allocacmp_i;
wire   [3:0] trunc_ln215_fu_390_p1;
wire   [5:0] lshr_ln_fu_360_p4;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
reg    ap_ST_fsm_state1_blk;
wire    ap_start_int;
reg    ap_condition_530;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_done_reg = 1'b0;
end

seq_align_multiple_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue_int == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_condition_530)) begin
        if ((icmp_ln213_fu_348_p2 == 1'd0)) begin
            i_1_fu_106 <= add_ln213_fu_354_p2;
        end else if ((ap_loop_init == 1'b1)) begin
            i_1_fu_106 <= 11'd0;
        end
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0)))) begin
        ap_ST_fsm_state1_blk = 1'b1;
    end else begin
        ap_ST_fsm_state1_blk = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (icmp_ln213_fu_348_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter0_stage0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (ap_loop_exit_ready == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_init == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_sig_allocacmp_i = 11'd0;
    end else begin
        ap_sig_allocacmp_i = i_1_fu_106;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_10_ce0 = 1'b1;
    end else begin
        local_reference_10_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd10) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_10_we0 = 1'b1;
    end else begin
        local_reference_10_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_11_ce0 = 1'b1;
    end else begin
        local_reference_11_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd11) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_11_we0 = 1'b1;
    end else begin
        local_reference_11_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_12_ce0 = 1'b1;
    end else begin
        local_reference_12_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd12) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_12_we0 = 1'b1;
    end else begin
        local_reference_12_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_13_ce0 = 1'b1;
    end else begin
        local_reference_13_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd13) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_13_we0 = 1'b1;
    end else begin
        local_reference_13_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_14_ce0 = 1'b1;
    end else begin
        local_reference_14_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd14) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_14_we0 = 1'b1;
    end else begin
        local_reference_14_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_15_ce0 = 1'b1;
    end else begin
        local_reference_15_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd15) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_15_we0 = 1'b1;
    end else begin
        local_reference_15_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_1_ce0 = 1'b1;
    end else begin
        local_reference_1_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd1) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_1_we0 = 1'b1;
    end else begin
        local_reference_1_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_2_ce0 = 1'b1;
    end else begin
        local_reference_2_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd2) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_2_we0 = 1'b1;
    end else begin
        local_reference_2_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_3_ce0 = 1'b1;
    end else begin
        local_reference_3_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd3) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_3_we0 = 1'b1;
    end else begin
        local_reference_3_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_4_ce0 = 1'b1;
    end else begin
        local_reference_4_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd4) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_4_we0 = 1'b1;
    end else begin
        local_reference_4_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_5_ce0 = 1'b1;
    end else begin
        local_reference_5_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd5) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_5_we0 = 1'b1;
    end else begin
        local_reference_5_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_6_ce0 = 1'b1;
    end else begin
        local_reference_6_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd6) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_6_we0 = 1'b1;
    end else begin
        local_reference_6_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_7_ce0 = 1'b1;
    end else begin
        local_reference_7_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd7) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_7_we0 = 1'b1;
    end else begin
        local_reference_7_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_8_ce0 = 1'b1;
    end else begin
        local_reference_8_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd8) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_8_we0 = 1'b1;
    end else begin
        local_reference_8_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_9_ce0 = 1'b1;
    end else begin
        local_reference_9_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd9) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_9_we0 = 1'b1;
    end else begin
        local_reference_9_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_ce0 = 1'b1;
    end else begin
        local_reference_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (trunc_ln215_fu_390_p1 == 4'd0) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        local_reference_we0 = 1'b1;
    end else begin
        local_reference_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b1) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        reference_string_comp_0_TDATA_blk_n = reference_string_comp_0_TVALID;
    end else begin
        reference_string_comp_0_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (icmp_ln213_fu_348_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state1))) begin
        reference_string_comp_0_TREADY = 1'b1;
    end else begin
        reference_string_comp_0_TREADY = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln213_fu_354_p2 = (ap_sig_allocacmp_i + 11'd1);

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

always @ (*) begin
    ap_block_state1_pp0_stage0_iter0 = ((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0)));
end

always @ (*) begin
    ap_condition_530 = (~((ap_start_int == 1'b0) | ((icmp_ln213_fu_348_p2 == 1'd0) & (reference_string_comp_0_TVALID == 1'b0))) & (1'b1 == ap_CS_fsm_state1));
end

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;

assign icmp_ln213_fu_348_p2 = ((ap_sig_allocacmp_i == 11'd1024) ? 1'b1 : 1'b0);

assign local_reference_10_address0 = zext_ln215_fu_370_p1;

assign local_reference_10_d0 = reference_string_comp_0_TDATA;

assign local_reference_11_address0 = zext_ln215_fu_370_p1;

assign local_reference_11_d0 = reference_string_comp_0_TDATA;

assign local_reference_12_address0 = zext_ln215_fu_370_p1;

assign local_reference_12_d0 = reference_string_comp_0_TDATA;

assign local_reference_13_address0 = zext_ln215_fu_370_p1;

assign local_reference_13_d0 = reference_string_comp_0_TDATA;

assign local_reference_14_address0 = zext_ln215_fu_370_p1;

assign local_reference_14_d0 = reference_string_comp_0_TDATA;

assign local_reference_15_address0 = zext_ln215_fu_370_p1;

assign local_reference_15_d0 = reference_string_comp_0_TDATA;

assign local_reference_1_address0 = zext_ln215_fu_370_p1;

assign local_reference_1_d0 = reference_string_comp_0_TDATA;

assign local_reference_2_address0 = zext_ln215_fu_370_p1;

assign local_reference_2_d0 = reference_string_comp_0_TDATA;

assign local_reference_3_address0 = zext_ln215_fu_370_p1;

assign local_reference_3_d0 = reference_string_comp_0_TDATA;

assign local_reference_4_address0 = zext_ln215_fu_370_p1;

assign local_reference_4_d0 = reference_string_comp_0_TDATA;

assign local_reference_5_address0 = zext_ln215_fu_370_p1;

assign local_reference_5_d0 = reference_string_comp_0_TDATA;

assign local_reference_6_address0 = zext_ln215_fu_370_p1;

assign local_reference_6_d0 = reference_string_comp_0_TDATA;

assign local_reference_7_address0 = zext_ln215_fu_370_p1;

assign local_reference_7_d0 = reference_string_comp_0_TDATA;

assign local_reference_8_address0 = zext_ln215_fu_370_p1;

assign local_reference_8_d0 = reference_string_comp_0_TDATA;

assign local_reference_9_address0 = zext_ln215_fu_370_p1;

assign local_reference_9_d0 = reference_string_comp_0_TDATA;

assign local_reference_address0 = zext_ln215_fu_370_p1;

assign local_reference_d0 = reference_string_comp_0_TDATA;

assign lshr_ln_fu_360_p4 = {{ap_sig_allocacmp_i[9:4]}};

assign trunc_ln215_fu_390_p1 = ap_sig_allocacmp_i[3:0];

assign zext_ln215_fu_370_p1 = lshr_ln_fu_360_p4;

endmodule //seq_align_multiple_seq_align_Pipeline_VITIS_LOOP_213_7
