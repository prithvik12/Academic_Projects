--****************************************************
--
-- Author : Team G4

-- Design Unit: Partial Product Creation
--
--           Creates partial products to perform array multiplication. Partial product is 1-bit and operation.

-- inputs : A and B (8-bit Numbers,  std_logic_vector)
-- Output : Z (64 bit std_logic_vector to store the partial products)
--Achitecture : Structural architecure

-- Revision History
-- Version 1.0
-- Date: 01-12-2022

--****************************************************
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity partial_product_creation is
  Port ( 
  A : in std_logic_vector (7 downto 0);
  B : in std_logic_vector (7 downto 0);
  Z : out std_logic_vector (63 downto 0));
end partial_product_creation;
architecture partial_product_creation_arch of partial_product_creation is

component AND_gate is
  Port ( a : in STD_LOGIC;
  b : in STD_LOGIC;
  Y : out STD_LOGIC);
end component;

begin
unit_a0: AND_gate 
port map(a=>A(0),b=>B(0),Y=>Z(0));
unit_a1: AND_gate 
port map(a=>A(1),b=>B(0),Y=>Z(1));
unit_a2: AND_gate 
port map(a=>A(2),b=>B(0),Y=>Z(2));
unit_a3: AND_gate 
port map(a=>A(3),b=>B(0),Y=>Z(3));
unit_a4: AND_gate 
port map(a=>A(4),b=>B(0),Y=>Z(4));
unit_a5: AND_gate 
port map(a=>A(5),b=>B(0),Y=>Z(5));
unit_a6: AND_gate 
port map(a=>A(6),b=>B(0),Y=>Z(6));
unit_a7: AND_gate 
port map(a=>A(7),b=>B(0),Y=>Z(7));
unit_a8: AND_gate 
port map(a=>A(0),b=>B(1),Y=>Z(8));
unit_a9: AND_gate 
port map(a=>A(1),b=>B(1),Y=>Z(9));
unit_a10: AND_gate 
port map(a=>A(2),b=>B(1),Y=>Z(10));
unit_a11: AND_gate 
port map(a=>A(3),b=>B(1),Y=>Z(11));
unit_a12: AND_gate 
port map(a=>A(4),b=>B(1),Y=>Z(12));
unit_a13: AND_gate 
port map(a=>A(5),b=>B(1),Y=>Z(13));
unit_a14: AND_gate 
port map(a=>A(6),b=>B(1),Y=>Z(14));
unit_a15: AND_gate 
port map(a=>A(7),b=>B(1),Y=>Z(15));
unit_a16: AND_gate 
port map(a=>A(0),b=>B(2),Y=>Z(16));
unit_a17: AND_gate 
port map(a=>A(1),b=>B(2),Y=>Z(17));
unit_a18: AND_gate 
port map(a=>A(2),b=>B(2),Y=>Z(18));
unit_a19: AND_gate 
port map(a=>A(3),b=>B(2),Y=>Z(19));
unit_a20: AND_gate 
port map(a=>A(4),b=>B(2),Y=>Z(20));
unit_a21: AND_gate 
port map(a=>A(5),b=>B(2),Y=>Z(21));
unit_a22: AND_gate 
port map(a=>A(6),b=>B(2),Y=>Z(22));
unit_a23: AND_gate 
port map(a=>A(7),b=>B(2),Y=>Z(23));
unit_a24: AND_gate 
port map(a=>A(0),b=>B(3),Y=>Z(24));
unit_a25: AND_gate 
port map(a=>A(1),b=>B(3),Y=>Z(25));
unit_a26: AND_gate 
port map(a=>A(2),b=>B(3),Y=>Z(26));
unit_a27: AND_gate 
port map(a=>A(3),b=>B(3),Y=>Z(27));
unit_a28: AND_gate 
port map(a=>A(4),b=>B(3),Y=>Z(28));
unit_a29: AND_gate 
port map(a=>A(5),b=>B(3),Y=>Z(29));
unit_a30: AND_gate 
port map(a=>A(6),b=>B(3),Y=>Z(30));
unit_a31: AND_gate 
port map(a=>A(7),b=>B(3),Y=>Z(31));
unit_a32: AND_gate 
port map(a=>A(0),b=>B(4),Y=>Z(32));
unit_a33: AND_gate 
port map(a=>A(1),b=>B(4),Y=>Z(33));
unit_a34: AND_gate 
port map(a=>A(2),b=>B(4),Y=>Z(34));
unit_a35: AND_gate 
port map(a=>A(3),b=>B(4),Y=>Z(35));
unit_a36: AND_gate 
port map(a=>A(4),b=>B(4),Y=>Z(36));
unit_a37: AND_gate 
port map(a=>A(5),b=>B(4),Y=>Z(37));
unit_a38: AND_gate 
port map(a=>A(6),b=>B(4),Y=>Z(38));
unit_a39: AND_gate 
port map(a=>A(7),b=>B(4),Y=>Z(39));
unit_a40: AND_gate 
port map(a=>A(0),b=>B(5),Y=>Z(40));
unit_a41: AND_gate 
port map(a=>A(1),b=>B(5),Y=>Z(41));
unit_a42: AND_gate 
port map(a=>A(2),b=>B(5),Y=>Z(42));
unit_a43: AND_gate 
port map(a=>A(3),b=>B(5),Y=>Z(43));
unit_a44: AND_gate 
port map(a=>A(4),b=>B(5),Y=>Z(44));
unit_a45: AND_gate 
port map(a=>A(5),b=>B(5),Y=>Z(45));
unit_a46: AND_gate 
port map(a=>A(6),b=>B(5),Y=>Z(46));
unit_a47: AND_gate 
port map(a=>A(7),b=>B(5),Y=>Z(47));
unit_a48: AND_gate 
port map(a=>A(0),b=>B(6),Y=>Z(48));
unit_a49: AND_gate 
port map(a=>A(1),b=>B(6),Y=>Z(49));
unit_a50: AND_gate 
port map(a=>A(2),b=>B(6),Y=>Z(50));
unit_a51: AND_gate 
port map(a=>A(3),b=>B(6),Y=>Z(51));
unit_a52: AND_gate 
port map(a=>A(4),b=>B(6),Y=>Z(52));
unit_a53: AND_gate 
port map(a=>A(5),b=>B(6),Y=>Z(53));
unit_a54: AND_gate 
port map(a=>A(6),b=>B(6),Y=>Z(54));
unit_a55: AND_gate 
port map(a=>A(7),b=>B(6),Y=>Z(55));
unit_a56: AND_gate 
port map(a=>A(0),b=>B(7),Y=>Z(56));
unit_a57: AND_gate 
port map(a=>A(1),b=>B(7),Y=>Z(57));
unit_a58: AND_gate 
port map(a=>A(2),b=>B(7),Y=>Z(58));
unit_a59: AND_gate 
port map(a=>A(3),b=>B(7),Y=>Z(59));
unit_a60: AND_gate 
port map(a=>A(4),b=>B(7),Y=>Z(60));
unit_a61: AND_gate 
port map(a=>A(5),b=>B(7),Y=>Z(61));
unit_a62: AND_gate 
port map(a=>A(6),b=>B(7),Y=>Z(62));
unit_a63: AND_gate 
port map(a=>A(7),b=>B(7),Y=>Z(63));
end partial_product_creation_arch;