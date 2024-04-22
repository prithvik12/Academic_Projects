------------------------
---File name : Instruction_Register
--Date : 30th July, 2023
--Author : Rushik & Prithvik
-------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity IR is
  port (PI : in std_logic;
        ClockIR : in std_logic;
        UpdateIR : in std_logic;
        ShiftIR : in std_logic;
        TDI : in std_logic;
		IR_OUT : out std_logic_vector (1 downto 0));
 end IR;
 
 architecture structure of IR is 
  
component mux is
  port (  a : in std_logic;
          b : in std_logic;
          s : in std_logic;
          y : out std_logic);
end component; 

component DFF
port (d : in std_logic;    
      clk :in std_logic;   
      q :out  std_logic );
end component;
    
signal mux_out,mux_out_1,q1,q2 : std_logic;
    
 begin
 
Mux_1: mux port map (PI, TDI, ShiftIR, mux_out);
DFF_1: DFF port map(mux_out, ClockIR,q1);
DFF_2: DFF port map (q1,UpdateIR, IR_OUT(0));

Mux_2 : mux port map (PI,q1, ShiftIR, mux_out_1);
DFF_11 : DFF port map(mux_out_1, ClockIR,q2);
DFF_12 : DFF port map (q2,UpdateIR, IR_OUT(1));
   
end structure;
