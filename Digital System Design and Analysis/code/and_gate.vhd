--****************************************************
--
-- Author : Team G4

-- Design Unit: Logical AND gate
--
--           Logical AND operation on 2 input values of type std_logic

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

entity AND_gate is
  Port ( a : in STD_LOGIC;
  b : in STD_LOGIC;
  Y : out STD_LOGIC);
end AND_gate;
architecture Behavioral of AND_gate is
begin
  Y <= a AND b;
end Behavioral;


