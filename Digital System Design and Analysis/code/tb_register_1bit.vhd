library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_register_1bit is
end tb_register_1bit;


architecture tb_arch_register_1bit of tb_register_1bit is
  
  component register_1bit is 
    port(
      d_in: in std_logic;
      clk,rst: in std_logic;
      d_out: out std_logic);
  end component;
  
  signal test_in, test_out: std_logic;
  signal test_clk, test_rst: std_logic;
  
  begin
    uut: register_1bit
    port map(d_in => test_in, clk => test_clk, rst => test_rst, d_out => test_out );
      

      clock: process
      begin
        wait for 5 ns;
        test_clk <= '1';
        wait for 5 ns;
        test_clk <= '0';
        
      end process clock;
      
      test_register: process
      begin
        wait for 10 ns;
        test_rst <= '0';
        test_in <= '1';
        wait for 20 ns;
        test_in <= '0';
      end process test_register;
      
    end tb_arch_register_1bit;
