// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
// Version: 2022.1
// Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module seq_align_multiple_seq_align_Pipeline_VITIS_LOOP_308_11 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        max,
        index,
        max_score_64_reload,
        max_score_65_reload,
        max_score_66_reload,
        max_score_67_reload,
        max_score_68_reload,
        max_score_69_reload,
        max_score_70_reload,
        max_score_71_reload,
        max_score_72_reload,
        max_score_73_reload,
        max_score_74_reload,
        max_score_75_reload,
        max_score_76_reload,
        max_score_77_reload,
        max_score_78_reload,
        max_score_79_reload,
        max_score_80_reload,
        max_score_81_reload,
        max_score_82_reload,
        max_score_83_reload,
        max_score_84_reload,
        max_score_85_reload,
        max_score_86_reload,
        max_score_87_reload,
        max_score_88_reload,
        max_score_89_reload,
        max_score_90_reload,
        max_score_91_reload,
        max_score_92_reload,
        max_score_93_reload,
        max_score_94_reload,
        max_score_95_reload,
        max_1_out,
        max_1_out_ap_vld,
        index_1_out,
        index_1_out_ap_vld
);

parameter    ap_ST_fsm_pp0_stage0 = 1'd1;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [31:0] max;
input  [31:0] index;
input  [31:0] max_score_64_reload;
input  [31:0] max_score_65_reload;
input  [31:0] max_score_66_reload;
input  [31:0] max_score_67_reload;
input  [31:0] max_score_68_reload;
input  [31:0] max_score_69_reload;
input  [31:0] max_score_70_reload;
input  [31:0] max_score_71_reload;
input  [31:0] max_score_72_reload;
input  [31:0] max_score_73_reload;
input  [31:0] max_score_74_reload;
input  [31:0] max_score_75_reload;
input  [31:0] max_score_76_reload;
input  [31:0] max_score_77_reload;
input  [31:0] max_score_78_reload;
input  [31:0] max_score_79_reload;
input  [31:0] max_score_80_reload;
input  [31:0] max_score_81_reload;
input  [31:0] max_score_82_reload;
input  [31:0] max_score_83_reload;
input  [31:0] max_score_84_reload;
input  [31:0] max_score_85_reload;
input  [31:0] max_score_86_reload;
input  [31:0] max_score_87_reload;
input  [31:0] max_score_88_reload;
input  [31:0] max_score_89_reload;
input  [31:0] max_score_90_reload;
input  [31:0] max_score_91_reload;
input  [31:0] max_score_92_reload;
input  [31:0] max_score_93_reload;
input  [31:0] max_score_94_reload;
input  [31:0] max_score_95_reload;
output  [31:0] max_1_out;
output   max_1_out_ap_vld;
output  [31:0] index_1_out;
output   index_1_out_ap_vld;

reg ap_idle;
reg max_1_out_ap_vld;
reg index_1_out_ap_vld;

(* fsm_encoding = "none" *) reg   [0:0] ap_CS_fsm;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_enable_reg_pp0_iter0;
reg    ap_enable_reg_pp0_iter1;
reg    ap_idle_pp0;
wire    ap_block_state1_pp0_stage0_iter0;
wire    ap_block_state2_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_subdone;
wire   [0:0] icmp_ln308_fu_348_p2;
reg    ap_condition_exit_pp0_iter1_stage0;
wire    ap_loop_exit_ready;
reg    ap_ready_int;
wire    ap_block_pp0_stage0_11001;
reg   [31:0] index_1_fu_100;
wire   [31:0] select_ln311_fu_418_p3;
wire    ap_loop_init;
wire    ap_block_pp0_stage0;
reg   [31:0] max_1_fu_104;
wire   [31:0] select_ln311_1_fu_426_p3;
reg   [5:0] r_fu_108;
wire   [5:0] add_ln308_fu_354_p2;
wire    ap_block_pp0_stage0_01001;
wire   [31:0] tmp_4_fu_366_p34;
wire   [4:0] trunc_ln311_fu_410_p1;
wire   [0:0] icmp_ln311_fu_404_p2;
wire   [31:0] zext_ln311_fu_414_p1;
reg    ap_done_reg;
wire    ap_continue_int;
reg    ap_done_int;
reg   [0:0] ap_NS_fsm;
wire    ap_enable_pp0;
wire    ap_start_int;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 1'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_done_reg = 1'b0;
end

seq_align_multiple_mux_326_32_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .din2_WIDTH( 32 ),
    .din3_WIDTH( 32 ),
    .din4_WIDTH( 32 ),
    .din5_WIDTH( 32 ),
    .din6_WIDTH( 32 ),
    .din7_WIDTH( 32 ),
    .din8_WIDTH( 32 ),
    .din9_WIDTH( 32 ),
    .din10_WIDTH( 32 ),
    .din11_WIDTH( 32 ),
    .din12_WIDTH( 32 ),
    .din13_WIDTH( 32 ),
    .din14_WIDTH( 32 ),
    .din15_WIDTH( 32 ),
    .din16_WIDTH( 32 ),
    .din17_WIDTH( 32 ),
    .din18_WIDTH( 32 ),
    .din19_WIDTH( 32 ),
    .din20_WIDTH( 32 ),
    .din21_WIDTH( 32 ),
    .din22_WIDTH( 32 ),
    .din23_WIDTH( 32 ),
    .din24_WIDTH( 32 ),
    .din25_WIDTH( 32 ),
    .din26_WIDTH( 32 ),
    .din27_WIDTH( 32 ),
    .din28_WIDTH( 32 ),
    .din29_WIDTH( 32 ),
    .din30_WIDTH( 32 ),
    .din31_WIDTH( 32 ),
    .din32_WIDTH( 6 ),
    .dout_WIDTH( 32 ))
