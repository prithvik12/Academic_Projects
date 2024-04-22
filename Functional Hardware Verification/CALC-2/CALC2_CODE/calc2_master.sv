`include "calc2_generator.sv"

class driver;
int no_iterations;
virtual calc2_if inf1;
mailbox #(transaction) gen2driv, driv2scb;
transaction tr;
event drinext;
// custom constructor
function new(mailbox #(transaction) gen2driv, driv2scb, virtual calc2_if inf1);
this.gen2driv = gen2driv;
this.inf1 = inf1;
this.driv2scb = driv2scb;
endfunction

//input declerations for all input ports


task input1();
$display("@ %0t [DRIVER] write to port1 \n",$time);
@(negedge inf1.cb);
inf1.cb.req1_data_in <= tr.req1_data_in1;
inf1.cb.req1_cmd_in <= tr.req1_cmd_in;
inf1.cb.req1_tag_in <= tr.req1_tag_in;
@(negedge inf1.cb);
inf1.cb.req1_cmd_in <= 0;
inf1.cb.req1_data_in <= tr.req1_data_in2;
endtask

task input2();
$display("@ %0t [DRIVER] write to port2 \n",$time);
@(negedge inf1.cb);
inf1.cb.req2_data_in <= tr.req2_data_in1;
inf1.cb.req2_cmd_in <= tr.req2_cmd_in;
inf1.cb.req2_tag_in <= tr.req2_tag_in;
@(negedge inf1.cb);
inf1.cb.req2_cmd_in <= 0;
inf1.cb.req2_data_in <= tr.req2_data_in2;
endtask

task input3();
$display("@ %0t [DRIVER] write to port3 \n",$time);
@(negedge inf1.cb)
inf1.cb.req3_data_in <= tr.req3_data_in1;
inf1.cb.req3_cmd_in <= tr.req3_cmd_in;
inf1.cb.req3_tag_in <= tr.req3_tag_in;
@(negedge inf1.cb)
inf1.cb.req3_data_in <= tr.req3_data_in2;
inf1.cb.req3_cmd_in <= 0;
endtask

task input4();
$display("@ %0t [DRIVER] write to port4 \n",$time);
@(negedge inf1.cb)
inf1.cb.req4_data_in <= tr.req4_data_in1;
inf1.cb.req4_cmd_in <= tr.req4_cmd_in;
inf1.cb.req4_tag_in <= tr.req4_tag_in;
@(negedge inf1.cb)
inf1.cb.req4_data_in <= tr.req4_data_in2;
inf1.cb.req4_cmd_in <= 0;
endtask

task reset();
$display("reset is turned on");
  repeat(7)
  begin
    @(posedge inf1.cb)
inf1.cb.reset <= 1'b1;
inf1.cb.req1_data_in <= 0;
inf1.cb.req2_data_in <= 0;
inf1.cb.req3_data_in <= 0;
inf1.cb.req4_data_in <= 0;
inf1.cb.req1_cmd_in <= 0;
inf1.cb.req2_cmd_in <= 0;
inf1.cb.req3_cmd_in <= 0;
inf1.cb.req4_cmd_in <= 0;
end
inf1.cb.reset <= 0;
$display("reset is turned off");
endtask

//running all tasks concurrently
task run();
$display("run method is started");
forever 
begin
//transaction tr;
gen2driv.get(tr);
fork
input1();
input2();
input3();
input4();
join
no_iterations++;
driv2scb.put(tr);
@(negedge inf1.cb);
$display("No of Iterations: %p",no_iterations);
tr.display_in("Driver");
->drinext;
end
$display("@%t: run method ended", $time);

endtask

endclass