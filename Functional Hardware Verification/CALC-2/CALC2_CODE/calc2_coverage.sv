

class coverage;
  
    logic [0:3] req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in;
  logic [0:31] req1_data_in1, req1_data_in2, req2_data_in1, req2_data_in2,req3_data_in1, req3_data_in2,req4_data_in1, req4_data_in2;

covergroup cvg;
   command1:coverpoint req1_cmd_in {bins cmd1={1,2,5,6};}
   command2:coverpoint req2_cmd_in {bins cmd2={1,2,5,6};}
   command3:coverpoint req3_cmd_in {bins cmd_3={1,2,5,6};}
   command4:coverpoint req4_cmd_in {bins cmd_4={1,2,5,6};}
   data11:coverpoint req1_data_in1 {bins data1_op1 = {[32'h00000000 : 32'hFFFFFFFF]};}
   data12:coverpoint req1_data_in2 {bins data2_op2 = {[32'h00000000 : 32'hFFFFFFFF]};}
   data21:coverpoint req2_data_in1 {bins data1_op1 = {[32'h00000000 : 32'hFFFFFFFF]};}
   data22:coverpoint req2_data_in2 {bins data2_op2 = {[32'h00000000 : 32'hFFFFFFFF]};}
   data31:coverpoint req3_data_in1 {bins data1_op1 = {[32'h00000000 : 32'hFFFFFFFF]};}
   data32:coverpoint req3_data_in2 {bins data2_op2 = {[32'h00000000 : 32'hFFFFFFFF]};}
   data41:coverpoint req4_data_in1 {bins data1_op1 = {[32'h00000000 : 32'hFFFFFFFF]};}
   data42:coverpoint req4_data_in2 {bins data2_op2 = {[32'h00000000 : 32'hFFFFFFFF]};}
   
   cross_coverage: cross command1,command2,command3,command4,data11,data12,data21,data22,data31,data32,data41,data42;
   
 endgroup

 function new();
    cvg = new;
  
    
  endfunction

function void fun_cov( req1_cmd_in,req2_cmd_in,req3_cmd_in,req4_cmd_in, req1_data_in1, req1_data_in2, req2_data_in1, req2_data_in2,req3_data_in1, req3_data_in2,req4_data_in1, req4_data_in2);
    
    this.req1_cmd_in=req1_cmd_in;
    this.req2_cmd_in=req2_cmd_in;
    this.req3_cmd_in=req3_cmd_in;
    this.req4_cmd_in=req4_cmd_in;
    this.req1_data_in1=req1_data_in1;
    this.req1_data_in2=req1_data_in2;
    this.req2_data_in1=req2_data_in1;
    this.req2_data_in2=req2_data_in2;
    this.req3_data_in1=req3_data_in1;
    this.req3_data_in2=req3_data_in2;
    this.req4_data_in1=req4_data_in1;
    this.req4_data_in2=req4_data_in2; 

	
  cvg.sample();
 endfunction 



endclass: coverage
