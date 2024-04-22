module calc3_top_tb();

  // Declare signals for inputs and outputs
  logic [0:31] out1_data, out2_data, out3_data, out4_data;
  logic [0:1] out1_resp, out2_resp, out3_resp, out4_resp;
  logic [0:1] out1_tag, out2_tag, out3_tag, out4_tag;
  logic  scan_out;
  logic a_clk, b_clk, c_clk=1, reset;
  logic [0:3] req1_cmd, req2_cmd, req3_cmd, req4_cmd;
  logic [0:3] req1_d1, req1_d2,  req2_d1, req2_d2, req1_r1, req2_r1, req3_r1, req4_r1;
  logic [0:3] req3_d1, req3_d2,  req4_d1, req4_d2;
  logic [0:1] req1_tag, req2_tag, req3_tag, req4_tag;
  logic [0:31] req1_data,req2_data,req3_data,req4_data;
  logic  scan_in;

  // Instantiate the DUT
  calc3_top dut (
    .out1_data(out1_data), .out1_resp(out1_resp), .out1_tag(out1_tag),
    .out2_data(out2_data), .out2_resp(out2_resp), .out2_tag(out2_tag),
    .out3_data(out3_data), .out3_resp(out3_resp), .out3_tag(out3_tag),
    .out4_data(out4_data), .out4_resp(out4_resp), .out4_tag(out4_tag),
    .scan_out(scan_out), .a_clk(a_clk), .b_clk(b_clk), .c_clk(c_clk),
    .req1_cmd(req1_cmd), .req1_d1(req1_d1), .req1_d2(req1_d2), .req1_data(req1_data),
    .req1_r1(req1_r1), .req1_tag(req1_tag), .req2_cmd(req2_cmd), .req2_d1(req2_d1),
    .req2_d2(req2_d2), .req2_data(req2_data), .req2_r1(req2_r1), .req2_tag(req2_tag),
    .req3_cmd(req3_cmd), .req3_d1(req3_d1), .req3_d2(req3_d2), .req3_data(req3_data),
    .req3_r1(req3_r1), .req3_tag(req3_tag), .req4_cmd(req4_cmd), .req4_d1(req4_d1),
    .req4_d2(req4_d2), .req4_data(req4_data), .req4_r1(req4_r1), .req4_tag(req4_tag),
    .reset(reset), .scan_in(scan_in)
  );
  // Add clock generators for a_clk, b_clk, and c_clk
 parameter simulation_cycle = 100; 
  always #(simulation_cycle/2) 
    c_clk = ~c_clk;


  // Reset the DUT and wait for some time
 

  // Add test vectors
  initial begin
    /*repeat(7) 
    begin
    @(posedge c_clk)
    reset <= 1;
    req1_cmd <= 4'b0000;
    req1_d1 <= 4'b0000;
    req1_d2<= 4'b0000;
  end*/
    #100;
    repeat(7) begin
    #100;
    reset <= 1;
    req1_cmd <= 4'b0000;
    req2_cmd <= 4'b0000;
    req3_cmd <= 4'b0000;
    req4_cmd <= 4'b0000;
  end
    reset <= 0;
    #100;
    // Send request 1
    @(posedge c_clk)begin 
    req1_cmd <= 4'b1001;
    req1_r1 <= 4'b0001;
    req1_data<= 32'h0001;
    req1_tag <= 2'b01;
    end
    #100
      // Send request 1
    @(posedge c_clk)begin 
    req1_cmd <= 4'b1001;
    req1_r1 <= 4'b0001;
    req1_data<= 32'h0002;
    req1_tag <= 2'b11;
    end
    #400;
    @(posedge c_clk)begin 
    req1_cmd <= 4'b0001;
    req1_d1 <= 4'b0001;
    req1_d2<= 4'b0001;
    req1_r1 <= 4'b0010;
    req1_data<= 32'h0001;
    req1_tag <= 2'b10;
  end
    #100;
    @(posedge c_clk)begin 
    req1_cmd <= 4'b1010;
    req1_d1 <= 4'b0011;
    req1_data<= 32'h0001;
    req1_tag <= 2'b11;
  end
   /* req1_cmd <= 4'b0000;
    req1_r1 <= 4'b0000;
    req1_data<= 32'h0000;
    req1_tag <= 2'b00;*/
  end
endmodule
