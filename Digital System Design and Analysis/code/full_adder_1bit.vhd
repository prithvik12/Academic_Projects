--****************************************************
--
-- Author : Team G4

-- Design Unit: Full adder circuit
--
--           Add two 1bit numbers and carry input to obtain sum and carry

-- inputs : A,B,Cin
-- Output : S, Cout
--Achitecture : Structural architecure

-- Revision History
-- Version 1.0
-- Date: 01-12-2022

--****************************************************


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity full_adder_1bit is
  port(
    A, B, Cin: in std_logic;
    S, Cout: out std_logic);
    
  end full_adder_1bit;
  
architecture full_adder_1bit_arch of full_adder_1bit is
  
    component AND_gate is
      Port ( a : in STD_LOGIC;
      b : in STD_LOGIC;
      Y : out STD_LOGIC);
    end component;
    
    component OR_gate is
      Port ( a : in STD_LOGIC;
      b : in STD_LOGIC;
      Y : out STD_LOGIC);
    end component; 
    
    component xor_gate is
      Port ( 
      a : in STD_LOGIC;
      b : in STD_LOGIC;
      Y : out STD_LOGIC);
    end component;
  
  signal xor_1_out, and_1_out, and_2_out: std_logic;
  
  begin
    xor_1: xor_gate
    port map(a=>A, b=>B, Y=>xor_1_out);
      
    xor_2: xor_gate
    port map(a=>xor_1_out, b=>Cin, Y=>S);
      
    and_1: AND_gate
    port map(a=>xor_1_out, b=>Cin, Y=>and_1_out);
      
    and_2: AND_gate
    port map(a=>A, b=>B, Y=>and_2_out);
      
    or_1: OR_gate
    port map(a=>and_1_out, b=>and_2_out, Y=>Cout);
      
  end full_adder_1bit_arch;
      
    
      
    
    
    
    
