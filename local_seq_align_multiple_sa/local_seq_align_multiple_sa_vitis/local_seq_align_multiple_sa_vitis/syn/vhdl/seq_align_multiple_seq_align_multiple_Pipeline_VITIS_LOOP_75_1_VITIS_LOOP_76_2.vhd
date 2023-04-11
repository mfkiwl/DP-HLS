-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2 (64-bit)
-- Version: 2022.2
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity seq_align_multiple_seq_align_multiple_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    dp_matrix_V_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_ce0 : OUT STD_LOGIC;
    dp_matrix_V_we0 : OUT STD_LOGIC;
    dp_matrix_V_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_1_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_1_ce0 : OUT STD_LOGIC;
    dp_matrix_V_1_we0 : OUT STD_LOGIC;
    dp_matrix_V_1_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_2_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_2_ce0 : OUT STD_LOGIC;
    dp_matrix_V_2_we0 : OUT STD_LOGIC;
    dp_matrix_V_2_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_3_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_3_ce0 : OUT STD_LOGIC;
    dp_matrix_V_3_we0 : OUT STD_LOGIC;
    dp_matrix_V_3_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_4_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_4_ce0 : OUT STD_LOGIC;
    dp_matrix_V_4_we0 : OUT STD_LOGIC;
    dp_matrix_V_4_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_5_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_5_ce0 : OUT STD_LOGIC;
    dp_matrix_V_5_we0 : OUT STD_LOGIC;
    dp_matrix_V_5_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_6_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_6_ce0 : OUT STD_LOGIC;
    dp_matrix_V_6_we0 : OUT STD_LOGIC;
    dp_matrix_V_6_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_7_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_7_ce0 : OUT STD_LOGIC;
    dp_matrix_V_7_we0 : OUT STD_LOGIC;
    dp_matrix_V_7_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_8_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_8_ce0 : OUT STD_LOGIC;
    dp_matrix_V_8_we0 : OUT STD_LOGIC;
    dp_matrix_V_8_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_9_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_9_ce0 : OUT STD_LOGIC;
    dp_matrix_V_9_we0 : OUT STD_LOGIC;
    dp_matrix_V_9_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_10_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_10_ce0 : OUT STD_LOGIC;
    dp_matrix_V_10_we0 : OUT STD_LOGIC;
    dp_matrix_V_10_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_11_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_11_ce0 : OUT STD_LOGIC;
    dp_matrix_V_11_we0 : OUT STD_LOGIC;
    dp_matrix_V_11_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_12_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_12_ce0 : OUT STD_LOGIC;
    dp_matrix_V_12_we0 : OUT STD_LOGIC;
    dp_matrix_V_12_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_13_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_13_ce0 : OUT STD_LOGIC;
    dp_matrix_V_13_we0 : OUT STD_LOGIC;
    dp_matrix_V_13_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_14_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_14_ce0 : OUT STD_LOGIC;
    dp_matrix_V_14_we0 : OUT STD_LOGIC;
    dp_matrix_V_14_d0 : OUT STD_LOGIC_VECTOR (8 downto 0);
    dp_matrix_V_15_address0 : OUT STD_LOGIC_VECTOR (7 downto 0);
    dp_matrix_V_15_ce0 : OUT STD_LOGIC;
    dp_matrix_V_15_we0 : OUT STD_LOGIC;
    dp_matrix_V_15_d0 : OUT STD_LOGIC_VECTOR (8 downto 0) );
end;


