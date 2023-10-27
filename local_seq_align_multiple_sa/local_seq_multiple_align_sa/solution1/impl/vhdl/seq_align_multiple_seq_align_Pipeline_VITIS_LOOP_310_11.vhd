-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.1 (64-bit)
-- Version: 2022.1
-- Copyright (C) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity seq_align_multiple_seq_align_Pipeline_VITIS_LOOP_310_11 is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst : IN STD_LOGIC;
    ap_start : IN STD_LOGIC;
    ap_done : OUT STD_LOGIC;
    ap_idle : OUT STD_LOGIC;
    ap_ready : OUT STD_LOGIC;
    max : IN STD_LOGIC_VECTOR (31 downto 0);
    index : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_64_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_65_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_66_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_67_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_68_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_69_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_70_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_71_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_72_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_73_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_74_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_75_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_76_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_77_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_78_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_79_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_80_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_81_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_82_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_83_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_84_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_85_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_86_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_87_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_88_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_89_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_90_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_91_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_92_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_93_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_94_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_score_95_reload : IN STD_LOGIC_VECTOR (31 downto 0);
    max_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    max_1_out_ap_vld : OUT STD_LOGIC;
    index_1_out : OUT STD_LOGIC_VECTOR (31 downto 0);
    index_1_out_ap_vld : OUT STD_LOGIC );
end;


architecture behav of seq_align_multiple_seq_align_Pipeline_VITIS_LOOP_310_11 is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant ap_const_lv6_0 : STD_LOGIC_VECTOR (5 downto 0) := "000000";
    constant ap_const_lv6_20 : STD_LOGIC_VECTOR (5 downto 0) := "100000";
    constant ap_const_lv6_1 : STD_LOGIC_VECTOR (5 downto 0) := "000001";

