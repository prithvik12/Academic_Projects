class transaction;



//Inputs to the Calc 3 Port1,Port2,Port3 and Port4.
// 4 bit Command for ADD(0001), Subtract(0010), Shift_Left(0101) and Shift_Right(0110)
rand logic [0:3] 	 req1_cmd;
rand logic [0:3] 	 req2_cmd;
rand logic [0:3] 	 req3_cmd;
rand logic [0:3] 	 req4_cmd;


// 2 bit tag for the input port
rand logic [0:1] 	 req1_tag;
rand logic [0:1]    req2_tag;
rand logic [0:1]    req3_tag;
rand logic [0:1]    req4_tag;

// 32 bit  d1 and d2 from registers.
rand logic [0:3]  req1_d1;
rand logic [0:3]  req2_d1;
rand logic [0:3]  req3_d1;
rand logic [0:3]  req4_d1;

rand logic [0:3]  req1_d2;
rand logic [0:3]  req2_d2;
rand logic [0:3]  req3_d2;
rand logic [0:3]  req4_d2;

// 32 bit input data
rand logic [0:31]  req1_data;
rand logic [0:31]  req2_data;
rand logic [0:31]  req3_data;
rand logic [0:31]  req4_data;

// 4 bit register r1 for each port.

rand logic [0:3] 	 req1_r1;
rand logic [0:3] 	 req2_r1;
rand logic [0:3] 	 req3_r1;
rand logic [0:3] 	 req4_r1;

//Outputs from the Calc 3 Ports
//Response signal shows if the response is one ang Good response, Underflow/overflow/Invalid command, internal error and no response
logic[0:1] out1_resp;
logic[0:1] out2_resp;
logic[0:1] out3_resp;
logic[0:1] out4_resp;

logic[0:1] out1_tag;
logic[0:1] out2_tag;
logic[0:1] out3_tag;
logic[0:1] out4_tag;

// 32 bit Output data
logic [0:31]  out1_data;
logic [0:31]  out2_data;
logic [0:31]  out3_data;
logic [0:31]  out4_data;


 function void display(input string msg);
     $display("[%0s] :req1_cmd : %0b\t  req1_tag:%0b\t req1_d1 : %0d\t req1_d2 : %0d\t req1_data: %d\t req1_r1 : %0d\t out1_resp : %0d\t out1_tag : %0b\t out1_data : %0b @ %0t", msg,  req1_cmd,req1_tag, req1_d1, req1_d2, req1_data, req1_r1, out1_resp, out1_tag, out1_data,$time);   
     $display("[%0s] :req2_cmd : %0b\t  req2_tag:%0b\t req2_d1 : %0d\t req2_d2 : %0d\t req2_data: %d\t req2_r1 : %0d\t out2_resp : %0d\t out2_tag : %0b\t out2_data : %0b @ %0t", msg,  req2_cmd,req2_tag, req2_d1, req2_d2, req2_data, req2_r1, out2_resp, out2_tag, out2_data,$time);   
     $display("[%0s] :req3_cmd : %0b\t  req3_tag:%0b\t req3_d1 : %0d\t req3_d2 : %0d\t req3_data: %d\t req3_r1 : %0d\t out3_resp : %0d\t out3_tag : %0b\t out3_data : %0b @ %0t", msg,  req3_cmd,req3_tag, req3_d1, req3_d2, req3_data, req3_r1, out3_resp, out3_tag, out3_data,$time);   
     $display("[%0s] :req4_cmd : %0b\t  req4_tag:%0b\t req4_d1 : %0d\t req4_d2 : %0d\t req4_data: %d\t req4_r1 : %0d\t out4_resp : %0d\t out4_tag : %0b\t out4_data : %0b @ %0t", msg,  req4_cmd,req4_tag, req4_d1, req4_d2, req4_data, req4_r1, out4_resp, out4_tag, out4_data,$time);   

endfunction
  
  function transaction copy();
    copy = new();
    copy.req1_cmd = this.req1_cmd;
    copy.req2_cmd = this.req2_cmd;
    copy.req3_cmd = this.req3_cmd;
    copy.req4_cmd = this.req4_cmd;
    copy.req1_tag = this.req1_tag;
    copy.req2_tag = this.req2_tag;
    copy.req3_tag = this.req3_tag;
    copy.req4_tag = this.req4_tag;
    copy.req1_d1 = this.req1_d1;
    copy.req2_d1 = this.req2_d1;
    copy.req3_d1 = this.req3_d1;
    copy.req4_d1 = this.req4_d1;
    copy.req1_d2 = this.req1_d2;
    copy.req2_d2 = this.req2_d2;
    copy.req3_d2 = this.req3_d2;
    copy.req4_d2 = this.req4_d2;
    copy.req1_r1= this.req1_r1;
    copy.req2_r1= this.req2_r1;
    copy.req3_r1= this.req3_r1;
    copy.req4_r1= this.req4_r1;
    copy.req1_data= this.req1_data;
    copy.req2_data= this.req2_data;
    copy.req3_data= this.req3_data;
    copy.req4_data= this.req4_data;
    copy.out1_resp= this.out1_resp;
    copy.out2_resp= this.out2_resp;
    copy.out3_resp= this.out3_resp;
    copy.out4_resp= this.out4_resp;
    copy.out1_tag = this.out1_tag;
    copy.out2_tag = this.out2_tag;
    copy.out3_tag = this.out3_tag;
    copy.out4_tag = this.out4_tag;
    copy.out1_data = this.out1_data;
    copy.out2_data = this.out2_data;
    copy.out3_data = this.out3_data;
    copy.out4_data = this.out4_data;
  endfunction



/* module tb;
  
  transaction tr;
  
  initial begin
    tr = new();
    tr.display("TOP");    
  end
  
  
endmodule */





endclass: transaction