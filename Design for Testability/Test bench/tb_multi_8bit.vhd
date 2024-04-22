library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_multi_8bit is
end tb_multi_8bit;


architecture tb of tb_multi_8bit is

type test_vector_8x8_mult is record
  
  a: std_logic_vector(7 downto 0);
  b: std_logic_vector(7 downto 0);
  res: std_logic_vector(15 downto 0);
end record;

type test_vector_data is array (natural range <>) of test_vector_8x8_mult;

constant data_array: test_vector_data(14 downto 0) := 
(("00000010","00000001","0000000000000010"),
("00000010","00000010","0000000000000100"),
("00000010","00000011","0000000000000110"),
("00000010","00000100","0000000000001000"),
("00000010","00000101","0000000000001010"),
("00000010","00000110","0000000000001100"),
("00000010","00000111","0000000000001110"),
("00000010","00001000","0000000000010000"),
("00000010","00001001","0000000000010010"),
("00000010","00001010","0000000000010100"),
("00000010","00001011","0000000000010110"),
("00000010","00001100","0000000000011000"),
("00000010","00001101","0000000000011010"),
("00000010","00001110","0000000000011100"),
("00000010","00001111","0000000000011110"));

signal a_test, b_test: std_logic_vector(7 downto 0);
signal res_test: std_logic_vector(15 downto 0);
signal test_ok: boolean;

begin
  uut: entity work.multi_8bit
  port map(a=>a_test, x=>b_test, p=>res_test);
    
    process begin
      for i in data_array'range loop
        a_test <= data_array(i).a;
        b_test <= data_array(i).b;
        wait for 10 ns;
        if res_test /= data_array(i).res then
          test_ok <= FALSE;
        else
          test_ok <= TRUE;
        end if;
      end loop;
      wait;
    end process;
  end tb;
