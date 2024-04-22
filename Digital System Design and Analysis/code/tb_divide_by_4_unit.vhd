library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_divide_by_4_unit is
  
end tb_divide_by_4_unit;


architecture tb_arch_divide_by_4_unit of tb_divide_by_4_unit is
  
  type test_vector_divide_by_4_unit is record
    
    data_in, data_out: std_logic_vector(15 downto 0);
    
  end record;
  
  type test_vector_data is array (natural range <>) of test_vector_divide_by_4_unit;
  
  
  CONSTANT data_test: test_vector_data(3 downto 0):= 
  (("0000000000000100", "0000000000000001"),
  ("0000000000001000", "0000000000000010"),
  ("1010101010101010", "0010101010101010"),
  ("1100101011001011", "0011001010110010"));
  
  component divide_by_4_unit is
  port( 
  data_in: in std_logic_vector(15 downto 0);
  data_out: out std_logic_vector(15 downto 0));
end component;
  
  signal test_data_in,test_data_out: std_logic_vector(15 downto 0);
  signal test_ok: boolean; 
  
  begin
    uut: divide_by_4_unit
    port map(data_in=>test_data_in,data_out=>test_data_out);
      
    process begin
      for i in data_test'range loop
        test_data_in <= data_test(i).data_in;
        wait for 10 ns;
        if test_data_out /= data_test(i).data_out then
          test_ok <= FALSE;
        else
          test_ok <= TRUE;
        end if;
      end loop;
      wait;
    end process;
  end tb_arch_divide_by_4_unit;