architecture behav of seq_align_multiple_seq_align_multiple_Pipeline_VITIS_LOOP_75_1_VITIS_LOOP_76_2 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv7_0 : STD_LOGIC_VECTOR (6 downto 0) := "0000000";
    constant ap_const_lv13_0 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000000";
    constant ap_const_lv4_E : STD_LOGIC_VECTOR (3 downto 0) := "1110";
    constant ap_const_lv9_0 : STD_LOGIC_VECTOR (8 downto 0) := "000000000";
    constant ap_const_lv4_D : STD_LOGIC_VECTOR (3 downto 0) := "1101";
    constant ap_const_lv4_C : STD_LOGIC_VECTOR (3 downto 0) := "1100";
    constant ap_const_lv4_B : STD_LOGIC_VECTOR (3 downto 0) := "1011";
    constant ap_const_lv4_A : STD_LOGIC_VECTOR (3 downto 0) := "1010";
    constant ap_const_lv4_9 : STD_LOGIC_VECTOR (3 downto 0) := "1001";
    constant ap_const_lv4_8 : STD_LOGIC_VECTOR (3 downto 0) := "1000";
    constant ap_const_lv4_7 : STD_LOGIC_VECTOR (3 downto 0) := "0111";
    constant ap_const_lv4_6 : STD_LOGIC_VECTOR (3 downto 0) := "0110";
    constant ap_const_lv4_5 : STD_LOGIC_VECTOR (3 downto 0) := "0101";
    constant ap_const_lv4_4 : STD_LOGIC_VECTOR (3 downto 0) := "0100";
    constant ap_const_lv4_3 : STD_LOGIC_VECTOR (3 downto 0) := "0011";
    constant ap_const_lv4_2 : STD_LOGIC_VECTOR (3 downto 0) := "0010";
    constant ap_const_lv4_1 : STD_LOGIC_VECTOR (3 downto 0) := "0001";
    constant ap_const_lv4_0 : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    constant ap_const_lv4_F : STD_LOGIC_VECTOR (3 downto 0) := "1111";
    constant ap_const_lv13_1000 : STD_LOGIC_VECTOR (12 downto 0) := "1000000000000";
    constant ap_const_lv13_1 : STD_LOGIC_VECTOR (12 downto 0) := "0000000000001";
    constant ap_const_lv7_1 : STD_LOGIC_VECTOR (6 downto 0) := "0000001";
    constant ap_const_lv7_40 : STD_LOGIC_VECTOR (6 downto 0) := "1000000";
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";
    constant ap_const_lv32_5 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000101";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_boolean_1 : BOOLEAN := true;

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal icmp_ln75_fu_362_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter0_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal zext_ln77_8_fu_440_p1 : STD_LOGIC_VECTOR (63 downto 0);
    signal rr_fu_108 : STD_LOGIC_VECTOR (6 downto 0);
    signal add_ln76_fu_460_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_sig_allocacmp_rr_load : STD_LOGIC_VECTOR (6 downto 0);
    signal pp_fu_112 : STD_LOGIC_VECTOR (6 downto 0);
    signal select_ln75_1_fu_400_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal ap_sig_allocacmp_pp_load : STD_LOGIC_VECTOR (6 downto 0);
    signal indvar_flatten_fu_116 : STD_LOGIC_VECTOR (12 downto 0);
    signal add_ln75_6_fu_368_p2 : STD_LOGIC_VECTOR (12 downto 0);
    signal ap_sig_allocacmp_indvar_flatten_load : STD_LOGIC_VECTOR (12 downto 0);
    signal trunc_ln75_fu_426_p1 : STD_LOGIC_VECTOR (3 downto 0);
    signal icmp_ln76_fu_386_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal add_ln75_fu_380_p2 : STD_LOGIC_VECTOR (6 downto 0);
    signal p_cast283_mid2_v_fu_408_p4 : STD_LOGIC_VECTOR (1 downto 0);
    signal select_ln75_fu_392_p3 : STD_LOGIC_VECTOR (6 downto 0);
    signal tmp_2_fu_418_p3 : STD_LOGIC_VECTOR (7 downto 0);
    signal zext_ln77_fu_430_p1 : STD_LOGIC_VECTOR (7 downto 0);
    signal add_ln77_fu_434_p2 : STD_LOGIC_VECTOR (7 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component seq_align_multiple_flow_control_loop_pipe_sequential_init IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_start_int : OUT STD_LOGIC;
        ap_loop_init : OUT STD_LOGIC;
        ap_ready_int : IN STD_LOGIC;
        ap_loop_exit_ready : IN STD_LOGIC;
        ap_loop_exit_done : IN STD_LOGIC;
        ap_continue_int : OUT STD_LOGIC;
        ap_done_int : IN STD_LOGIC );
    end component;