mux_326_32_1_1_U679(
    .din0(max_score_64_reload),
    .din1(max_score_65_reload),
    .din2(max_score_66_reload),
    .din3(max_score_67_reload),
    .din4(max_score_68_reload),
    .din5(max_score_69_reload),
    .din6(max_score_70_reload),
    .din7(max_score_71_reload),
    .din8(max_score_72_reload),
    .din9(max_score_73_reload),
    .din10(max_score_74_reload),
    .din11(max_score_75_reload),
    .din12(max_score_76_reload),
    .din13(max_score_77_reload),
    .din14(max_score_78_reload),
    .din15(max_score_79_reload),
    .din16(max_score_80_reload),
    .din17(max_score_81_reload),
    .din18(max_score_82_reload),
    .din19(max_score_83_reload),
    .din20(max_score_84_reload),
    .din21(max_score_85_reload),
    .din22(max_score_86_reload),
    .din23(max_score_87_reload),
    .din24(max_score_88_reload),
    .din25(max_score_89_reload),
    .din26(max_score_90_reload),
    .din27(max_score_91_reload),
    .din28(max_score_92_reload),
    .din29(max_score_93_reload),
    .din30(max_score_94_reload),
    .din31(max_score_95_reload),
    .din32(r_fu_108),
    .dout(tmp_4_fu_366_p34)
);

seq_align_multiple_flow_control_loop_pipe_sequential_init flow_control_loop_pipe_sequential_init_U(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(ap_start),
    .ap_ready(ap_ready),
    .ap_done(ap_done),
    .ap_start_int(ap_start_int),
    .ap_loop_init(ap_loop_init),
    .ap_ready_int(ap_ready_int),
    .ap_loop_exit_ready(ap_condition_exit_pp0_iter1_stage0),
    .ap_loop_exit_done(ap_done_int),
    .ap_continue_int(ap_continue_int),
    .ap_done_int(ap_done_int)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
        end else if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_exit_pp0_iter1_stage0)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter1 <= ap_start_int;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            index_1_fu_100 <= index;
        end else if (((icmp_ln308_fu_348_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            index_1_fu_100 <= select_ln311_fu_418_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            max_1_fu_104 <= max;
        end else if (((icmp_ln308_fu_348_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            max_1_fu_104 <= select_ln311_1_fu_426_p3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((ap_loop_init == 1'b1)) begin
            r_fu_108 <= 6'd0;
        end else if (((icmp_ln308_fu_348_p2 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
            r_fu_108 <= add_ln308_fu_354_p2;
        end
    end
end

always @ (*) begin
    if (((icmp_ln308_fu_348_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b1;
    end else begin
        ap_condition_exit_pp0_iter1_stage0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_loop_exit_ready == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_done_int = 1'b1;
    end else begin
        ap_done_int = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start_int == 1'b0) & (ap_idle_pp0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_ready_int = 1'b1;
    end else begin
        ap_ready_int = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln308_fu_348_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        index_1_out_ap_vld = 1'b1;
    end else begin
        index_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln308_fu_348_p2 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        max_1_out_ap_vld = 1'b1;
    end else begin
        max_1_out_ap_vld = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_pp0_stage0 : begin
            ap_NS_fsm = ap_ST_fsm_pp0_stage0;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln308_fu_354_p2 = (r_fu_108 + 6'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_01001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state1_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_reg_pp0_iter0 = ap_start_int;

assign ap_loop_exit_ready = ap_condition_exit_pp0_iter1_stage0;

assign icmp_ln308_fu_348_p2 = ((r_fu_108 == 6'd32) ? 1'b1 : 1'b0);

assign icmp_ln311_fu_404_p2 = (($signed(max_1_fu_104) < $signed(tmp_4_fu_366_p34)) ? 1'b1 : 1'b0);

assign index_1_out = index_1_fu_100;

assign max_1_out = max_1_fu_104;

assign select_ln311_1_fu_426_p3 = ((icmp_ln311_fu_404_p2[0:0] == 1'b1) ? tmp_4_fu_366_p34 : max_1_fu_104);

assign select_ln311_fu_418_p3 = ((icmp_ln311_fu_404_p2[0:0] == 1'b1) ? zext_ln311_fu_414_p1 : index_1_fu_100);

assign trunc_ln311_fu_410_p1 = r_fu_108[4:0];

assign zext_ln311_fu_414_p1 = trunc_ln311_fu_410_p1;

endmodule //seq_align_multiple_seq_align_Pipeline_VITIS_LOOP_308_11
