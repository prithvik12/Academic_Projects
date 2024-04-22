-----------------------------------
---File name:  Test bench For Preload & Sample Instruction 
---Date : 30th July, 2023
----Author : Rushik & Prithvik
---------------------------


library ieee;
use ieee.std_logic_1164.all;

entity Test_bench_preload is
   end Test_bench_preload;
 
 architecture structure of Test_bench_preload is 
 
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
  
 ---------------------------- input and output signal for JTAG_Interface------------------------------
 signal a,x :std_logic_vector (7 downto 0);
 signal po :std_logic_vector(15 downto 0);
 signal TCK, TMS, TRST, TDI,TDO,IR_pin: std_logic;
 constant T : time := 50ns;
  ----------------------------------------------------------------------------------Performing Preload instruction ----------------------------------------------------------------------
  
 signal Loading_TMS_7 : std_logic_vector(14 downto 0) := "111110110000110";   --Load Instruction  "11111 for reset, 01100 to go Shift DR state, and 00 for Instruction, 110 for IDLE state "
 signal Loading_Data_7 : std_logic_vector (14 downto 0) := "000000000010000";  -- Load x don't care for others except 00 instruction 
 
 signal Loading_TMS_8 : std_logic_vector(37 downto 0) := "10000000000000000000000000000000000110";    --Scan IN
 signal Loading_Data_8 : std_logic_vector (37 downto 0) := "10011111101110111010001000001001000110";
 
 
 signal data_1 : std_logic_vector (7 downto 0) := x"FF";
 signal data_2: std_logic_vector (7 downto 0) := x"1F";
 
 ----------------------------------------------------------------------------------Performing Sample instruction ----------------------------------------------------------------------

 signal Loading_TMS_9 : std_logic_vector(14 downto 0) := "111110110000110";   --Load Instruction  "11111 for reset, 01100 to go Shift DR state, and 00 for Instruction, 110 for IDLE state "
 signal Loading_Data_9 : std_logic_vector (14 downto 0) := "000000000001000";  -- Load x don't care for others except 00 instruction 
 
 signal Loading_TMS_10 : std_logic_vector(37 downto 0) := "10000000000000000000000000000000000110";    --Scan IN
 signal Loading_Data_10 : std_logic_vector (37 downto 0) := "11111111011111110100101010000100000110";
 
 
 
 ------------------------------------------------------ combined signal for Sample Insruction  ---------------
 signal TMS_sample: std_logic_vector (52 downto 0); 
 signal data_sig_sample : std_logic_vector (52 downto 0);
 
 
 ------------------------------------------------------ combined signal for Preload Insruction  ---------------
 signal TMS_preload : std_logic_vector (52 downto 0);
 signal data_sig_preload : std_logic_vector (52 downto 0);
 
 begin
   
JTAG_final_interface: JTAG_Interface port map (TDI,TMS, TCK,TRST,TDO,a,x,IR_pin, PO);

  TMS_preload <= Loading_TMS_7 & Loading_TMS_8 ;
  data_sig_preload <= Loading_Data_7 & Loading_Data_8 ;
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
      a<=data_1;
      x<=data_2;
      for i in TMS_preload'LENGTH - 1  downto 0 loop
       TMS <= TMS_preload(i);
       TDI <=data_sig_preload(i);
      wait for T;
      end loop;
      a<=data_1;
      x<=data_2;
     for i in TMS_sample'LENGTH - 1  downto 0 loop
      TMS <= TMS_sample(i);
      TDI <=data_sig_sample(i);
      wait for T;
     end loop;
  end process;
  end structure;

