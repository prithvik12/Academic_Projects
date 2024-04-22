library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_half_adder is
end tb_half_adder;


architecture tb_half_adder_arch of tb_half_adder is

type test_vector_tb_half_adder is record
  
  test_a: std_logic;
  test_b: std_logic;
  test_s: std_logic;
  test_cout: std_logic;
end record;

type test_vector_data is array (natural range <>) of test_vector_tb_half_adder;

constant data_array: test_vector_data(3 downto 0) := 
(('0','0','0','0'),
('0','1','1','0'),
('1','0','1','0'),
('1','1','0','1'));

component half_adder is
  port(
    A, B: in std_logic;
    S, Cout: out std_logic);
end component;

signal test_a, test_b, test_s, test_cout: std_logic;
signal test_ok: boolean;

begin
  uut:half_adder
  port map(A=>test_a, B=>test_b, S=>test_s, Cout=>test_cout);
    
    process begin
      for i in data_array'range loop
        test_a <= data_array(i).test_a;
        test_b <= data_array(i).test_b;
        wait for 10 ns;
        if ((test_s /= data_array(i).test_s) and (test_cout /= data_array(i).test_cout)) then
          test_ok <= FALSE;
        else
          test_ok <= TRUE;
        end if;
      end loop;
      wait;
    end process;
  end tb_half_adder_arch;
