--****************************************************
--
-- Author : Team G4

-- Design Unit: Half adder circuit
--
--           Add two 1bit numbers input to obtain sum and carry

-- inputs : A,B
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

entity half_adder is
  port(
    A, B: in std_logic;
    S, Cout: out std_logic);
    
  end half_adder;
  
architecture half_adder_arch of half_adder is
  
  component AND_gate is
    Port ( 
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    Y : out STD_LOGIC);
  end component;
  
  component xor_gate is
    Port ( 
    a : in STD_LOGIC;
    b : in STD_LOGIC;
    Y : out STD_LOGIC);
  end component;
  
  begin
    HA_xor: xor_gate
    port map (a=>A,b=>B,Y=>S);
      
    HA_and: AND_gate
    port map (a=>A,b=>B,Y=>Cout);
      
  end half_adder_arch;
      
  
     
  