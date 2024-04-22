library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_1bit is 
  port(
    d_in: in std_logic;
    clk,rst: in std_logic;
    d_out: out std_logic);
  end register_1bit;
  
architecture register_1bit_ARCH of register_1bit is
  
  begin
    
  d_flipflop: process(clk, rst, d_in)
  begin
    if(rst = '1') then
      d_out <= '0';
    elsif (clk'event and clk = '1') then
        d_out <= d_in;
    end if;
  end process d_flipflop;
  
end register_1bit_ARCH;    
    
