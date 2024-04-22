-----------------------------------
---File name: Boundary scan cell
---Date : 30th July, 2023
----Author : Rushik & Prithvik
---------------------------

library ieee;
use ieee.std_logic_1164.all; 

entity BSC is
  port(pi,si : in std_logic;
  shift_dr: in std_logic;
  mode : in std_logic;
  clk_dr : in std_logic;
  update_dr : in std_logic;
  so,po : out std_logic);
end BSC;

architecture structural of BSC is 

component mux
port (a, b, s : in std_logic;
     y : out std_logic);
end component;

component DFF
port (d :in  std_logic;
      clk :in std_logic;   
      q : out std_logic );
end component;


signal d1,q1,q2 : std_logic;

begin

mux1:mux port map (pi,si,shift_dr,d1);
dff1:DFF port map (d1,clk_dr,q1);
so<=q1;
dff2:DFF port map (q1,update_dr,q2);
mux2:mux port map (pi,q2,mode,po); 



end structural; 	