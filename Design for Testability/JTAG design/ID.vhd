
---------------------------------------------
---File name: Instruction_Decoder
---Date : 30th July, 2023
---Author : Rushik & Prithvik
----------------------------


library ieee;
use ieee.std_logic_1164.all;

entity ID is
  port (IR_Data : in std_logic_vector(1 downto 0); ------- output of instruction register 
		Mode: out std_logic;
        Sel  : out std_logic);     
 end ID;
 
 architecture structure of ID is 
 
 begin
   
   process(IR_Data)
        begin
		
		---------------- extest instruction ------------------
          if IR_Data = "00" then       
            Mode <= '1';
            Sel <= '0';
		---------------- Bypass --------------
          elsif (IR_Data = "11") then   
            Sel <= '1';
		-----    sample instruction ------------
		  elsif  (IR_Data = "01") then  
            Mode <= '0';
		--------------- preload -----------
          elsif (IR_Data = "10") then   
            Mode <= '0';
          end if;   
   end process;
      
end structure;