begin
    flow_control_loop_pipe_sequential_init_U : component seq_align_multiple_flow_control_loop_pipe_sequential_init
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst,
        ap_start => ap_start,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_start_int => ap_start_int,
        ap_loop_init => ap_loop_init,
        ap_ready_int => ap_ready_int,
        ap_loop_exit_ready => ap_condition_exit_pp0_iter0_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_done_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_done_reg <= ap_const_logic_0;
            else
                if ((ap_continue_int = ap_const_logic_1)) then 
                    ap_done_reg <= ap_const_logic_0;
                elsif (((ap_start_int = ap_const_logic_1) and (ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    indvar_flatten_fu_116_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((icmp_ln75_fu_362_p2 = ap_const_lv1_0)) then 
                    indvar_flatten_fu_116 <= add_ln75_6_fu_368_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    indvar_flatten_fu_116 <= ap_const_lv13_0;
                end if;
            end if; 
        end if;
    end process;

    pp_fu_112_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((icmp_ln75_fu_362_p2 = ap_const_lv1_0)) then 
                    pp_fu_112 <= select_ln75_1_fu_400_p3;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    pp_fu_112 <= ap_const_lv7_0;
                end if;
            end if; 
        end if;
    end process;

    rr_fu_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
                if ((icmp_ln75_fu_362_p2 = ap_const_lv1_0)) then 
                    rr_fu_108 <= add_ln76_fu_460_p2;
                elsif ((ap_loop_init = ap_const_logic_1)) then 
                    rr_fu_108 <= ap_const_lv7_0;
                end if;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm, ap_CS_fsm_state1, ap_start_int)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln75_6_fu_368_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_indvar_flatten_load) + unsigned(ap_const_lv13_1));
    add_ln75_fu_380_p2 <= std_logic_vector(unsigned(ap_sig_allocacmp_pp_load) + unsigned(ap_const_lv7_1));
    add_ln76_fu_460_p2 <= std_logic_vector(unsigned(select_ln75_fu_392_p3) + unsigned(ap_const_lv7_1));
    add_ln77_fu_434_p2 <= std_logic_vector(unsigned(tmp_2_fu_418_p3) + unsigned(zext_ln77_fu_430_p1));
    ap_CS_fsm_state1 <= ap_CS_fsm(0);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start_int)
    begin
        if ((ap_start_int = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;


    ap_block_state1_pp0_stage0_iter0_assign_proc : process(ap_start_int)
    begin
                ap_block_state1_pp0_stage0_iter0 <= (ap_start_int = ap_const_logic_0);
    end process;


    ap_condition_exit_pp0_iter0_stage0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter0_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_state1, ap_loop_exit_ready, ap_done_reg, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_loop_exit_ready = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;


    ap_idle_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter0_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;


    ap_sig_allocacmp_indvar_flatten_load_assign_proc : process(ap_CS_fsm_state1, ap_loop_init, indvar_flatten_fu_116)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_indvar_flatten_load <= ap_const_lv13_0;
        else 
            ap_sig_allocacmp_indvar_flatten_load <= indvar_flatten_fu_116;
        end if; 
    end process;


    ap_sig_allocacmp_pp_load_assign_proc : process(ap_CS_fsm_state1, ap_loop_init, pp_fu_112)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_pp_load <= ap_const_lv7_0;
        else 
            ap_sig_allocacmp_pp_load <= pp_fu_112;
        end if; 
    end process;


    ap_sig_allocacmp_rr_load_assign_proc : process(ap_CS_fsm_state1, rr_fu_108, ap_loop_init)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_loop_init = ap_const_logic_1))) then 
            ap_sig_allocacmp_rr_load <= ap_const_lv7_0;
        else 
            ap_sig_allocacmp_rr_load <= rr_fu_108;
        end if; 
    end process;

    dp_matrix_V_10_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_10_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_10_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_10_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_10_d0 <= ap_const_lv9_0;

    dp_matrix_V_10_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_A))) then 
            dp_matrix_V_10_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_10_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_11_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_11_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_11_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_11_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_11_d0 <= ap_const_lv9_0;

    dp_matrix_V_11_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_B))) then 
            dp_matrix_V_11_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_11_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_12_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_12_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_12_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_12_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_12_d0 <= ap_const_lv9_0;

    dp_matrix_V_12_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_C))) then 
            dp_matrix_V_12_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_12_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_13_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_13_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_13_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_13_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_13_d0 <= ap_const_lv9_0;

    dp_matrix_V_13_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_D))) then 
            dp_matrix_V_13_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_13_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_14_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_14_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_14_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_14_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_14_d0 <= ap_const_lv9_0;

    dp_matrix_V_14_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_E))) then 
            dp_matrix_V_14_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_14_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_15_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_15_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_15_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_15_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_15_d0 <= ap_const_lv9_0;

    dp_matrix_V_15_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_F))) then 
            dp_matrix_V_15_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_15_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_1_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_1_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_1_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_1_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_1_d0 <= ap_const_lv9_0;

    dp_matrix_V_1_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_1))) then 
            dp_matrix_V_1_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_1_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_2_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_2_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_2_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_2_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_2_d0 <= ap_const_lv9_0;

    dp_matrix_V_2_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_2))) then 
            dp_matrix_V_2_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_2_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_3_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_3_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_3_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_3_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_3_d0 <= ap_const_lv9_0;

    dp_matrix_V_3_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_3))) then 
            dp_matrix_V_3_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_3_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_4_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_4_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_4_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_4_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_4_d0 <= ap_const_lv9_0;

    dp_matrix_V_4_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_4))) then 
            dp_matrix_V_4_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_4_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_5_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_5_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_5_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_5_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_5_d0 <= ap_const_lv9_0;

    dp_matrix_V_5_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_5))) then 
            dp_matrix_V_5_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_5_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_6_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_6_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_6_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_6_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_6_d0 <= ap_const_lv9_0;

    dp_matrix_V_6_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_6))) then 
            dp_matrix_V_6_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_6_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_7_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_7_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_7_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_7_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_7_d0 <= ap_const_lv9_0;

    dp_matrix_V_7_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_7))) then 
            dp_matrix_V_7_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_7_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_8_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_8_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_8_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_8_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_8_d0 <= ap_const_lv9_0;

    dp_matrix_V_8_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_8))) then 
            dp_matrix_V_8_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_8_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_9_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_9_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_9_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_9_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_9_d0 <= ap_const_lv9_0;

    dp_matrix_V_9_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_9))) then 
            dp_matrix_V_9_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_9_we0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_address0 <= zext_ln77_8_fu_440_p1(8 - 1 downto 0);

    dp_matrix_V_ce0_assign_proc : process(ap_CS_fsm_state1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_state1))) then 
            dp_matrix_V_ce0 <= ap_const_logic_1;
        else 
            dp_matrix_V_ce0 <= ap_const_logic_0;
        end if; 
    end process;

    dp_matrix_V_d0 <= ap_const_lv9_0;

    dp_matrix_V_we0_assign_proc : process(ap_CS_fsm_state1, icmp_ln75_fu_362_p2, trunc_ln75_fu_426_p1, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_1) and (icmp_ln75_fu_362_p2 = ap_const_lv1_0) and (ap_const_logic_1 = ap_CS_fsm_state1) and (trunc_ln75_fu_426_p1 = ap_const_lv4_0))) then 
            dp_matrix_V_we0 <= ap_const_logic_1;
        else 
            dp_matrix_V_we0 <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln75_fu_362_p2 <= "1" when (ap_sig_allocacmp_indvar_flatten_load = ap_const_lv13_1000) else "0";
    icmp_ln76_fu_386_p2 <= "1" when (ap_sig_allocacmp_rr_load = ap_const_lv7_40) else "0";
    p_cast283_mid2_v_fu_408_p4 <= select_ln75_1_fu_400_p3(5 downto 4);
    select_ln75_1_fu_400_p3 <= 
        add_ln75_fu_380_p2 when (icmp_ln76_fu_386_p2(0) = '1') else 
        ap_sig_allocacmp_pp_load;
    select_ln75_fu_392_p3 <= 
        ap_const_lv7_0 when (icmp_ln76_fu_386_p2(0) = '1') else 
        ap_sig_allocacmp_rr_load;
    tmp_2_fu_418_p3 <= (p_cast283_mid2_v_fu_408_p4 & ap_const_lv6_0);
    trunc_ln75_fu_426_p1 <= select_ln75_1_fu_400_p3(4 - 1 downto 0);
    zext_ln77_8_fu_440_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(add_ln77_fu_434_p2),64));
    zext_ln77_fu_430_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(select_ln75_fu_392_p3),8));
end behav;
