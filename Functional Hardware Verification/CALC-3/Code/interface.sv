
interface calc3_if(input c_clk);
logic [0:31] req1_data;
logic [0:31] req2_data;
logic [0:31] req3_data;
logic [0:31] req4_data;
logic [0:3]  req1_d1;
logic [0:3]  req2_d1;
logic [0:3]  req3_d1;
logic [0:3]  req4_d1;
logic [0:3]  req1_d2;
logic [0:3]  req2_d2;
logic [0:3]  req3_d2;
logic [0:3]  req4_d2;
logic [0:3]  req1_r1;
logic [0:3]  req2_r1;
logic [0:3]  req3_r1;
logic [0:3]  req4_r1;
logic [0:3] req1_cmd;
logic [0:3] req2_cmd;
logic [0:3] req3_cmd;
logic [0:3] req4_cmd;
logic [0:1] 	 req1_tag, req2_tag, req3_tag, req4_tag;
logic [1:7] reset;
logic scan_in;
logic scan_out;
logic [0:3] error_found;
logic a_clk, b_clk;
logic [0:1] out1_resp;
logic [0:1] out2_resp;
logic [0:1] out3_resp;
logic [0:1] out4_resp;
logic [0:31] out1_data;
logic [0:31] out2_data;
logic [0:31] out3_data;
logic [0:31] out4_data;
logic [0:1] out1_tag, out2_tag, out3_tag, out4_tag;


//clocking block driver
clocking cb @(posedge c_clk);
output a_clk;
output b_clk;
output error_found;
output req1_cmd;
output req1_data;
output req2_cmd;
output req2_data;
output req3_cmd;
output req3_data;
output req4_cmd;
output req4_data;
output  req1_d1;
output  req2_d1;
output  req3_d1;
output  req4_d1;
output  req1_d2;
output  req2_d2;
output  req3_d2;
output  req4_d2;
output  req1_r1;
output  req2_r1;
output  req3_r1;
output  req4_r1;
output reset;
output scan_in;
output	 req1_tag, req2_tag, req3_tag, req4_tag;

endclocking 

//clocking block monitor
clocking monitor_cb @(posedge c_clk);
input out1_data;
input out2_data;
input out3_data;
input out4_data;
input out1_resp;
input out2_resp;
input out3_resp;
input out4_resp;
input scan_out;

input a_clk;
input b_clk;
input out1_tag, out2_tag, out3_tag, out4_tag;


endclocking 


modport driver(clocking cb);
modport monitor(clocking monitor_cb);
modport SLAVE(output out1_data, out2_data, out3_data, out4_data,req1_r1,req2_r1,req3_r1,req4_r1, out1_resp, out2_resp, out3_resp, out4_resp,out1_tag, out2_tag, out3_tag, out4_tag, scan_out, 
input a_clk, b_clk, c_clk, error_found, req1_cmd, req1_data, req2_cmd, req2_data, req3_cmd, req3_data, req4_cmd, req4_data,req1_d1,req2_d1,req3_d1,req4_d1,
      req1_d2,req2_d2,req3_d2,req4_d2,req1_tag, req2_tag, req3_tag, req4_tag, reset, scan_in);

endinterface