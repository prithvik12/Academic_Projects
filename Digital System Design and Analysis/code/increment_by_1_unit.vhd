library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity increment_by_1_unit is
  port(
    data_in: in std_logic_vector(15 downto 0);
    data_out: out std_logic_vector(15 downto 0) );
    
  end increment_by_1_unit;
  
  architecture increment_by_1_unit_arch of increment_by_1_unit is
    CONSTANT ONE : unsigned(15 downto 0) := (0 => '1', others => '0');
    signal data_out_temp: unsigned(15 downto 0);
    
    begin
      data_out_temp <= unsigned(data_in) + ONE;
      
      data_out <= std_logic_vector(data_out_temp);
      
    end increment_by_1_unit_arch;
