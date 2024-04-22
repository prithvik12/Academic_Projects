
class transaction;
rand logic [0:31] req1_data_in1;
rand logic [0:31] req2_data_in1;
rand logic [0:31] req3_data_in1;
rand logic [0:31] req4_data_in1;
rand logic [0:31] req1_data_in2;
rand logic [0:31] req2_data_in2;
rand logic [0:31] req3_data_in2;
rand logic [0:31] req4_data_in2;
rand logic [0:3] req1_cmd_in;
rand logic [0:3] req2_cmd_in;
rand logic [0:3] req3_cmd_in;
rand logic [0:3] req4_cmd_in;
rand logic [0:1] req1_tag_in, req2_tag_in, req3_tag_in, req4_tag_in;

logic [0:31] out_data1;
logic [0:31] out_data2; 
logic [0:31] out_data3;
logic [0:31] out_data4;
logic [0:1] out_resp1;
logic [0:1] out_resp2;
logic [0:1] out_resp3;
logic [0:1] out_resp4;
logic [0:1] out_tag1, out_tag2, out_tag3, out_tag4;



constraint C1 {
req1_cmd_in inside {1,2,5,6};}
constraint C2 {
req2_cmd_in inside {1,2,5,6};}
constraint C3 {
req3_cmd_in inside {1,2,5,6};}
constraint C4 {
req4_cmd_in inside {1,2,5,6};}
constraint C5 {
req1_data_in1 inside {[32'h00000000 : 32'hFFFFFFFF]};
req1_data_in2 inside {[32'h00000000 : 32'hFFFFFFFF]}; }


constraint C6 {
  req2_data_in1 inside {[32'h00000000 : 32'hFFFFFFFF]};
req2_data_in2 inside {[32'h00000000 : 32'hFFFFFFFF]}; }

constraint C7 {
    req3_data_in1 inside {[32'h00000000 : 32'hFFFFFFFF]};
req3_data_in2 inside {[32'h00000000 : 32'hFFFFFFFF]}; }

constraint C8 {
  req4_data_in1 inside {[32'h00000000 : 32'hFFFFFFFF]};
req4_data_in2 inside {[32'h00000000 : 32'hFFFFFFFF]}; }
  

function void display_in(input string msg);
     $display("[%0s] : req1_data_in1 : %0h\t req1_data_in2 : %0h\t  req1_cmd_in :%0h\t  req1_tag_in:%0h\t   @%0t", msg,  req1_data_in1, req1_data_in2, req1_cmd_in,req1_tag_in,$time);
        
     
     $display("[%0s] : req2_data_in1 : %0h\t req2_data_in2 : %0h\t  req2_cmd_in :%0h\t  req2_tag_in:%0h\t   @%0t", msg,  req2_data_in1, req2_data_in2, req2_cmd_in,req2_tag_in,$time);
       
     
     $display("[%0s] : req3_data_in1 : %0h\t req3_data_in2 : %0h\t  req3_cmd_in :%0h\t  req3_tag_in:%0h\t   @%0t", msg,  req3_data_in1, req3_data_in2, req3_cmd_in,req3_tag_in,$time);
    
     
     $display("[%0s] : req4_data_in1 : %0h\t req4_data_in2 : %0h\t  req4_cmd_in :%0h\t  req4_tag_in:%0h\t   @%0t", msg,  req4_data_in1, req4_data_in2, req4_cmd_in,req4_tag_in,$time);
     $display("");
     $display("");
     
endfunction

function void display_out(input string msg);
  
$display("[%0s] : out_resp1 : %0h\t out_tag1 : %0h\t out_data1 : %0h @ %0t", msg,  out_resp1, out_tag1, out_data1,$time);

$display("[%0s] : out_resp2 : %0h\t out_tag2 : %0h\t out_data2 : %0h @ %0t", msg,  out_resp2, out_tag2, out_data2,$time);

$display("[%0s] : out_resp3 : %0h\t out_tag3 : %0h\t out_data3 : %0h @ %0t", msg,  out_resp3, out_tag3, out_data3,$time); 

$display("[%0s] : out_resp4 : %0h\t out_tag4 : %0h\t out_data4 : %0h @ %0t", msg,  out_resp4, out_tag4, out_data4,$time);
$display("");
$display("");

endfunction

function transaction copy();
  copy = new();
  copy.req1_data_in1 = req1_data_in1;
  copy.req2_data_in1 = req2_data_in1;
  copy.req3_data_in1 = req3_data_in1;
  copy.req4_data_in1 = req4_data_in1;
  copy.req1_data_in2 = req1_data_in2;
  copy.req2_data_in2 = req2_data_in2;
  copy.req3_data_in2 = req3_data_in2;
  copy.req4_data_in2 = req4_data_in2;
  copy.req1_cmd_in = req1_cmd_in;
  copy.req2_cmd_in = req2_cmd_in;
  copy.req3_cmd_in = req3_cmd_in;
  copy.req4_cmd_in = req4_cmd_in;
  copy.req1_tag_in = req1_tag_in;
  copy.req2_tag_in = req2_tag_in;
  copy.req3_tag_in = req3_tag_in;
  copy.req4_tag_in = req4_tag_in;
  
  copy.out_data1 = out_data1;
  copy.out_data2 = out_data2;
  copy.out_data3 = out_data3;
  copy.out_data4 = out_data4;
  copy.out_resp1 = out_resp1;
  copy.out_resp2 = out_resp2;
  copy.out_resp3 = out_resp3;
  copy.out_resp4 = out_resp4;
  copy.out_tag1 = out_tag1;
  copy.out_tag2 = out_tag2;
  copy.out_tag3 = out_tag3;
  copy.out_tag4 = out_tag4;
  
endfunction
endclass
  

  