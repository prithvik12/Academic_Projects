--****************************************************
--
-- Author : Team G4

-- Design Unit: Divide by 4 unit
--
--           appends 2 zeros in the front of the given 16-bit number

-- inputs : a and b
-- Output : Y
--Achitecture : Behavioral architecure

-- Revision History
-- Version 1.0
-- Date: 01-12-2022

--****************************************************

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity divide_by_4_unit is
  port( 
  data_in: in std_logic_vector(15 downto 0);
  data_out: out std_logic_vector(15 downto 0));
end divide_by_4_unit;

architecture concat_arch_divide_by_4_unit of divide_by_4_unit is
  begin
  
  data_out <= "00" & data_in(15 downto 2);
  
end concat_arch_divide_by_4_unit;


  
     
    
    
