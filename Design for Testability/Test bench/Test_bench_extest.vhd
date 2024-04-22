-----------------------------------
---File name:  Test bench For Extest Instruction 
---Date : 30th July, 2023
----Author : Rushik & Prithvik
---------------------------
 
library ieee;
use ieee.std_logic_1164.all;

entity Test_bench_extest is
   end Test_bench_extest;
 
 architecture structure of Test_bench_extest is 
 
 component JTAG_Interface is
   port ( 
    TDI  :in std_logic;
        TMS : in std_logic;
    TCK : in std_logic;
        TRST : in std_logic;
    TDO: out std_logic;
    
        PI_A : in std_logic_vector (7 downto 0);
        PI_B: in std_logic_vector (7 downto 0);
        
        IR_pin : in std_logic;
        
        PO : out std_logic_vector (15 downto 0));
  end component;
  
 signal a,x :std_logic_vector (7 downto 0);
 signal po :std_logic_vector(15 downto 0);
 signal TCK, TMS, TRST, TDI,TDO : std_logic;
 signal IR_pin :std_logic;
 constant T : time := 50ns;
 ----------------------------------------------------------------------------------Performing Extext instruction ----------------------------------------------------------------------

 signal Loading_TMS_1 : std_logic_vector(14 downto 0) := "111110110000110";   --Load Instruction  "11111 for reset, 01100 to go Shift DR state, and 00 for Instruction, 110 for IDLE state "
 signal Loading_Data_1 : std_logic_vector (14 downto 0) := "000001101100000";  -- Load x don't care for others except 00 instruction 
 signal Loading_TMS_2 : std_logic_vector(37 downto 0) := "10000000000000000000000000000000000111";    
 signal Loading_Data_2 : std_logic_vector (37 downto 0) := "00011111110111110110001001010011100000";
 signal TMS_extest : std_logic_vector (52 downto 0);
 signal data_sig_extest : std_logic_vector (52 downto 0);
 begin
JTAG_final_interface: JTAG_Interface port map (TDI,TMS, TCK,TRST,TDO,a,x,IR_pin, PO);
  TMS_extest <= Loading_TMS_1 & Loading_TMS_2;
  data_sig_extest <= Loading_Data_1 & Loading_Data_2;
  process 
      begin
        TCK <= '0';
        wait for T/2;
        TCK <='1';
        wait for T/2;
      end process;
   process
     begin 
      TRST <= '1';
      wait for 50ns;
      TRST <= '0';
      wait for T;
      for i in TMS_extest'LENGTH - 1  downto 0 loop
        TMS <= TMS_extest(i);
        TDI <=data_sig_extest(i);
        wait for T;
      end loop;
  end process;
  end structure;

