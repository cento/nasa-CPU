-- ==============================================================
-- Generated by Vitis HLS v2023.1
-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- ==============================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fetching_decoding_ip is
generic (
    C_S_AXI_CONTROL_ADDR_WIDTH : INTEGER := 19;
    C_S_AXI_CONTROL_DATA_WIDTH : INTEGER := 32 );
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    s_axi_control_AWVALID : IN STD_LOGIC;
    s_axi_control_AWREADY : OUT STD_LOGIC;
    s_axi_control_AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_WVALID : IN STD_LOGIC;
    s_axi_control_WREADY : OUT STD_LOGIC;
    s_axi_control_WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH/8-1 downto 0);
    s_axi_control_ARVALID : IN STD_LOGIC;
    s_axi_control_ARREADY : OUT STD_LOGIC;
    s_axi_control_ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_CONTROL_ADDR_WIDTH-1 downto 0);
    s_axi_control_RVALID : OUT STD_LOGIC;
    s_axi_control_RREADY : IN STD_LOGIC;
    s_axi_control_RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_CONTROL_DATA_WIDTH-1 downto 0);
    s_axi_control_RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    s_axi_control_BVALID : OUT STD_LOGIC;
    s_axi_control_BREADY : IN STD_LOGIC;
    s_axi_control_BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
    interrupt : OUT STD_LOGIC );
end;