attribute shreg_extract : string;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (0 downto 0) := "1";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC;
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_block_state1_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state2_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal icmp_ln310_fu_348_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_condition_exit_pp0_iter1_stage0 : STD_LOGIC;
    signal ap_loop_exit_ready : STD_LOGIC;
    signal ap_ready_int : STD_LOGIC;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal index_1_fu_100 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln313_fu_418_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_loop_init : STD_LOGIC;
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal max_1_fu_104 : STD_LOGIC_VECTOR (31 downto 0);
    signal select_ln313_1_fu_426_p3 : STD_LOGIC_VECTOR (31 downto 0);
    signal r_fu_108 : STD_LOGIC_VECTOR (5 downto 0);
    signal add_ln310_fu_354_p2 : STD_LOGIC_VECTOR (5 downto 0);
    signal ap_block_pp0_stage0_01001 : BOOLEAN;
    signal tmp_4_fu_366_p34 : STD_LOGIC_VECTOR (31 downto 0);
    signal trunc_ln313_fu_410_p1 : STD_LOGIC_VECTOR (4 downto 0);
    signal icmp_ln313_fu_404_p2 : STD_LOGIC_VECTOR (0 downto 0);
    signal zext_ln313_fu_414_p1 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_done_reg : STD_LOGIC := '0';
    signal ap_continue_int : STD_LOGIC;
    signal ap_done_int : STD_LOGIC;
    signal ap_NS_fsm : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_start_int : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component seq_align_multiple_mux_326_32_1_1 IS
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        din2_WIDTH : INTEGER;
        din3_WIDTH : INTEGER;
        din4_WIDTH : INTEGER;
        din5_WIDTH : INTEGER;
        din6_WIDTH : INTEGER;
        din7_WIDTH : INTEGER;
        din8_WIDTH : INTEGER;
        din9_WIDTH : INTEGER;
        din10_WIDTH : INTEGER;
        din11_WIDTH : INTEGER;
        din12_WIDTH : INTEGER;
        din13_WIDTH : INTEGER;
        din14_WIDTH : INTEGER;
        din15_WIDTH : INTEGER;
        din16_WIDTH : INTEGER;
        din17_WIDTH : INTEGER;
        din18_WIDTH : INTEGER;
        din19_WIDTH : INTEGER;
        din20_WIDTH : INTEGER;
        din21_WIDTH : INTEGER;
        din22_WIDTH : INTEGER;
        din23_WIDTH : INTEGER;
        din24_WIDTH : INTEGER;
        din25_WIDTH : INTEGER;
        din26_WIDTH : INTEGER;
        din27_WIDTH : INTEGER;
        din28_WIDTH : INTEGER;
        din29_WIDTH : INTEGER;
        din30_WIDTH : INTEGER;
        din31_WIDTH : INTEGER;
        din32_WIDTH : INTEGER;
        dout_WIDTH : INTEGER );
    port (
        din0 : IN STD_LOGIC_VECTOR (31 downto 0);
        din1 : IN STD_LOGIC_VECTOR (31 downto 0);
        din2 : IN STD_LOGIC_VECTOR (31 downto 0);
        din3 : IN STD_LOGIC_VECTOR (31 downto 0);
        din4 : IN STD_LOGIC_VECTOR (31 downto 0);
        din5 : IN STD_LOGIC_VECTOR (31 downto 0);
        din6 : IN STD_LOGIC_VECTOR (31 downto 0);
        din7 : IN STD_LOGIC_VECTOR (31 downto 0);
        din8 : IN STD_LOGIC_VECTOR (31 downto 0);
        din9 : IN STD_LOGIC_VECTOR (31 downto 0);
        din10 : IN STD_LOGIC_VECTOR (31 downto 0);
        din11 : IN STD_LOGIC_VECTOR (31 downto 0);
        din12 : IN STD_LOGIC_VECTOR (31 downto 0);
        din13 : IN STD_LOGIC_VECTOR (31 downto 0);
        din14 : IN STD_LOGIC_VECTOR (31 downto 0);
        din15 : IN STD_LOGIC_VECTOR (31 downto 0);
        din16 : IN STD_LOGIC_VECTOR (31 downto 0);
        din17 : IN STD_LOGIC_VECTOR (31 downto 0);
        din18 : IN STD_LOGIC_VECTOR (31 downto 0);
        din19 : IN STD_LOGIC_VECTOR (31 downto 0);
        din20 : IN STD_LOGIC_VECTOR (31 downto 0);
        din21 : IN STD_LOGIC_VECTOR (31 downto 0);
        din22 : IN STD_LOGIC_VECTOR (31 downto 0);
        din23 : IN STD_LOGIC_VECTOR (31 downto 0);
        din24 : IN STD_LOGIC_VECTOR (31 downto 0);
        din25 : IN STD_LOGIC_VECTOR (31 downto 0);
        din26 : IN STD_LOGIC_VECTOR (31 downto 0);
        din27 : IN STD_LOGIC_VECTOR (31 downto 0);
        din28 : IN STD_LOGIC_VECTOR (31 downto 0);
        din29 : IN STD_LOGIC_VECTOR (31 downto 0);
        din30 : IN STD_LOGIC_VECTOR (31 downto 0);
        din31 : IN STD_LOGIC_VECTOR (31 downto 0);
        din32 : IN STD_LOGIC_VECTOR (5 downto 0);
        dout : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


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
    mux_326_32_1_1_U741 : component seq_align_multiple_mux_326_32_1_1
    generic map (
        ID => 1,
        NUM_STAGE => 1,
        din0_WIDTH => 32,
        din1_WIDTH => 32,
        din2_WIDTH => 32,
        din3_WIDTH => 32,
        din4_WIDTH => 32,
        din5_WIDTH => 32,
        din6_WIDTH => 32,
        din7_WIDTH => 32,
        din8_WIDTH => 32,
        din9_WIDTH => 32,
        din10_WIDTH => 32,
        din11_WIDTH => 32,
        din12_WIDTH => 32,
        din13_WIDTH => 32,
        din14_WIDTH => 32,
        din15_WIDTH => 32,
        din16_WIDTH => 32,
        din17_WIDTH => 32,
        din18_WIDTH => 32,
        din19_WIDTH => 32,
        din20_WIDTH => 32,
        din21_WIDTH => 32,
        din22_WIDTH => 32,
        din23_WIDTH => 32,
        din24_WIDTH => 32,
        din25_WIDTH => 32,
        din26_WIDTH => 32,
        din27_WIDTH => 32,
        din28_WIDTH => 32,
        din29_WIDTH => 32,
        din30_WIDTH => 32,
        din31_WIDTH => 32,
        din32_WIDTH => 6,
        dout_WIDTH => 32)
    port map (
        din0 => max_score_64_reload,
        din1 => max_score_65_reload,
        din2 => max_score_66_reload,
        din3 => max_score_67_reload,
        din4 => max_score_68_reload,
        din5 => max_score_69_reload,
        din6 => max_score_70_reload,
        din7 => max_score_71_reload,
        din8 => max_score_72_reload,
        din9 => max_score_73_reload,
        din10 => max_score_74_reload,
        din11 => max_score_75_reload,
        din12 => max_score_76_reload,
        din13 => max_score_77_reload,
        din14 => max_score_78_reload,
        din15 => max_score_79_reload,
        din16 => max_score_80_reload,
        din17 => max_score_81_reload,
        din18 => max_score_82_reload,
        din19 => max_score_83_reload,
        din20 => max_score_84_reload,
        din21 => max_score_85_reload,
        din22 => max_score_86_reload,
        din23 => max_score_87_reload,
        din24 => max_score_88_reload,
        din25 => max_score_89_reload,
        din26 => max_score_90_reload,
        din27 => max_score_91_reload,
        din28 => max_score_92_reload,
        din29 => max_score_93_reload,
        din30 => max_score_94_reload,
        din31 => max_score_95_reload,
        din32 => r_fu_108,
        dout => tmp_4_fu_366_p34);

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
        ap_loop_exit_ready => ap_condition_exit_pp0_iter1_stage0,
        ap_loop_exit_done => ap_done_int,
        ap_continue_int => ap_continue_int,
        ap_done_int => ap_done_int);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_CS_fsm <= ap_ST_fsm_pp0_stage0;
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
                elsif (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_done_reg <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_exit_pp0_iter1_stage0)) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                elsif (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    ap_enable_reg_pp0_iter1 <= ap_start_int;
                end if; 
            end if;
        end if;
    end process;


    index_1_fu_100_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    index_1_fu_100 <= index;
                elsif (((icmp_ln310_fu_348_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    index_1_fu_100 <= select_ln313_fu_418_p3;
                end if;
            end if; 
        end if;
    end process;

    max_1_fu_104_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    max_1_fu_104 <= max;
                elsif (((icmp_ln310_fu_348_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    max_1_fu_104 <= select_ln313_1_fu_426_p3;
                end if;
            end if; 
        end if;
    end process;

    r_fu_108_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                if ((ap_loop_init = ap_const_logic_1)) then 
                    r_fu_108 <= ap_const_lv6_0;
                elsif (((icmp_ln310_fu_348_p2 = ap_const_lv1_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1))) then 
                    r_fu_108 <= add_ln310_fu_354_p2;
                end if;
            end if; 
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_CS_fsm)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_pp0_stage0 => 
                ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
            when others =>  
                ap_NS_fsm <= "X";
        end case;
    end process;
    add_ln310_fu_354_p2 <= std_logic_vector(unsigned(r_fu_108) + unsigned(ap_const_lv6_1));
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(0);
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_01001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state1_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_exit_pp0_iter1_stage0_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_block_pp0_stage0_subdone, icmp_ln310_fu_348_p2)
    begin
        if (((icmp_ln310_fu_348_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_1;
        else 
            ap_condition_exit_pp0_iter1_stage0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_block_pp0_stage0_subdone, ap_loop_exit_ready, ap_done_reg)
    begin
        if (((ap_loop_exit_ready = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_done_int <= ap_const_logic_1;
        else 
            ap_done_int <= ap_done_reg;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);
    ap_enable_reg_pp0_iter0 <= ap_start_int;

    ap_idle_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_idle_pp0, ap_start_int)
    begin
        if (((ap_start_int = ap_const_logic_0) and (ap_idle_pp0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter0, ap_enable_reg_pp0_iter1)
    begin
        if (((ap_enable_reg_pp0_iter1 = ap_const_logic_0) and (ap_enable_reg_pp0_iter0 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;

    ap_loop_exit_ready <= ap_condition_exit_pp0_iter1_stage0;

    ap_ready_int_assign_proc : process(ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter0, ap_block_pp0_stage0_subdone)
    begin
        if (((ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            ap_ready_int <= ap_const_logic_1;
        else 
            ap_ready_int <= ap_const_logic_0;
        end if; 
    end process;

    icmp_ln310_fu_348_p2 <= "1" when (r_fu_108 = ap_const_lv6_20) else "0";
    icmp_ln313_fu_404_p2 <= "1" when (signed(max_1_fu_104) < signed(tmp_4_fu_366_p34)) else "0";
    index_1_out <= index_1_fu_100;

    index_1_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln310_fu_348_p2, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln310_fu_348_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            index_1_out_ap_vld <= ap_const_logic_1;
        else 
            index_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    max_1_out <= max_1_fu_104;

    max_1_out_ap_vld_assign_proc : process(ap_CS_fsm_pp0_stage0, icmp_ln310_fu_348_p2, ap_block_pp0_stage0_11001)
    begin
        if (((icmp_ln310_fu_348_p2 = ap_const_lv1_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
            max_1_out_ap_vld <= ap_const_logic_1;
        else 
            max_1_out_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    select_ln313_1_fu_426_p3 <= 
        tmp_4_fu_366_p34 when (icmp_ln313_fu_404_p2(0) = '1') else 
        max_1_fu_104;
    select_ln313_fu_418_p3 <= 
        zext_ln313_fu_414_p1 when (icmp_ln313_fu_404_p2(0) = '1') else 
        index_1_fu_100;
    trunc_ln313_fu_410_p1 <= r_fu_108(5 - 1 downto 0);
    zext_ln313_fu_414_p1 <= std_logic_vector(IEEE.numeric_std.resize(unsigned(trunc_ln313_fu_410_p1),32));
end behav;
