library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity xor_gate is
  Port ( a : in STD_LOGIC;
  b : in STD_LOGIC;
  Y : out STD_LOGIC);
end xor_gate;
architecture Behavioral of xor_gate is
begin
  Y <= a xor b;
end Behavioral;

