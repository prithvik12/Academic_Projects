library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_full_adder_1bit is
end tb_full_adder_1bit;


architecture tb_full_adder_1bit_arch of tb_full_adder_1bit is

type test_vector_1_bit_full_adder is record
  
  test_a: std_logic;
  test_b: std_logic;
  test_cin: std_logic;
  test_s: std_logic;
  test_cout: std_logic;
end record;

type test_vector_data is array (natural range <>) of test_vector_1_bit_full_adder;

constant data_array: test_vector_data(7 downto 0) := 
(('0','0','0','0','0'),
('0','0','1','1','0'),
('0','1','0','1','0'),
('0','1','1','0','1'),
('1','0','0','1','0'),
('1','0','1','0','1'),
('1','1','0','0','1'),
('1','1','1','1','1'));

component full_adder_1bit is
  port(
    A, B, Cin: in std_logic;
    S, Cout: out std_logic);
end component;

signal test_a, test_b, test_cin, test_s, test_cout: std_logic;
signal test_ok: boolean;

begin
  uut:full_adder_1bit
  port map(A=>test_a, B=>test_b, Cin=>test_cin, S=>test_s, Cout=>test_cout);
    
    process begin
      for i in data_array'range loop
        test_a <= data_array(i).test_a;
        test_b <= data_array(i).test_b;
        test_cin <= data_array(i).test_cin;
        wait for 10 ns;
        if ((test_s /= data_array(i).test_s) and (test_cout /= data_array(i).test_cout)) then
          test_ok <= FALSE;
        else
          test_ok <= TRUE;
        end if;
      end loop;
      wait;
    end process;
  end tb_full_adder_1bit_arch;
