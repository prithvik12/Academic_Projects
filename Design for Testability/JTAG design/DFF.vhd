--------------------------------
---Authors: Rushik Shingala & Prithvik 
----Design: D flipflop
----------------------------------
library ieee;
use ieee. std_logic_1164.all;

entity DFF is 
   port(
    d :in  std_logic;    
      clk :in std_logic;   
      q : out std_logic    
   );
end DFF;
architecture structural of DFF is  
begin  
 process(clk)
 begin 
    if (clk'event and clk='1') then
    q <= d; 
    end if;       
 end process;  
end structural; 