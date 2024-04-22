
module top_tb;

   // Parameters
   parameter CLK_PERIOD = 10;

   // Inputs
   reg a_clk = 0 ;
   reg b_clk = 0;
   reg c_clk = 0;
   reg [0:3] error_found = 0;
   reg [0:31] req1_data_in ;
   reg [0:31] req2_data_in ;
   reg [0:31] req3_data_in ;
   reg [0:31] req4_data_in ;
   reg [0:3] req1_cmd_in ;
   reg [0:3] req2_cmd_in ;
   reg [0:3] req3_cmd_in ;
   reg [0:3] req4_cmd_in ;
   reg [1:7] reset ;
   reg scan_in = 0;
   
   // Outputs
   wire [0:31] out_data1 ;
   wire [0:31] out_data2 ;
   wire [0:31] out_data3 ;
   wire [0:31] out_data4 ;
   wire [0:1] out_resp1 ;
   wire [0:1] out_resp2 ;
   wire [0:1] out_resp3 ;
   wire [0:1] out_resp4 ;
   wire scan_out = 0;

   // Instantiate the DUT
   calc1_top dut (
      .a_clk(a_clk),
      .b_clk(b_clk),
      .c_clk(c_clk),
      .error_found(error_found),
      .req1_cmd_in(req1_cmd_in),
      .req1_data_in(req1_data_in),
      .req2_cmd_in(req2_cmd_in),
      .req2_data_in(req2_data_in),
      .req3_cmd_in(req3_cmd_in),
      .req3_data_in(req3_data_in),
      .req4_cmd_in(req4_cmd_in),
      .req4_data_in(req4_data_in),
      .reset(reset),
      .scan_in(scan_in),
      .out_data1(out_data1),
      .out_data2(out_data2),
      .out_data3(out_data3),
      .out_data4(out_data4),
      .out_resp1(out_resp1),
      .out_resp2(out_resp2),
      .out_resp3(out_resp3),
      .out_resp4(out_resp4),
      .scan_out(scan_out)
   );

   // Clock generation
   always #((CLK_PERIOD)/2) c_clk <= ~c_clk;
  
   // Test stimuli
   initial begin
      // Reset
      reset = 7'b1111111;
     req1_data_in = 32'h0000_0000;
     req2_data_in = 32'h0000_0000;
     req3_data_in = 32'h0000_0000;
     req4_data_in = 32'h0000_0000;
     req1_cmd_in = 4'b0000;
     req2_cmd_in = 4'b0000;
     req3_cmd_in = 4'b0000;
     req4_cmd_in = 4'b0000;
      
      #70 ; 
      reset = 7'b0000000;
      
      #30;

      // Send requests
      
      // 1.1 To check the basic commmand-response protocol on each port using ADD operation.
      
      req1_cmd_in = 4'b0001;
      req1_data_in = 32'h8000_2345;
      
      req2_cmd_in = 4'b0010;
      req2_data_in = 32'h0000_0011;
      
      req3_cmd_in = 4'b0001;
      req3_data_in = 32'h8000_2345;
      
      req4_cmd_in = 4'b0101;
      req4_data_in = 32'h0000_0001;
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0001;
      
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0001_0000;
      
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0000_0001;
      
      #60;
      
      
      // 1.2 To check basic operation( ADD, SUB, SHIFT LEFT, SHIFT RIGHT) on each port - 4 operations * 4 ports so 16 possibilities 
      
        req1_cmd_in = 4'b0001;
      req1_data_in = 32'h8000_2345;
      
      req2_cmd_in = 4'b0010;
      req2_data_in = 32'h0000_0011;
      
      req3_cmd_in = 4'b0101;
      req3_data_in = 32'h0000_0110;
      
      
      req4_cmd_in = 4'b0110;
      req4_data_in = 32'h1000_0008; 
      
      
      #10;
      
        req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0010;
      
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0000_0001;
      
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0000_0003; 
      
      #60;
      
      
      
      req1_cmd_in = 4'b0110;
      req1_data_in = 32'h0000_0008;
      
      req2_cmd_in = 4'b0001;
      req2_data_in = 32'h8000_2345;
      
      req3_cmd_in = 4'b0010;
      req3_data_in = 32'h0000_0011;
      
      req4_cmd_in = 4'b0101;
      req4_data_in = 32'h0000_0110; 
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0000_0003;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0001_0000;
      
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0000_0010;
      
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0000_0001;
      
      #60;
      
      
      req1_cmd_in = 4'b0101;
      req1_data_in = 32'h0000_0110;
       
      req2_cmd_in = 4'b0110;
      req2_data_in = 32'h0000_0008;
      
      req3_cmd_in = 4'b0001;
      req3_data_in = 32'h8000_2345;
      
      req4_cmd_in = 4'b0010;
      req4_data_in = 32'h0000_0011; // SUB operation is not working in port 4.
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0000_0001;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0003;
      
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0001_0000;
      
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0000_0010; // SUB operation is not working in port 4.
      
      #60;
      
      
      
      req1_cmd_in = 4'b0010;
      req1_data_in = 32'h0000_0011;
      
      req2_cmd_in = 4'b0101;
      req2_data_in = 32'h0000_0110;
       
      req3_cmd_in = 4'b0110;
      req3_data_in = 32'h0000_0008;
      
      req4_cmd_in = 4'b0001;
      req4_data_in = 32'h8000_2345; // ADD operation is not working in port 4.
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0000_0010;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0001;
      
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0000_0003;
      
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0001_0000;  // ADD operation is not working in port 4.
      
      #60;
      
      
      
      // 1.3 To check overflow and undrflow operation for ADD and SUB operations.
      
      
      req1_cmd_in = 4'b0001;
      req1_data_in = 32'hFFFF_FFFF; // overflow seems to work but getting successfull (b'01) rather than (b'10).
      
      req2_cmd_in = 4'b0010;
      req2_data_in = 32'h1111_1111; // underflow seems to work but getting successfull (b'01) rather than (b'10).
      
      #10
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h00000002; 
                                          // Except port 4, the same thing is happening in other ports for Overflow and underflow commands.
                                          // Port 4 is not supporting ADD and SUB operations at all.
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h2222_2222;
      
      #60;
      
  
      
    // 2.1.1 For  each port, check that each command can have any command follow it without leaving the state of the design dirty such that the folowing command is corrupted.
    
     req1_cmd_in = 4'b0001;                // port 1
      req1_data_in = 32'h8000_2345;
      #10;
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
      #10;
      req1_cmd_in = 4'b0010;
      req1_data_in = 32'h8000_2345;
      #10;
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
	  #10;
	   req2_cmd_in = 4'b0001;              // port 2
      req2_data_in = 32'h8000_2345;
      #10;
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0001_0000;
      #10;
      req2_cmd_in = 4'b0010;
      req2_data_in = 32'h8000_2345;
      #10;
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0001_0000;
	  #10;
	  
	  req4_cmd_in = 4'b0110;   // Shift right command  port 4
      req4_data_in = 32'h0000_0008;   
      req3_cmd_in = 4'b0101;  // Shift left command  port 3
      req3_data_in = 32'h0000_0001;
      #10;
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h1110_0003; 
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h1110_0001;
	  #10
	  req4_cmd_in = 4'b0110;   // Shift left command  port 4
      req4_data_in = 32'h0000_0008;   
      req3_cmd_in = 4'b0101;  // Shift right command  port 3
      req3_data_in = 32'h0000_0001;
      #10;
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h1110_0003; 
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h1110_0001;
	  #10;                     // no problem faced with comand after command statements in four ports.
	  
	  
    // 2.1.2 Across all ports (eg. four concurrent ADDs doesnt interfere with each other) check that each command can have any command follow it without leaving the design dirty, such that the folowing command is corrupted. 
     
	 req1_cmd_in = 4'b0001;                // port 1
      req1_data_in = 32'h8000_2345;
	   req2_cmd_in = 4'b0001;                // port 2
      req2_data_in = 32'h8000_2345;
	   req3_cmd_in = 4'b0110;                // port 3
      req3_data_in = 32'h8000_2345;
	   req4_cmd_in = 4'b00110;                // port 4
      req4_data_in = 32'h8000_2345;
      #10;
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
	  req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0001_0000;
	  req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0001_0000;
	  req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0001_0000;
	  #10;
	  	 req1_cmd_in = 4'b0010;                // port 1
      req1_data_in = 32'h8000_2345;
	   req2_cmd_in = 4'b0010;                // port 2
      req2_data_in = 32'h8000_2345;
	   req3_cmd_in = 4'b0110;                // port 3
      req3_data_in = 32'h8000_2345;
	   req4_cmd_in = 4'b00110;                // port 4
      req4_data_in = 32'h8000_2345;
      #10;
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
	  req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0001_0000;
	  req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0001_0000;
	  req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0001_0000;         // when all the ports are given commands simultanously port 1 and port 3 gave outputs at same time while other ports took more time. 
	                                           //When commands were given one after other the output data of port 2 and 4 for first commands is skipped.
	  
    // 2.2 check that there is fairness across all four ports such that no port has higher priority than others 
  
      req1_cmd_in = 4'b0001;                // port 1
      req1_data_in = 32'h8000_2345;
	   req2_cmd_in = 4'b0001;                // port 2
      req2_data_in = 32'h8000_2345;
      
      #10;
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
	  req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0001_0000;
	 #10;
	 
	   req3_cmd_in = 4'b0110;                // port 3
      req3_data_in = 32'h8000_2345;
	   req4_cmd_in = 4'b00110;                // port 4
      req4_data_in = 32'h8000_2345;
      #10;
      
	  req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0001_0000;
	  req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0001_0000;
	  #10;                                   // priority is given to 1 and 3 ports more. While data passed simultaneously port 1 and 3 give result faster.
     
      
      // 2.3 check that high order 27 bits are ignored in the second operand of shift commands 
      
      
      req4_cmd_in = 4'b0110;   // Shift right command 
      req4_data_in = 32'h0000_0008; 
      
      req3_cmd_in = 4'b0101;  // Shift left command 
      req3_data_in = 32'h0000_0001;
      
      
      #10;
      
      
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h1110_0003; 
                                                // the high order bit are being ignored and expected values are produced 
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h1110_0001;
      
      
      
      // 2.4.1 Data dependent corner case :- add two numbers that overflow by 1 ("FFFF_FFFF"+ "0000_0001")
      
      
      req1_cmd_in = 4'b0001;
      req1_data_in = 32'hFFFF_FFFF;
      
      #10
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h00000001;
      
      
      
      // 2.4.2 Data dependent corner case :- add two numbers whose sum is "FFFF_FFFF"X.
      
      
      
      req1_cmd_in = 4'b0001;
      req1_data_in = 32'h7FFF_FFFF;
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h80000000;
      
     
      
      // 2.4.3 subtract two equal numbers  
      
      
      req1_cmd_in = 4'b0010;
      req1_data_in = 32'h7FFF_FFFF;
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h7FFF_FFFF; // Desired output is obtained 32'h0000_0000.
      
      
      
      // 2.4.4 subtract a number that underflows by 1(operand 2 is greater than operand 1)
      
      req1_cmd_in = 4'b0010;
      req1_data_in = 32'h1111_1111; 
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h2222_2222;  // underflow does happen here but instead of '10' underflow response '01' sucessfull response is coming output data bus has a value that is of negative number.
      
      
      
      //2.4.5 Shift 0 places
      
      req4_cmd_in = 4'b0110;
      req4_data_in = 32'h0000_0008; // Shift Right is showing successful command response but the output data is "0000_0000" which is not the expected o/p data.
      
      #10;
      
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0000_0000;
      
      #10;
      
      req2_cmd_in = 4'b0101;
      req2_data_in = 32'h0000_0008; // Shift Left is showing successful command response but the output data is "0000_0000" which is not the expected o/p data. 
      
      #10;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0000;
      
      #40;
      
     
      
      // 2.4.6 shift 31 places 
      
      req4_cmd_in = 4'b0110;
      req4_data_in = 32'h8000_0000;   // Shift Right is showing successful command response and expected output data is obtained. ('h0000_0001)      
      
      req2_cmd_in = 4'b0101;
      req2_data_in = 32'h0000_0008;   // Shift left is not working as expected.
      
      #10;
      
      req4_cmd_in = 4'b0000;
      req4_data_in = 32'h0000_001f;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0000;
      
       
      
      // 2.5 check that the design ignores data input unless the data are supposed to be valid.
      
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0000; // performing operation by giving invalid command b'0000, the design does not proceed with it further.
      
      req3_cmd_in = 4'b0001;
      req3_data_in = 32'h0000_0000;
      
      #10;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0000;  // performing operation with an valid command b'0001 which is ADD, where 32'h0000_0000 .
      
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0000_0001;
      
      
      
      // 3.1 check that the design correctly handles illegal commands. 
      
       req2_cmd_in = 4'b1111;         // with invalid illegal commands, it's not accepting the values and doesnt give response at all.
      req2_data_in = 32'h0000_0001;
      
      req3_cmd_in = 4'b0001;
      req3_data_in = 32'h8000_2345; // with valid legal commands, it's accepting the values and giving proper responses.
      
      #10;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0000_0002;
      
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0001_0000;
      
      
      
      
      // 3.2 check all outputs all of the time.Calc1 should not generate superfluous output values.
      
      
      req1_cmd_in = 4'b0001;
      req1_data_in = 32'h8000_2345;
      
      req2_cmd_in = 4'b0001;
      req2_data_in = 32'h8000_2345;
      
      req3_cmd_in = 4'b0001;
      req3_data_in = 32'h8000_2345;
      
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
      
      req2_cmd_in = 4'b0000;
      req2_data_in = 32'h0001_0000;
      
      req3_cmd_in = 4'b0000;
      req3_data_in = 32'h0001_0000;
    
      // 3.3 Check that reset function correctly resets the design.
      
      req1_cmd_in = 4'b0001;
      req1_data_in = 32'h8000_2345;
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;   // In order to check the reset's proper functioning, we are performing two addition operation 
                                      // one before reset and one after reset
      
      #40;
                                      // 100ns- 1st operand, 110ns- 2nd operand, 120ns- the output response
      
      reset=7'b1111111;               // 150ns- reset to '1111111
      
      #20;
      
      reset=7'b0000000;               //170 ns- reset to '0000000      
      
      req1_cmd_in = 4'b0001;          //170ns- start of second add operation 1st operand 180ns- 2nd operand 190ns- the output response.
      req1_data_in = 32'h8000_2345;
      
      #10;
      
      req1_cmd_in = 4'b0000;
      req1_data_in = 32'h0001_0000;
      
      
      end
  
endmodule