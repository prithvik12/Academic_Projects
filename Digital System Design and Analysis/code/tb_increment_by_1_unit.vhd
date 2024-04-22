library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_increment_by_1_unit is
end tb_increment_by_1_unit;


architecture tb_increment_by_1_unit_arch of tb_increment_by_1_unit is

type test_vector_increment_by_1_unit is record
  
  t_in: std_logic_vector(15 downto 0);
  t_out: std_logic_vector(15 downto 0);
  
end record;

type test_vector_data is array (natural range <>) of test_vector_increment_by_1_unit;

constant data_array: test_vector_data(1 downto 0) := 
(("0000000000000001", "0000000000000010"),
("0000000000000101", "0000000000000110"));

component increment_by_1_unit is
  port(
    data_in: in std_logic_vector(15 downto 0);
    data_out: out std_logic_vector(15 downto 0) );
  end component;

signal t_in, t_out: std_logic_vector(15 downto 0);
signal test_ok: boolean;

begin
  uut:increment_by_1_unit
  port map(data_in=>t_in, data_out=>t_out);
    
    process begin
      for i in data_array'range loop
        t_in <= data_array(i).t_in;
        wait for 10 ns;
        if t_out /= data_array(i).t_out then
          test_ok <= FALSE;
        else
          test_ok <= TRUE;
        end if;
      end loop;
      wait;
    end process;
  end tb_increment_by_1_unit_arch;
