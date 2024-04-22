--****************************************************
--
-- Author : Team G4

-- Design Unit: 16-bit Register
--
--           16-bit input register to store the input values.

-- inputs : d_in (16-bit), clk, rst, en
-- Output : d_out (16-bit)
--Achitecture : Behvioural architecure

-- Revision History
-- Version 1.0
-- Date: 01-12-2022

--****************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity register_16bit is 
  port(
    d_in: in std_logic_vector(15 downto 0);
    clk,rst,en: in std_logic;
    d_out: out signed(15 downto 0);
    end_flag: out std_logic);
  end register_16bit;
  
architecture register_16bit_ARCH of register_16bit is
  
  begin
    
  d_flipflop: process(clk, rst, en, d_in)
  begin
    if(rst = '1') then
      d_out <= (others => '0');
    elsif (clk'event and clk = '1') then
      if (en = '1') then
        d_out <= signed(d_in);
      end if;
    end if;
  end process d_flipflop;
  
--end flag logic

  end_flag <= '1' when en = '1' else
              '0';
  
  
end register_16bit_ARCH;  
