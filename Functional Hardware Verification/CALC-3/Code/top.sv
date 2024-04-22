
`include "calc3_test_bench.sv"
module top;
  parameter simulation_cycle = 100;
  bit  scan_in = 0;
  logic scan_out ;
   bit [0:3] error_found = 0; 
  bit clk;
  always #(simulation_cycle/2) 
    clk = ~clk;

  calc3_if calc(clk); // CALC interafce
  calc3_test   t1(calc);  // Testbench program
 // calc1_top    calc1(calc);  // Memory device

  calc3_top dut (
    .out1_data(calc.SLAVE.out1_data), .out1_resp(calc.SLAVE.out1_resp), .out1_tag(calc.SLAVE.out1_tag),
    .out2_data(calc.SLAVE.out2_data), .out2_resp(calc.SLAVE.out2_resp), .out2_tag(calc.SLAVE.out2_tag),
    .out3_data(calc.SLAVE.out3_data), .out3_resp(calc.SLAVE.out3_resp), .out3_tag(calc.SLAVE.out3_tag),
    .out4_data(calc.SLAVE.out4_data), .out4_resp(calc.SLAVE.out4_resp), .out4_tag(calc.SLAVE.out4_tag),
    .scan_out(calc.SLAVE.scan_out), .a_clk(calc.SLAVE.a_clk), .b_clk(calc.SLAVE.b_clk), .c_clk(calc.SLAVE.c_clk),
    .req1_cmd(calc.SLAVE.req1_cmd), .req1_d1(calc.SLAVE.req1_d1), .req1_d2(calc.SLAVE.req1_d2), .req1_data(calc.SLAVE.req1_data),
    .req1_r1(calc.SLAVE.req1_r1), .req1_tag(calc.SLAVE.req1_tag), .req2_cmd(calc.SLAVE.req2_cmd), .req2_d1(calc.SLAVE.req2_d1),
    .req2_d2(calc.SLAVE.req2_d2), .req2_data(calc.SLAVE.req2_data), .req2_r1(calc.SLAVE.req2_r1), .req2_tag(calc.SLAVE.req2_tag),
    .req3_cmd(calc.SLAVE.req3_cmd), .req3_d1(calc.SLAVE.req3_d1), .req3_d2(calc.SLAVE.req3_d2), .req3_data(calc.SLAVE.req3_data),
    .req3_r1(calc.SLAVE.req3_r1), .req3_tag(calc.SLAVE.req3_tag), .req4_cmd(calc.SLAVE.req4_cmd), .req4_d1(calc.SLAVE.req4_d1),
    .req4_d2(calc.SLAVE.req4_d2), .req4_data(calc.SLAVE.req4_data), .req4_r1(calc.SLAVE.req4_r1), .req4_tag(calc.SLAVE.req4_tag),
    .reset(calc.SLAVE.reset), .scan_in(calc.SLAVE.scan_in)
  );

endmodule