library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity tb_register_8bit is
end tb_register_8bit;


architecture tb_arch_register_8bit of tb_register_8bit is
  
  component register_8bit is 
    port(
      d_in: in std_logic_vector(7 downto 0);
      clk,rst,en: in std_logic;
      d_out: out std_logic_vector(7 downto 0));
  end component;
  
  signal test_in, test_out: std_logic_vector(7 downto 0):= (others => '0');
  signal test_clk, test_rst, test_en: std_logic := '0';
  
  begin
    uut: register_8bit
    port map(d_in => test_in, clk => test_clk, rst => test_rst, en => test_en, d_out => test_out );
      
        
      clock: process
      begin
        wait for 5 ns;
        test_clk <= '1';
        wait for 5 ns;
        test_clk <= '0';
        
      end process clock;
      
      test_register: process
      begin
        test_rst <= '1';
        wait for 20 ns;
        test_rst <= '0';
        wait for 20 ns;
        test_en <= '1';
        test_in <= "10011001";
        wait for 20 ns;
        test_in <= "10000000";
        wait for 20 ns;
        test_en <= '0';
      end process test_register;
      
    end tb_arch_register_8bit;
        
        
        
        
        
    
    

