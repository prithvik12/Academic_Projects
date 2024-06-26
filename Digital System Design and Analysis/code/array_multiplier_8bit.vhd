--****************************************************
--
-- Author : Team G4

-- Design Unit: 8-bit Array multiplier
--
--           Multiplies two 8-bit unsigned numbers

-- inputs : A and B
-- Output : Z
--Achitecture : Structural architecure

-- Revision History
-- Version 1.0
-- Date: 01-12-2022

--****************************************************
 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity array_multiplier_8bit is
  Port ( 
  A : in std_logic_vector (7 downto 0);
  B : in std_logic_vector (7 downto 0);
  Z : out std_logic_vector (15 downto 0));
end array_multiplier_8bit;

architecture array_multiplier_8bit_arch of array_multiplier_8bit is

component partial_product_creation is
  Port ( 
  A : in std_logic_vector (7 downto 0);
  B : in std_logic_vector (7 downto 0);
  Z : out std_logic_vector (63 downto 0));
end component;

component full_adder_1bit is
  port(
    A, B, Cin: in std_logic;
    S, Cout: out std_logic);
end component;

component half_adder is
  port(
    A, B: in std_logic;
    S, Cout: out std_logic);
end component;

signal pp_op :std_logic_vector (63 downto 0); 
signal carry :std_logic_vector (55 downto 0); 
signal sum :std_logic_vector (55 downto 0); 


begin

pp: partial_product_creation port map(A,B,pp_op); 

-- LSB of Result--
Z(0) <= pp_op(0);  

