----------------------------------------------------------------------
--File name: JTAG Top module 
--Date : 30th July, 2023
--Author : Rushik & Prithvik
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity JTAG_Interface is
  port (
		TDI  :in std_logic;   --- serial input
        TMS : in std_logic;  --- test mode select 
		TCK : in std_logic;  --- test clock
        TRST : in std_logic;  -- test reset 
		 TDO: out std_logic;   --- test out
		
        PI_A : in std_logic_vector (7 downto 0);  -- primary input
        PI_B : in std_logic_vector (7 downto 0);  -- primary input
        
        IR_pin : in std_logic; 
        
        PO : out std_logic_vector (15 downto 0)  -- final output
       
        );
 end JTAG_Interface;
 
 architecture structure of JTAG_Interface is 
 

  component mux is
        port (
			a, b, s : in std_logic;
			y : out std_logic
			);
       end component;
       
       component DFF is
         port (
			  d :in  std_logic;    
			  clk :in std_logic;   
			  q : out std_logic 
			   );
        end component;
		
 component IR is
      port (
			PI : in std_logic;
			ClockIR : in std_logic;
			UpdateIR : in std_logic;
			ShiftIR : in std_logic;
			TDI : in std_logic;
			IR_OUT : out std_logic_vector (1 downto 0)
			);
     end component;
     
     component ID is
       port (
			IR_Data : in std_logic_vector(1 downto 0);
			Mode: out std_logic;
			Sel  : out std_logic
			);
      end component;
  component multi_8bit is
   Port (
		a: in STD_LOGIC_VECTOR (7 downto 0);
	    x : in STD_LOGIC_VECTOR (7 downto 0);
		p : out STD_LOGIC_VECTOR (15 downto 0)
		);
  end component;
 
 component TAP_Controller is
   port (
		TCK : in std_logic;
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
  end component;
  
  component BR is
    port(
		TDI : in std_logic;
		TDO : out std_logic;
		clock_dr : in std_logic;
	    shift_dr : in std_logic 
		);
   end component;
   
   component BSR is
     port (  
		  pi_i : in std_logic_vector (15 downto 0);
		  si : out std_logic_vector (31 downto 0);
		  pi_s :out std_logic_vector (15 downto 0);
		  si_value : out std_logic;
		  TDI : in std_logic;
          shift_dr,mode,clk_dr,update_dr : in std_logic;
	      po_i : in std_logic_vector (15 downto 0);
	      po_s : out std_logic_vector (15 downto 0)
		  );
           
    end component;
    

------------------------------Defining the wires --------------------------------------------------

signal  DR_IR_Sel, Shift_Con, ClockIR, ShiftIR, UpdateIR,ClockDR, ShiftDR, UpdateDR,Bypass_out,mode: std_logic;
signal System_po, Serial_test_data, Pi_S :std_logic_vector(15 downto 0); 
signal output_final: std_logic_vector(15 downto 0); 
signal BSR_value : std_logic_vector(31 downto 0); 
signal IR_out : std_logic_vector(1 downto 0);
signal multi_1,multi_2 : std_logic_vector (7 downto 0);
signal DR_select : std_logic;
signal BSR_LSB : Std_logic;
signal out_mux_dr, out_mux_1 :std_logic;
signal not_TCK : std_logic;
signal TDO_sig : std_logic;

begin
Serial_test_data <= PI_A & PI_B;  ----  serial data 
not_TCK <= not TCK;      ---not tck for DFF final 
TAP_Controller_1: TAP_Controller port map (TCK, TMS, TRST, DR_IR_Sel, Shift_Con, ClockDR, ShiftDR, UpdateDR, ClockIR, ShiftIR, UpdateIR);   -- TAP controller module 
Instruction_Register_1: IR port map (IR_pin, ClockIR, UpdateIR, ShiftIR, TDI, IR_out);                                                          ----Instrcution register
Instruction_Decoder: ID port map (IR_out, mode,DR_select);
Bypass_Register: BR port map ( TDI, Bypass_out, ClockDR, ShiftDR);
Boundary_scan_Register: BSR port map ( Serial_test_data,BSR_value,Pi_S,BSR_LSB,TDI,ShiftDR, mode,ClockDR, UpdateDR, System_po, Output_final);
multi_1<=Pi_s(0)&Pi_s(1)&Pi_s(2)&Pi_s(3)&Pi_s(4)&Pi_s(5)&Pi_s(6)&Pi_s(7);
multi_2<=Pi_s(8)&Pi_s(9)&Pi_s(10)&Pi_s(11)&Pi_s(12)&Pi_s(13)&Pi_s(14)&Pi_s(15);
Multipler_1: multi_8bit port map (multi_1,multi_2,System_po);
po<=output_final;
MUX_1: mux port map (output_final(15),Bypass_out ,DR_select, out_mux_dr);
MUX_2: mux port map (out_mux_dr , IR_out(1), DR_IR_Sel,out_mux_1);
DFF_1: DFF port map (out_mux_1,not_TCK, TDO_sig);
----------------------   Buffer logic  ------------------
process (Shift_Con)
  begin
if Shift_Con = '1' then 
  TDO<=TDO_sig;
 else
  TDO<='Z';
end if;
end process;
end structure;
