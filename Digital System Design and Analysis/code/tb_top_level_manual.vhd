library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity tb_top_level_manual is
end tb_top_level_manual;

architecture tb_top_level_manual_arch of tb_top_level_manual is
  

component expression_calculator_top_level is
  port(
    A, B: in std_logic_vector(7 downto 0);
    clk, rst, load_in, load_out: in std_logic;
    end_flag: out std_logic;
    Z: out std_logic_vector(15 downto 0));
    
  end component;
  
  signal a_test, b_test: std_logic_vector(7 downto 0) := (others=>'0');
  signal res_test: std_logic_vector(15 downto 0):= (others=>'0');
  signal test_clk, test_rst, test_load_in, test_load_out, test_endflag: std_logic := '0';
  signal test_ok: boolean;
  
  begin
    
    --Clock pulses
    clock:process
    begin
      wait for 10 ns;
            test_clk <= '1';
      wait for 10 ns;
            test_clk <= '0';
      end process clock;
      
      uut:expression_calculator_top_level
      port map(A=>a_test, B=>b_test,clk=>test_clk,rst=>test_rst,load_in=>test_load_in, load_out=>test_load_out, end_flag=>test_endflag, Z=>res_test);
        
      process
        begin
          test_rst <='1';
          wait for 40 ns;
          test_rst <='0';
          wait for 20 ns;
          
          test_load_in <= '1';
          a_test <="00001000"; --8
          b_test <="00000101"; --5
          wait for 30 ns;
          test_load_out <= '1';
          wait for 30 ns;
          test_load_out <= '0';
          
          test_load_in <= '1';
          a_test <="00001001"; --9
          b_test <="00000101"; --5
          wait for 30 ns;
          test_load_out <= '1';
          wait for 30 ns;
          test_load_out <= '0';
          
        end process;
      end tb_top_level_manual_arch;
          
  
  