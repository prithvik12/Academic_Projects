 library ieee;
use ieee.std_logic_1164.all;

entity Test_bench_BR is
   end Test_bench_BR;
 
 architecture structure of Test_bench_BR is 
 
 component BR is
   port (TDI : in std_logic;
        TDO : out std_logic;
    clock_dr : in std_logic;
      shift_dr : in std_logic);
  end component;
constant x: time := 100ns;
 signal TDI_input_signal : std_logic_vector (20 downto 0) := "110000000011000111111";
 signal TDI,TDO,clock_dr,shift_dr : std_logic;
 begin
Bypass_Register: BR port map (TDI, TDO, clock_dr,shift_dr);
  
  process
    begin
  
   clock_dr<='0';
   wait for x/2;
   clock_dr<= '1';
   wait for x/2;
      
    end process;
    
    process 
         begin  
          shift_dr <= '1';
          for i in TDI_input_signal'LENGTH - 1  downto 0 loop
            TDI <= TDI_input_signal(i);
            wait for x;
          end loop;
      
          wait for 200ns;
          
          shift_dr <= '0';
            TDI<='0';
          wait for 200ns;
      end process;
    
    
  end structure;
 