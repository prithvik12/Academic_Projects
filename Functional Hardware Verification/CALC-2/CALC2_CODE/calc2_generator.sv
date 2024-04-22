`include "calc2_transaction.sv"
`include "calc2_coverage.sv"

class generator;
transaction trans;
coverage cov;

mailbox #(transaction) gen2driv;
int iteration;
event drinext;
event sconext;
event exit;
// custom constructor
function new(mailbox #(transaction) gen2driv);
this.gen2driv = gen2driv;
endfunction

//main task togenerate transaction
task major();
  
repeat(iteration)
begin
trans = new();
cov=new();
if (!trans.randomize()) 
begin
$display("randomization failed");
end


trans.display_in("GENERATOR:");

gen2driv.put(trans.copy);

cov.fun_cov(trans.req1_cmd_in,trans.req2_cmd_in,trans.req3_cmd_in,trans.req4_cmd_in, trans.req1_data_in1, trans.req1_data_in2, trans.req2_data_in1, trans.req2_data_in2,trans.req3_data_in1, trans.req3_data_in2,trans.req4_data_in1, trans.req4_data_in2);

@(drinext);

@(sconext);
end
->exit;
endtask
endclass

