interface calc2_if(input c_clk);
logic [0:31] req1_data_in;
logic [0:31] req2_data_in;
logic [0:31] req3_data_in;
logic [0:31] req4_data_in;
logic [0:3] req1_cmd_in;
logic [0:3] req2_cmd_in;
logic [0:3] req3_cmd_in;
logic [0:3] req4_cmd_in;
logic [0:1] 	 req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;
logic reset;
logic scan_in;
logic scan_out;
logic [0:3] error_found;
logic a_clk, b_clk;
logic [0:1] out_resp1;
logic [0:1] out_resp2;
logic [0:1] out_resp3;
logic [0:1] out_resp4;
logic [0:31] out_data1;
logic [0:31] out_data2;
logic [0:31] out_data3;
logic [0:31] out_data4;
logic [0:1] out_tag1, out_tag2, out_tag3, out_tag4;


//clocking block driver

clocking cb @(posedge c_clk);
output a_clk;
output b_clk;
output error_found;
output req1_cmd_in;
output req1_data_in;
output req2_cmd_in;
output req2_data_in;
output req3_cmd_in;
output req3_data_in;
output req4_cmd_in;
output req4_data_in;
output reset;
output scan_in;
output	 req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;

endclocking 

//clocking block monitor

clocking monitor_cb @(posedge c_clk);
input out_data1;
input out_data2;
input out_data3;
input out_data4;
input out_resp1;
input out_resp2;
input out_resp3;
input out_resp4;
input scan_out;
input a_clk;
input b_clk;
input out_tag1, out_tag2, out_tag3, out_tag4;


endclocking 


modport driver(clocking cb);
modport monitor(clocking monitor_cb);
modport SLAVE(output out_data1, out_data2, out_data3, out_data4, out_resp1, out_resp2, out_resp3, out_resp4,out_tag1, out_tag2, out_tag3, out_tag4, scan_out, 
input a_clk, b_clk, c_clk, error_found, req1_cmd_in, req1_data_in, req2_cmd_in, req2_data_in, req3_cmd_in, req3_data_in, req4_cmd_in, req4_data_in,
      req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in, reset, scan_in);

endinterface