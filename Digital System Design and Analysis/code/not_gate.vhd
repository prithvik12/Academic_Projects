--****************************************************
--
-- Author : Team G4

-- Design Unit: Logical NOT gate
--
--           Logical NOT operation on 1 input value of type std_logic

-- inputs : a 
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

entity NOT_gate is
  Port ( a : in STD_LOGIC;
  Y : out STD_LOGIC);
end NOT_gate;
architecture Behavioral of NOT_gate is
begin
  Y <= NOT a ;
end Behavioral;