architecture behav of fetching_decoding_ip is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "fetching_decoding_ip_fetching_decoding_ip,hls_ip_2023_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020-clg400-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=10.423400,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=128,HLS_SYN_DSP=0,HLS_SYN_FF=338,HLS_SYN_LUT=627,HLS_VERSION=2023_1}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_fsm_state1 : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    constant ap_ST_fsm_pp0_stage0 : STD_LOGIC_VECTOR (4 downto 0) := "00010";
    constant ap_ST_fsm_pp0_stage1 : STD_LOGIC_VECTOR (4 downto 0) := "00100";
    constant ap_ST_fsm_pp0_stage2 : STD_LOGIC_VECTOR (4 downto 0) := "01000";
    constant ap_ST_fsm_state6 : STD_LOGIC_VECTOR (4 downto 0) := "10000";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_2 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000010";
    constant ap_const_boolean_0 : BOOLEAN := false;
    constant ap_const_lv32_3 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000011";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";
    constant ap_const_lv1_0 : STD_LOGIC_VECTOR (0 downto 0) := "0";
    constant C_S_AXI_DATA_WIDTH : INTEGER range 63 downto 0 := 20;
    constant ap_const_lv32_4 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000100";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ap_start : STD_LOGIC;
    signal ap_done : STD_LOGIC;
    signal ap_idle : STD_LOGIC;
    signal ap_CS_fsm : STD_LOGIC_VECTOR (4 downto 0) := "00001";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_CS_fsm_state1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
    signal ap_ready : STD_LOGIC;
    signal start_pc : STD_LOGIC_VECTOR (31 downto 0);
    signal code_ram_q0 : STD_LOGIC_VECTOR (31 downto 0);
    signal nb_instruction_ap_vld : STD_LOGIC;
    signal pc_load_reg_178 : STD_LOGIC_VECTOR (15 downto 0);
    signal ap_CS_fsm_pp0_stage1 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage1 : signal is "none";
    signal ap_block_state3_pp0_stage1_iter0 : BOOLEAN;
    signal ap_block_pp0_stage1_11001 : BOOLEAN;
    signal is_running_running_cond_update_fu_100_ap_return : STD_LOGIC_VECTOR (0 downto 0);
    signal ap_CS_fsm_pp0_stage2 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage2 : signal is "none";
    signal ap_block_state4_pp0_stage2_iter0 : BOOLEAN;
    signal ap_block_pp0_stage2_11001 : BOOLEAN;
    signal nbi_statistic_update_fu_113_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal nbi_reg_188 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_pp0_stage0 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_pp0_stage0 : signal is "none";
    signal ap_enable_reg_pp0_iter1 : STD_LOGIC := '0';
    signal ap_block_state2_pp0_stage0_iter0 : BOOLEAN;
    signal ap_block_state5_pp0_stage0_iter1 : BOOLEAN;
    signal ap_block_pp0_stage0_11001 : BOOLEAN;
    signal ap_enable_reg_pp0_iter0 : STD_LOGIC := '0';
    signal ap_block_pp0_stage2_subdone : BOOLEAN;
    signal ap_condition_pp0_flush_enable : STD_LOGIC;
    signal ap_block_pp0_stage0_subdone : BOOLEAN;
    signal grp_fetch_fu_87_ap_start : STD_LOGIC;
    signal grp_fetch_fu_87_ap_done : STD_LOGIC;
    signal grp_fetch_fu_87_ap_idle : STD_LOGIC;
    signal grp_fetch_fu_87_ap_ready : STD_LOGIC;
    signal grp_fetch_fu_87_code_ram_address0 : STD_LOGIC_VECTOR (15 downto 0);
    signal grp_fetch_fu_87_code_ram_ce0 : STD_LOGIC;
    signal grp_fetch_fu_87_ap_return : STD_LOGIC_VECTOR (31 downto 0);
    signal grp_decode_fu_94_ap_start : STD_LOGIC;
    signal grp_decode_fu_94_ap_done : STD_LOGIC;
    signal grp_decode_fu_94_ap_idle : STD_LOGIC;
    signal grp_decode_fu_94_ap_ready : STD_LOGIC;
    signal grp_decode_fu_94_ap_return_0 : STD_LOGIC_VECTOR (2 downto 0);
    signal grp_decode_fu_94_ap_return_1 : STD_LOGIC_VECTOR (19 downto 0);
    signal is_running_running_cond_update_fu_100_ap_ready : STD_LOGIC;
    signal pc_1_execute_fu_106_ap_ready : STD_LOGIC;
    signal pc_1_execute_fu_106_d_i_imm_val : STD_LOGIC_VECTOR (16 downto 0);
    signal pc_1_execute_fu_106_ap_return : STD_LOGIC_VECTOR (15 downto 0);
    signal nbi_statistic_update_fu_113_ap_ready : STD_LOGIC;
    signal grp_fetch_fu_87_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage1 : BOOLEAN;
    signal ap_block_pp0_stage2 : BOOLEAN;
    signal grp_decode_fu_94_ap_start_reg : STD_LOGIC := '0';
    signal ap_block_pp0_stage0 : BOOLEAN;
    signal pc_fu_66 : STD_LOGIC_VECTOR (15 downto 0);
    signal pc_2_fu_118_p1 : STD_LOGIC_VECTOR (15 downto 0);
    signal nbi_1_fu_70 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm_state6 : STD_LOGIC;
    attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
    signal ap_NS_fsm : STD_LOGIC_VECTOR (4 downto 0);
    signal ap_ST_fsm_state1_blk : STD_LOGIC;
    signal ap_ST_fsm_state6_blk : STD_LOGIC;
    signal ap_block_pp0_stage1_subdone : BOOLEAN;
    signal ap_idle_pp0 : STD_LOGIC;
    signal ap_enable_pp0 : STD_LOGIC;
    signal ap_ce_reg : STD_LOGIC;

    component fetching_decoding_ip_fetch IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        pc_val : IN STD_LOGIC_VECTOR (15 downto 0);
        code_ram_address0 : OUT STD_LOGIC_VECTOR (15 downto 0);
        code_ram_ce0 : OUT STD_LOGIC;
        code_ram_q0 : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fetching_decoding_ip_decode IS
    port (
        ap_clk : IN STD_LOGIC;
        ap_rst : IN STD_LOGIC;
        ap_start : IN STD_LOGIC;
        ap_done : OUT STD_LOGIC;
        ap_idle : OUT STD_LOGIC;
        ap_ready : OUT STD_LOGIC;
        instruction : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return_0 : OUT STD_LOGIC_VECTOR (2 downto 0);
        ap_return_1 : OUT STD_LOGIC_VECTOR (19 downto 0) );
    end component;


    component fetching_decoding_ip_running_cond_update IS
    port (
        ap_ready : OUT STD_LOGIC;
        instruction : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
    end component;


    component fetching_decoding_ip_execute IS
    port (
        ap_ready : OUT STD_LOGIC;
        pc_val : IN STD_LOGIC_VECTOR (15 downto 0);
        d_i_type_val : IN STD_LOGIC_VECTOR (2 downto 0);
        d_i_imm_val : IN STD_LOGIC_VECTOR (16 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (15 downto 0) );
    end component;


    component fetching_decoding_ip_statistic_update IS
    port (
        ap_ready : OUT STD_LOGIC;
        nbi_read : IN STD_LOGIC_VECTOR (31 downto 0);
        ap_return : OUT STD_LOGIC_VECTOR (31 downto 0) );
    end component;


    component fetching_decoding_ip_control_s_axi IS
    generic (
        C_S_AXI_ADDR_WIDTH : INTEGER;
        C_S_AXI_DATA_WIDTH : INTEGER );
    port (
        AWVALID : IN STD_LOGIC;
        AWREADY : OUT STD_LOGIC;
        AWADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        WVALID : IN STD_LOGIC;
        WREADY : OUT STD_LOGIC;
        WDATA : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        WSTRB : IN STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH/8-1 downto 0);
        ARVALID : IN STD_LOGIC;
        ARREADY : OUT STD_LOGIC;
        ARADDR : IN STD_LOGIC_VECTOR (C_S_AXI_ADDR_WIDTH-1 downto 0);
        RVALID : OUT STD_LOGIC;
        RREADY : IN STD_LOGIC;
        RDATA : OUT STD_LOGIC_VECTOR (C_S_AXI_DATA_WIDTH-1 downto 0);
        RRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        BVALID : OUT STD_LOGIC;
        BREADY : IN STD_LOGIC;
        BRESP : OUT STD_LOGIC_VECTOR (1 downto 0);
        ACLK : IN STD_LOGIC;
        ARESET : IN STD_LOGIC;
        ACLK_EN : IN STD_LOGIC;
        start_pc : OUT STD_LOGIC_VECTOR (31 downto 0);
        nb_instruction : IN STD_LOGIC_VECTOR (31 downto 0);
        nb_instruction_ap_vld : IN STD_LOGIC;
        code_ram_address0 : IN STD_LOGIC_VECTOR (15 downto 0);
        code_ram_ce0 : IN STD_LOGIC;
        code_ram_q0 : OUT STD_LOGIC_VECTOR (31 downto 0);
        ap_start : OUT STD_LOGIC;
        interrupt : OUT STD_LOGIC;
        ap_ready : IN STD_LOGIC;
        ap_done : IN STD_LOGIC;
        ap_idle : IN STD_LOGIC );
    end component;



begin
    grp_fetch_fu_87 : component fetching_decoding_ip_fetch
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_fetch_fu_87_ap_start,
        ap_done => grp_fetch_fu_87_ap_done,
        ap_idle => grp_fetch_fu_87_ap_idle,
        ap_ready => grp_fetch_fu_87_ap_ready,
        pc_val => pc_fu_66,
        code_ram_address0 => grp_fetch_fu_87_code_ram_address0,
        code_ram_ce0 => grp_fetch_fu_87_code_ram_ce0,
        code_ram_q0 => code_ram_q0,
        ap_return => grp_fetch_fu_87_ap_return);

    grp_decode_fu_94 : component fetching_decoding_ip_decode
    port map (
        ap_clk => ap_clk,
        ap_rst => ap_rst_n_inv,
        ap_start => grp_decode_fu_94_ap_start,
        ap_done => grp_decode_fu_94_ap_done,
        ap_idle => grp_decode_fu_94_ap_idle,
        ap_ready => grp_decode_fu_94_ap_ready,
        instruction => grp_fetch_fu_87_ap_return,
        ap_return_0 => grp_decode_fu_94_ap_return_0,
        ap_return_1 => grp_decode_fu_94_ap_return_1);

    is_running_running_cond_update_fu_100 : component fetching_decoding_ip_running_cond_update
    port map (
        ap_ready => is_running_running_cond_update_fu_100_ap_ready,
        instruction => grp_fetch_fu_87_ap_return,
        ap_return => is_running_running_cond_update_fu_100_ap_return);

    pc_1_execute_fu_106 : component fetching_decoding_ip_execute
    port map (
        ap_ready => pc_1_execute_fu_106_ap_ready,
        pc_val => pc_load_reg_178,
        d_i_type_val => grp_decode_fu_94_ap_return_0,
        d_i_imm_val => pc_1_execute_fu_106_d_i_imm_val,
        ap_return => pc_1_execute_fu_106_ap_return);

    nbi_statistic_update_fu_113 : component fetching_decoding_ip_statistic_update
    port map (
        ap_ready => nbi_statistic_update_fu_113_ap_ready,
        nbi_read => nbi_1_fu_70,
        ap_return => nbi_statistic_update_fu_113_ap_return);

    control_s_axi_U : component fetching_decoding_ip_control_s_axi
    generic map (
        C_S_AXI_ADDR_WIDTH => C_S_AXI_CONTROL_ADDR_WIDTH,
        C_S_AXI_DATA_WIDTH => C_S_AXI_CONTROL_DATA_WIDTH)
    port map (
        AWVALID => s_axi_control_AWVALID,
        AWREADY => s_axi_control_AWREADY,
        AWADDR => s_axi_control_AWADDR,
        WVALID => s_axi_control_WVALID,
        WREADY => s_axi_control_WREADY,
        WDATA => s_axi_control_WDATA,
        WSTRB => s_axi_control_WSTRB,
        ARVALID => s_axi_control_ARVALID,
        ARREADY => s_axi_control_ARREADY,
        ARADDR => s_axi_control_ARADDR,
        RVALID => s_axi_control_RVALID,
        RREADY => s_axi_control_RREADY,
        RDATA => s_axi_control_RDATA,
        RRESP => s_axi_control_RRESP,
        BVALID => s_axi_control_BVALID,
        BREADY => s_axi_control_BREADY,
        BRESP => s_axi_control_BRESP,
        ACLK => ap_clk,
        ARESET => ap_rst_n_inv,
        ACLK_EN => ap_const_logic_1,
        start_pc => start_pc,
        nb_instruction => nbi_reg_188,
        nb_instruction_ap_vld => nb_instruction_ap_vld,
        code_ram_address0 => grp_fetch_fu_87_code_ram_address0,
        code_ram_ce0 => grp_fetch_fu_87_code_ram_ce0,
        code_ram_q0 => code_ram_q0,
        ap_start => ap_start,
        interrupt => interrupt,
        ap_ready => ap_ready,
        ap_done => ap_done,
        ap_idle => ap_idle);





    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_fsm_state1;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter0_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
            else
                if ((ap_const_logic_1 = ap_condition_pp0_flush_enable)) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter0 <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    ap_enable_reg_pp0_iter1_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
            else
                if ((((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0)) or ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2)))) then 
                    ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
                elsif (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                    ap_enable_reg_pp0_iter1 <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_decode_fu_94_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_decode_fu_94_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then 
                    grp_decode_fu_94_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_decode_fu_94_ap_ready = ap_const_logic_1)) then 
                    grp_decode_fu_94_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    grp_fetch_fu_87_ap_start_reg_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                grp_fetch_fu_87_ap_start_reg <= ap_const_logic_0;
            else
                if (((ap_enable_reg_pp0_iter0 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                    grp_fetch_fu_87_ap_start_reg <= ap_const_logic_1;
                elsif ((grp_fetch_fu_87_ap_ready = ap_const_logic_1)) then 
                    grp_fetch_fu_87_ap_start_reg <= ap_const_logic_0;
                end if; 
            end if;
        end if;
    end process;


    nbi_1_fu_70_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                nbi_1_fu_70 <= ap_const_lv32_0;
            elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                nbi_1_fu_70 <= nbi_statistic_update_fu_113_ap_return;
            end if; 
        end if;
    end process;

    pc_fu_66_assign_proc : process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then 
                pc_fu_66 <= pc_2_fu_118_p1;
            elsif (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then 
                pc_fu_66 <= pc_1_execute_fu_106_ap_return;
            end if; 
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                nbi_reg_188 <= nbi_statistic_update_fu_113_ap_return;
            end if;
        end if;
    end process;
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_boolean_0 = ap_block_pp0_stage1_11001) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage1))) then
                pc_load_reg_178 <= pc_fu_66;
            end if;
        end if;
    end process;

    ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1, ap_CS_fsm_pp0_stage0, ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0, ap_block_pp0_stage2_subdone, ap_block_pp0_stage0_subdone, ap_block_pp0_stage1_subdone)
    begin
        case ap_CS_fsm is
            when ap_ST_fsm_state1 => 
                if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_state1;
                end if;
            when ap_ST_fsm_pp0_stage0 => 
                if ((not(((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone))) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                elsif (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_1) and (ap_const_boolean_0 = ap_block_pp0_stage0_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage0))) then
                    ap_NS_fsm <= ap_ST_fsm_state6;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                end if;
            when ap_ST_fsm_pp0_stage1 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage1_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage1;
                end if;
            when ap_ST_fsm_pp0_stage2 => 
                if ((ap_const_boolean_0 = ap_block_pp0_stage2_subdone)) then
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage0;
                else
                    ap_NS_fsm <= ap_ST_fsm_pp0_stage2;
                end if;
            when ap_ST_fsm_state6 => 
                ap_NS_fsm <= ap_ST_fsm_state1;
            when others =>  
                ap_NS_fsm <= "XXXXX";
        end case;
    end process;
    ap_CS_fsm_pp0_stage0 <= ap_CS_fsm(1);
    ap_CS_fsm_pp0_stage1 <= ap_CS_fsm(2);
    ap_CS_fsm_pp0_stage2 <= ap_CS_fsm(3);
    ap_CS_fsm_state1 <= ap_CS_fsm(0);
    ap_CS_fsm_state6 <= ap_CS_fsm(4);

    ap_ST_fsm_state1_blk_assign_proc : process(ap_start)
    begin
        if ((ap_start = ap_const_logic_0)) then 
            ap_ST_fsm_state1_blk <= ap_const_logic_1;
        else 
            ap_ST_fsm_state1_blk <= ap_const_logic_0;
        end if; 
    end process;

    ap_ST_fsm_state6_blk <= ap_const_logic_0;
        ap_block_pp0_stage0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage0_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage1_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_11001 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_pp0_stage2_subdone <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state2_pp0_stage0_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state3_pp0_stage1_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state4_pp0_stage2_iter0 <= not((ap_const_boolean_1 = ap_const_boolean_1));
        ap_block_state5_pp0_stage0_iter1 <= not((ap_const_boolean_1 = ap_const_boolean_1));

    ap_condition_pp0_flush_enable_assign_proc : process(is_running_running_cond_update_fu_100_ap_return, ap_CS_fsm_pp0_stage2, ap_block_pp0_stage2_subdone)
    begin
        if (((is_running_running_cond_update_fu_100_ap_return = ap_const_lv1_0) and (ap_const_boolean_0 = ap_block_pp0_stage2_subdone) and (ap_const_logic_1 = ap_CS_fsm_pp0_stage2))) then 
            ap_condition_pp0_flush_enable <= ap_const_logic_1;
        else 
            ap_condition_pp0_flush_enable <= ap_const_logic_0;
        end if; 
    end process;


    ap_done_assign_proc : process(ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ap_done <= ap_const_logic_1;
        else 
            ap_done <= ap_const_logic_0;
        end if; 
    end process;

    ap_enable_pp0 <= (ap_idle_pp0 xor ap_const_logic_1);

    ap_idle_assign_proc : process(ap_start, ap_CS_fsm_state1)
    begin
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_0))) then 
            ap_idle <= ap_const_logic_1;
        else 
            ap_idle <= ap_const_logic_0;
        end if; 
    end process;


    ap_idle_pp0_assign_proc : process(ap_enable_reg_pp0_iter1, ap_enable_reg_pp0_iter0)
    begin
        if (((ap_enable_reg_pp0_iter0 = ap_const_logic_0) and (ap_enable_reg_pp0_iter1 = ap_const_logic_0))) then 
            ap_idle_pp0 <= ap_const_logic_1;
        else 
            ap_idle_pp0 <= ap_const_logic_0;
        end if; 
    end process;


    ap_ready_assign_proc : process(ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            ap_ready <= ap_const_logic_1;
        else 
            ap_ready <= ap_const_logic_0;
        end if; 
    end process;


    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;

    grp_decode_fu_94_ap_start <= grp_decode_fu_94_ap_start_reg;
    grp_fetch_fu_87_ap_start <= grp_fetch_fu_87_ap_start_reg;

    nb_instruction_ap_vld_assign_proc : process(ap_CS_fsm_state6)
    begin
        if ((ap_const_logic_1 = ap_CS_fsm_state6)) then 
            nb_instruction_ap_vld <= ap_const_logic_1;
        else 
            nb_instruction_ap_vld <= ap_const_logic_0;
        end if; 
    end process;

    pc_1_execute_fu_106_d_i_imm_val <= grp_decode_fu_94_ap_return_1(17 - 1 downto 0);
    pc_2_fu_118_p1 <= start_pc(16 - 1 downto 0);
end behav;