ha1: half_adder 
port map(pp_op(1),pp_op(8),Z(1),carry(1));
fa1: full_adder_1bit 
port map(pp_op(2),pp_op(9),carry(1),sum(2),carry(2));  
ha2: half_adder 
port map(sum(2),pp_op(16),Z(2),carry(3));
fa2: full_adder_1bit 
port map(pp_op(3),carry(2),pp_op(10),sum(4),carry(4));
fa3: full_adder_1bit 
port map(sum(4),carry(3),pp_op(17),sum(5),carry(5));
ha3: half_adder 
port map(sum(5),pp_op(24),Z(3),carry(6));  
fa4: full_adder_1bit 
port map(pp_op(4),carry(4),pp_op(11),sum(7),carry(7));
fa5: full_adder_1bit 
port map(sum(7),carry(5),pp_op(18),sum(8),carry(8));
fa6: full_adder_1bit 
port map(sum(8),carry(6),pp_op(25),sum(9),carry(9));
ha4: half_adder 
port map(sum(9),pp_op(32),Z(4),carry(10));  
fa7: full_adder_1bit 
port map(pp_op(5),carry(7),pp_op(12),sum(11),carry(11));
fa8: full_adder_1bit 
port map(sum(11),carry(8),pp_op(19),sum(12),carry(12));
fa9: full_adder_1bit 
port map(sum(12),carry(9),pp_op(26),sum(13),carry(13));
fa10: full_adder_1bit 
port map(sum(13),carry(10),pp_op(33),sum(14),carry(14));
ha5: half_adder 
port map(sum(14),pp_op(40),Z(5),carry(15));  
fa11: full_adder_1bit 
port map(pp_op(6),carry(11),pp_op(13),sum(16),carry(16));
fa12: full_adder_1bit 
port map(sum(16),carry(12),pp_op(20),sum(17),carry(17));
fa13: full_adder_1bit 
port map(sum(17),carry(13),pp_op(27),sum(18),carry(18));
fa14: full_adder_1bit 
port map(sum(18),carry(14),pp_op(34),sum(19),carry(19));
fa15: full_adder_1bit 
port map(sum(19),carry(15),pp_op(41),sum(20),carry(20));
ha6: half_adder 
port map(sum(20),pp_op(48),Z(6),carry(21));  
fa16: full_adder_1bit 
port map(pp_op(7),carry(16),pp_op(14),sum(22),carry(22));
fa17: full_adder_1bit 
port map(sum(22),carry(17),pp_op(21),sum(23),carry(23));
fa18: full_adder_1bit 
port map(sum(23),carry(18),pp_op(28),sum(24),carry(24));
fa19: full_adder_1bit 
port map(sum(24),carry(19),pp_op(35),sum(25),carry(25));
fa20: full_adder_1bit 
port map(sum(25),carry(20),pp_op(42),sum(26),carry(26));
fa21: full_adder_1bit 
port map(sum(26),carry(21),pp_op(49),sum(27),carry(27));
ha7: half_adder 
port map(sum(27),pp_op(56),Z(7),carry(28));  
ha8: half_adder 
port map(carry(22),pp_op(15),sum(29),carry(29));
fa22: full_adder_1bit 
port map(sum(29),carry(23),pp_op(22),sum(30),carry(30));
fa23: full_adder_1bit 
port map(sum(30),carry(24),pp_op(29),sum(31),carry(31));
fa24: full_adder_1bit 
port map(sum(31),carry(25),pp_op(36),sum(32),carry(32));
fa25: full_adder_1bit 
port map(sum(32),carry(26),pp_op(43),sum(33),carry(33));
fa26: full_adder_1bit 
port map(sum(33),carry(27),pp_op(50),sum(34),carry(34));
fa27: full_adder_1bit 
port map(sum(34),carry(28),pp_op(57),Z(8),carry(35));  
fa28: full_adder_1bit 
port map(carry(29),pp_op(23),carry(30),sum(36),carry(36));
fa29: full_adder_1bit 
port map(sum(36),carry(31),pp_op(30),sum(37),carry(37));
fa30: full_adder_1bit 
port map(sum(37),carry(32),pp_op(37),sum(38),carry(38));
fa31: full_adder_1bit 
port map(sum(38),carry(33),pp_op(44),sum(39),carry(39));
fa32: full_adder_1bit 
port map(sum(39),carry(34),pp_op(51),sum(40),carry(40));
fa33: full_adder_1bit 
port map(sum(40),carry(35),pp_op(58),Z(9),carry(41));  
fa34: full_adder_1bit 
port map(carry(36),pp_op(31),carry(37),sum(42),carry(42));
fa35: full_adder_1bit 
port map(sum(42),carry(38),pp_op(38),sum(43),carry(43));
fa36: full_adder_1bit 
port map(sum(43),carry(39),pp_op(45),sum(44),carry(44));
fa37: full_adder_1bit 
port map(sum(44),carry(40),pp_op(52),sum(45),carry(45));
fa38: full_adder_1bit 
port map(sum(45),carry(41),pp_op(59),Z(10),carry(46));  
fa39: full_adder_1bit 
port map(carry(42),pp_op(39),carry(43),sum(47),carry(47));
fa40: full_adder_1bit 
port map(sum(47),carry(44),pp_op(46),sum(48),carry(48));
fa41: full_adder_1bit 
port map(sum(48),carry(45),pp_op(53),sum(49),carry(49));
fa42: full_adder_1bit 
port map(sum(49),carry(46),pp_op(60),Z(11),carry(50));  
fa43: full_adder_1bit 
port map(carry(47),pp_op(47),carry(48),sum(51),carry(51));
fa44: full_adder_1bit 
port map(sum(51),carry(49),pp_op(54),sum(52),carry(52));
fa45: full_adder_1bit 
port map(sum(52),carry(50),pp_op(61),Z(12),carry(53));  
fa46: full_adder_1bit 
port map(carry(51),pp_op(55),carry(52),sum(54),carry(54));
fa47: full_adder_1bit 
port map(sum(54),carry(53),pp_op(62),Z(13),carry(55));  
fa48: full_adder_1bit 
port map(carry(55),pp_op(63),carry(54),Z(14),Z(15));

end array_multiplier_8bit_arch;



