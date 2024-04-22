--****************************************************
--
-- Author : Team G4

-- Design Unit: Expression calculator top level
--
--           Port mapping for all the structurally defined components to design the final expression calculator. 
--           ([A*B]/4) + 1

-- inputs : A,B (8-bit inputs) reset, clock, enable_in, enable_out
-- Output : Output(16-bit), End_flag
-- Architecture : Structural architecure

-- Revision History
-- Version 1.0
-- Date: 01-12-2022

--****************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity expression_calculator_top_level is
  port(
    A, B: in std_logic_vector(7 downto 0);
    clk, rst, load_in, load_out: in std_logic;
    end_flag: out std_logic;
    Z: out signed(15 downto 0));
    
  end expression_calculator_top_level;
  
  architecture expression_calculator_top_level_arch of expression_calculator_top_level is
    
    component register_8bit is 
    port(
    d_in: in std_logic_vector(7 downto 0);
    clk,rst,en: in std_logic;
    d_out: out std_logic_vector(7 downto 0));
    end component;
    
    component array_multiplier_8bit is
    Port ( 
    A : in std_logic_vector (7 downto 0);
    B : in std_logic_vector (7 downto 0);
    Z : out std_logic_vector (15 downto 0));
    end component;
    
    component divide_by_4_unit is
    port( 
    data_in: in std_logic_vector(15 downto 0);
    data_out: out std_logic_vector(15 downto 0));
    end component;
    
    component increment_by_1_unit is
    port(
    data_in: in std_logic_vector(15 downto 0);
    data_out: out std_logic_vector(15 downto 0) );
    end component;
    
    component register_16bit is 
    port(
    d_in: in std_logic_vector(15 downto 0);
    clk,rst,en: in std_logic;
    d_out: out signed(15 downto 0);
    end_flag: out std_logic
    );
    end component;
    
    signal multiplier_in_A, multiplier_in_B: std_logic_vector(7 downto 0);
    signal divide_4_input, increment_unit_input, output_reg_input: std_logic_vector(15 downto 0);
    
    begin
      ---------------------------Input stage----------------------------------
      reg_A: register_8bit
      port map (d_in=>A, clk=>clk, rst=>rst, en=>load_in, d_out=>multiplier_in_A );
      
      reg_B: register_8bit
      port map (d_in=>B, clk=>clk, rst=>rst, en=>load_in, d_out=>multiplier_in_B);
      ----------------------------Stage - 1-----------------------------------  
      stage_1_multiplication: array_multiplier_8bit
      port map (A=>multiplier_in_A, B=>multiplier_in_B, Z=>divide_4_input );
        
      ----------------------------Stage - 2-----------------------------------
      stage_2_divide_by_4: divide_by_4_unit
      port map(data_in=>divide_4_input, data_out=> increment_unit_input);
        
      ----------------------------Stage - 3-----------------------------------
      stage_3_increment_by_1: increment_by_1_unit
      port map(data_in=>increment_unit_input, data_out=> output_reg_input);
       
      ----------------------------Output stage-----------------------------------
      output_stage: register_16bit
      port map(d_in=>output_reg_input, clk=>clk, rst=>rst, en=>load_out,end_flag=>end_flag, d_out=> Z); 
        
    end expression_calculator_top_level_arch;
         
         
         
  
      
      
        
      
        
      
        
      
        
        
        
        
        
        
        