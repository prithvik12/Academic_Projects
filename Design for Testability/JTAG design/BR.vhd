--------------------------------
--Authors: Prithvik & Rushik Shingala
---Design : Bypass Register
---------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity BR is
  port (TDI : in std_logic;
        TDO : out std_logic;
		clock_dr : in std_logic;
	    shift_dr : in std_logic);
  
 end BR;
 
 architecture structure of BR is 
 
 
 component DFF is
   port (d : in std_logic;
         clk: in std_logic;
         q: out std_logic);
  end component;
  
  signal r1 : std_logic;
  
 begin
   
 r1 <= shift_dR and TDI;
 DFF_1: DFF port map(r1, clock_dr, TDO );
        
end structure;