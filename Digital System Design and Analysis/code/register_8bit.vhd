--****************************************************
--
-- Author : Team G4

-- Design Unit: 8-bit Register
--
--           8-bit input register to store the input values.

-- inputs : d_in (8-bit), clk, rst, en
-- Output : d_out (8-bit)
--Achitecture : Behvioural architecure

-- Revision History
-- Version 1.0
-- Date: 01-12-2022

--****************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_8bit is 
  port(
    d_in: in std_logic_vector(7 downto 0);
    clk,rst,en: in std_logic;
    d_out: out std_logic_vector(7 downto 0));
  end register_8bit;
  
architecture register_8bit_ARCH of register_8bit is
  
  begin
  --- one segment coding logic ----  
  d_flipflop: process(clk, rst)
  begin
    if(rst = '1') then
      d_out <= (others=>'0');
    elsif (clk'event and clk = '1') then
      if (en = '1') then
        d_out <= d_in;
      end if;
    end if;
  end process d_flipflop;
  
end register_8bit_ARCH;    
    
  
    

    
    
