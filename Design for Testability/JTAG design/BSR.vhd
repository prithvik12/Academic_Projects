
---File name: Boundary scan register 
---Date : 30th July, 2023
---Author : Rushik & Prithvik


library ieee;
use ieee.std_logic_1164.all; 


entity BSR is
  port (pi_i : in std_logic_vector (15 downto 0);
		si : out std_logic_vector (31 downto 0);
		pi_s :out std_logic_vector (15 downto 0);
		si_value : out std_logic;
		TDI : in std_logic;
		
       shift_dr,mode,clk_dr,update_dr : in std_logic;
	  
	   po_i : in std_logic_vector (15 downto 0);
	   po_s : out std_logic_vector (15 downto 0)
	   );
	      
end BSR;


architecture structure of BSR is 


component BSC
port  (pi,si : in std_logic;
     shift_dr,mode,clk_dr,update_dr : in std_logic;
	   so,po : out std_logic);
end component;

signal si_sig : std_logic_vector (30 downto 0);
signal so_sig : std_logic_vector (31 downto 0);
begin


BSC1: bsc port map(pi_i(0),TDI,shift_dr,mode,clk_dr,update_dr,so_sig(0),pi_s(0));
si_sig(0)<=so_sig(0);

BSC2: bsc port map(pi_i(1),si_sig(0),shift_dr,mode,clk_dr,update_dr,so_sig(1),pi_s(1));
si_sig(1)<=so_sig(1);

BSC3: bsc port map(pi_i(2),si_sig(1),shift_dr,mode,clk_dr,update_dr,so_sig(2),pi_s(2));
si_sig(2)<=so_sig(2);

BSC4: bsc port map(pi_i(3),si_sig(2),shift_dr,mode,clk_dr,update_dr,so_sig(3),pi_s(3));
si_sig(3)<=so_sig(3);

BSC5: bsc port map(pi_i(4),si_sig(3),shift_dr,mode,clk_dr,update_dr,so_sig(4),pi_s(4));
si_sig(4)<=so_sig(4);

BSC6: bsc port map(pi_i(5),si_sig(4),shift_dr,mode,clk_dr,update_dr,so_sig(5),pi_s(5));
si_sig(5)<=so_sig(5);

BSC7: bsc port map(pi_i(6),si_sig(5),shift_dr,mode,clk_dr,update_dr,so_sig(6),pi_s(6));
si_sig(6)<=so_sig(6);

BSC8: bsc port map(pi_i(7),si_sig(6),shift_dr,mode,clk_dr,update_dr,so_sig(7),pi_s(7));
si_sig(7)<=so_sig(7);

BSC9: bsc port map(pi_i(8),si_sig(7),shift_dr,mode,clk_dr,update_dr,so_sig(8),pi_s(8));
si_sig(8)<=so_sig(8);

BSC10: bsc port map(pi_i(9),si_sig(8),shift_dr,mode,clk_dr,update_dr,so_sig(9),pi_s(9));
si_sig(9)<=so_sig(9);

BSC11: bsc port map(pi_i(10),si_sig(9),shift_dr,mode,clk_dr,update_dr,so_sig(10),pi_s(10));
si_sig(10)<=so_sig(10);

BSC12: bsc port map(pi_i(11),si_sig(10),shift_dr,mode,clk_dr,update_dr,so_sig(11),pi_s(11));
si_sig(11)<=so_sig(11);

BSC13: bsc port map(pi_i(12),si_sig(11),shift_dr,mode,clk_dr,update_dr,so_sig(12),pi_s(12));
si_sig(12)<=so_sig(12);

BSC14: bsc port map(pi_i(13),si_sig(12),shift_dr,mode,clk_dr,update_dr,so_sig(13),pi_s(13));
si_sig(13)<=so_sig(13);

BSC15: bsc port map(pi_i(14),si_sig(13),shift_dr,mode,clk_dr,update_dr,so_sig(14),pi_s(14));
si_sig(14)<=so_sig(14);

BSC16: bsc port map(pi_i(15),si_sig(14),shift_dr,mode,clk_dr,update_dr,so_sig(15),pi_s(15));
si_sig(15)<=so_sig(15);

-- Output Boundary scan cells 

BSC17: bsc port map(po_i(0),si_sig(15),shift_dr,mode,clk_dr,update_dr,so_sig(16),po_s(0));
si_sig(16)<=so_sig(16);

BSC18: bsc port map(po_i(1),si_sig(16),shift_dr,mode,clk_dr,update_dr,so_sig(17),po_s(1));
si_sig(17)<=so_sig(17);

BSC19: bsc port map(po_i(2),si_sig(17),shift_dr,mode,clk_dr,update_dr,so_sig(18),po_s(2));
si_sig(18)<=so_sig(18);

BSC20: bsc port map(po_i(3),si_sig(18),shift_dr,mode,clk_dr,update_dr,so_sig(19),po_s(3));
si_sig(19)<=so_sig(19);

BSC21: bsc port map(po_i(4),si_sig(19),shift_dr,mode,clk_dr,update_dr,so_sig(20),po_s(4));
si_sig(20)<=so_sig(20);

BSC22: bsc port map(po_i(5),si_sig(20),shift_dr,mode,clk_dr,update_dr,so_sig(21),po_s(5));
si_sig(21)<=so_sig(21);

BSC23: bsc port map(po_i(6),si_sig(21),shift_dr,mode,clk_dr,update_dr,so_sig(22),po_s(6));
si_sig(22)<=so_sig(22);

BSC24: bsc port map(po_i(7),si_sig(22),shift_dr,mode,clk_dr,update_dr,so_sig(23),po_s(7));
si_sig(23)<=so_sig(23);

BSC25: bsc port map(po_i(8),si_sig(23),shift_dr,mode,clk_dr,update_dr,so_sig(24),po_s(8));
si_sig(24)<=so_sig(24);

BSC26: bsc port map(po_i(9),si_sig(24),shift_dr,mode,clk_dr,update_dr,so_sig(25),po_s(9));
si_sig(25)<=so_sig(25);

BSC27: bsc port map(po_i(10),si_sig(25),shift_dr,mode,clk_dr,update_dr,so_sig(26),po_s(10));
si_sig(26)<=so_sig(26);

BSC28: bsc port map(po_i(11),si_sig(26),shift_dr,mode,clk_dr,update_dr,so_sig(27),po_s(11));
si_sig(27)<=so_sig(27);

BSC29: bsc port map(po_i(12),si_sig(27),shift_dr,mode,clk_dr,update_dr,so_sig(28),po_s(12));
si_sig(28)<=so_sig(28);

BSC30: bsc port map(po_i(13),si_sig(28),shift_dr,mode,clk_dr,update_dr,so_sig(29),po_s(13));
si_sig(29)<=so_sig(29);

BSC31: bsc port map(po_i(14),si_sig(29),shift_dr,mode,clk_dr,update_dr,so_sig(30),po_s(14));
si_sig(30)<=so_sig(30);

BSC32: bsc port map(po_i(15),si_sig(30),shift_dr,mode,clk_dr,update_dr,so_sig(31),po_s(15));


si<= so_sig;
si_value<= so_sig(31);



end structure; 	