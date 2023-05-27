-- ==============================================================
-- RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2022.2.2 (64-bit)
-- Version: 2022.2.2
-- Copyright (C) Copyright 1986-2023 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity fetching_decoding_ip_running_cond_update is
port (
    ap_ready : OUT STD_LOGIC;
    instruction : IN STD_LOGIC_VECTOR (31 downto 0);
    ap_return : OUT STD_LOGIC_VECTOR (0 downto 0) );
end;


architecture behav of fetching_decoding_ip_running_cond_update is 
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_boolean_1 : BOOLEAN := true;
    constant ap_const_lv32_8067 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000001000000001100111";
    constant ap_const_logic_0 : STD_LOGIC := '0';

attribute shreg_extract : string;


begin



    ap_ready <= ap_const_logic_1;
    ap_return <= "0" when (instruction = ap_const_lv32_8067) else "1";
end behav;