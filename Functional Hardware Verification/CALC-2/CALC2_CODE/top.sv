//`include "/nfs/home/p/p_vindra/CALC_2_Modified/CALC_2_Modified/test_bench.sv"
`include "test_bench.sv"
module top;
  parameter simulation_cycle = 100;
  bit  scan_in = 0;
  logic scan_out ;
   bit [0:3] error_found = 0; 
  bit clk;
  always #(simulation_cycle/2) 
    clk = ~clk;

  calc2_if calc(clk); // CALC interafce
  calc2_test   t1(calc);  // Testbench program
 

calc2_top D1 (
  .out_data1(calc.SLAVE.out_data1),
  .out_data2(calc.SLAVE.out_data2),
  .out_data3(calc.SLAVE.out_data3),
  .out_data4(calc.SLAVE.out_data4),
  .out_resp1(calc.SLAVE.out_resp1),
  .out_resp2(calc.SLAVE.out_resp2),
  .out_resp3(calc.SLAVE.out_resp3),
  .out_resp4(calc.SLAVE.out_resp4),
  .out_tag1(calc.SLAVE.out_tag1),
  .out_tag2(calc.SLAVE.out_tag2),
  .out_tag3(calc.SLAVE.out_tag3),
  .out_tag4(calc.SLAVE.out_tag4),
  .scan_out(calc.SLAVE.scan_out),
  .a_clk(calc.SLAVE.a_clk),
  .b_clk(calc.SLAVE.b_clk),
  .c_clk(calc.SLAVE.c_clk),
  .req1_cmd_in(calc.SLAVE.req1_cmd_in),
  .req1_data_in(calc.SLAVE.req1_data_in),
  .req1_tag_in(calc.SLAVE.req1_tag_in),
  .req2_cmd_in(calc.SLAVE.req2_cmd_in),
  .req2_data_in(calc.SLAVE.req2_data_in),
  .req2_tag_in(calc.SLAVE.req2_tag_in),
  .req3_cmd_in(calc.SLAVE.req3_cmd_in),
  .req3_data_in(calc.SLAVE.req3_data_in),
  .req3_tag_in(calc.SLAVE.req3_tag_in),
  .req4_cmd_in(calc.SLAVE.req4_cmd_in),
  .req4_data_in(calc.SLAVE.req4_data_in),
  .req4_tag_in(calc.SLAVE.req4_tag_in),
  .reset(calc.SLAVE.reset),
  .scan_in(calc.SLAVE.scan_in)
);

endmodule  

