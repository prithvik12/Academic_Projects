----------------------------------------------
--File name: TAP Controller 
--Date : 30th July, 2023
--Author : Rushik & Prithvik
--------------------------------
library ieee;
use ieee.std_logic_1164.all;

entity TAP_Controller is
  port (TCK : in std_logic;
        TMS : in std_logic;
        TRST : in std_logic;
		mux_sel  : out std_logic;
        shift: out std_logic;
		
		ClockIR: out std_logic;
        ShiftIR: out std_logic;
        UpdateIR: out std_logic;
		
        ClockDR: out std_logic;
        ShiftDR: out std_logic;
        UpdateDR: out std_logic 
        
        );
 end TAP_Controller;
 
 architecture structure of TAP_Controller is 

 type TAP_FSM_STATE is (RESET, IDLE, Select_DR_Scan, Capture_DR, Shift_DR, Exit1_DR, Pause_DR, Exit2_DR, Update_DR, Select_IR_Scan, Capture_IR, Shift_IR, Exit1_IR, Pause_IR, Exit2_IR, Update_IR);   --- FSM state 
 signal CUR_TAP_STATE, NXT_TAP_STATE : TAP_FSM_STATE;   --- two variable for current and Next state
 

   
 begin
   
   process(TCK, TRST)
     begin
       if TRST ='1' then
         CUR_TAP_STATE <= RESET;
       elsif (TCK'event and TCK = '1') then
         CUR_TAP_STATE <= NXT_TAP_STATE;
       end if;
     end process;
     
     
     process (TMS,TCK,CUR_TAP_STATE)
       begin
         NXT_TAP_STATE <= CUR_TAP_STATE;
		 
	--Initializing instruction register clock and select line
	     mux_Sel <='0';
         shift <='0';
         ClockIR <='0';
         ShiftIR <='0';
         UpdateIR <='0';
	-- Initializing Data register clock and select line
         ClockDR <='0';
         ShiftDR <='0';
         UpdateDR <='0';
         
   
 
         
         case CUR_TAP_STATE is
           
         when RESET =>                      ----- in Reset if TMS =0 then IDLE state otherwise RESET
           if TMS = '0' then
             NXT_TAP_STATE <= IDLE;
		else
			 NXT_TAP_STATE<= RESET;
           end if;
           
         when IDLE =>                   ----- in IDLE if TMS =1 then select_dr_scan state otherwise and for  all other state
           if TMS = '1' then
             NXT_TAP_STATE <= Select_DR_Scan;
           end if;
       
         when Select_DR_Scan =>
           mux_sel <='0';
           if TMS = '0' then
		     NXT_TAP_STATE <= Capture_DR;
           elsif TMS = '1' then
             NXT_TAP_STATE <= Select_IR_Scan;
           end if;
           
         when Capture_DR =>
		 ClockDR <= '1';
         mux_sel <='0';
		   if TCK ='0' then      -----------------  giving clock_dr signal to the BSR
             ClockDR <='0';
           else
             ClockDR <= '1';
           end if;
		  if TMS = '0' then
			 NXT_TAP_STATE <= Shift_DR;
           elsif TMS = '1' then
             NXT_TAP_STATE <= Exit1_DR;
           end if;
         
          
         when Shift_DR =>
			ShiftDR <= '1';
           shift <= '1';
           mux_sel <='0';         
           if TMS = '1' then
             NXT_TAP_STATE <= Exit1_DR;
           else                     -----------------  giving clock_dr signal to the BSR
             if TCK ='0' then
                ClockDR <='0';
              else
                ClockDR <= '1';
              end if;
           end if;

         when Exit1_DR =>
           mux_sel<='0';
           if TMS = '1' then
            NXT_TAP_STATE<= Update_DR;
           elsif TMS = '0' then
             NXT_TAP_STATE <= Pause_DR;
           end if;
           
         when Pause_DR =>
           mux_sel<='0';
           if TMS = '1' then
             NXT_TAP_STATE <= Exit2_DR;
           end if;
           
         when Exit2_DR =>
           mux_sel <='0';
           if TMS = '1' then
             NXT_TAP_STATE <= Update_DR;
           elsif TMS ='0' then
             NXT_TAP_STATE <= Shift_DR;
           end if;
           
         when Update_DR =>
		  UpdateDR <= '0';
           mux_sel<='0';
           if TCK ='0' then      ----- update reverse clock 
             UpdateDR <='1';
           else 
             UpdateDR <='0';
           end if;
           if TMS = '0' then
			 NXT_TAP_STATE <= IDLE;
           elsif TMS ='1' then
              NXT_TAP_STATE <= Select_DR_Scan;
           end if;

         when Select_IR_Scan =>
           mux_sel <='1';
           if TMS = '1' then
             NXT_TAP_STATE <= Reset;
           elsif TMS = '0' then
             NXT_TAP_STATE <= Capture_IR;
           end if;
		   
         when Capture_IR =>
		 ClockIR <= '1';               ---ir clock 
         mux_sel <='1';
		  if TCK ='0' then
             ClockIR <='0';
           else
             ClockIR <='1';
           end if;
		 if TMS = '1' then
             NXT_TAP_STATE <= Exit1_IR;
           elsif TMS = '0' then
             NXT_TAP_STATE <= Shift_IR;
          end if;
          
           
         when Shift_IR =>
		 shift <= '1';
         mux_sel<='1';
         ShiftIR <= '1';
           if TMS = '1' then
             NXT_TAP_STATE <= Exit1_IR;
           else          
              if  TCK ='0' then
                ClockIR <='0';
              else 
                ClockIR <='1';
              end if;
        
           end if;
          
         when Exit1_IR =>
           mux_sel <='1';

           if TMS = '1' then
             NXT_TAP_STATE <= Update_IR;
           elsif TMS = '0' then
             NXT_TAP_STATE <= Pause_IR;
           end if;
           
         when Pause_IR =>
           mux_sel <='1';
           if TMS = '1' then
             NXT_TAP_STATE <= Exit2_IR;
           end if;
           
         when Exit2_IR =>
           mux_sel<='1';
           if TMS = '0' then
			NXT_TAP_STATE <= Shift_IR;
           elsif TMS ='1' then
              NXT_TAP_STATE <= Update_IR;
           end if;
           
         when Update_IR =>
           mux_sel <='1';
           UpdateIR <= '0';
           if TCK ='0' then
             UpdateIR <='1';
           else
             UpdateIR <= '0';
           end if;
         
           if TMS = '1' then
             NXT_TAP_STATE <= Select_DR_Scan;
           elsif TMS ='0' then
             NXT_TAP_STATE<= IDLE;
           end if;
              
        when others =>
          NXT_TAP_STATE <= RESET;
           
         end case;
         
       end process;

end structure;
