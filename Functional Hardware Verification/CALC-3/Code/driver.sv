
`include "generator.sv"

class driver;
int no_iterations;

virtual calc3_if inf1;
mailbox #(transaction) g2d, driv2scb;
transaction tr;
event drinext;
// custom constructor
function new(mailbox #(transaction) g2d, driv2scb, virtual calc3_if inf1);
this.g2d = g2d;
this.inf1 = inf1;
this.driv2scb = driv2scb;
endfunction

//input declerations for all input ports

task input1();
$display("@ %0t [DRIVER] write to port1 \n",$time);
@(negedge inf1.cb);
inf1.cb.req1_data <= tr.req1_data;
inf1.cb.req1_cmd <= tr.req1_cmd;
inf1.cb.req1_tag <= tr.req1_tag;
inf1.cb.req1_d1 <= tr.req1_d1;
inf1.cb.req1_d2 <= tr.req1_d2;
inf1.cb.req1_r1 <= tr.req1_r1;

endtask

task input2();
$display("@ %0t [DRIVER] write to port2 \n",$time);
@(negedge inf1.cb);
inf1.cb.req2_data <= tr.req2_data;
inf1.cb.req2_cmd <= tr.req2_cmd;
inf1.cb.req2_tag <= tr.req2_tag;
inf1.cb.req2_d1 <= tr.req2_d1;
inf1.cb.req2_d2 <= tr.req2_d2;
inf1.cb.req2_r1 <= tr.req2_r1;

endtask

task input3();
$display("@ %0t [DRIVER] write to port3 \n",$time);
@(negedge inf1.cb)
inf1.cb.req3_data <= tr.req3_data;
inf1.cb.req3_cmd <= tr.req3_cmd;
inf1.cb.req3_tag <= tr.req3_tag;
inf1.cb.req3_d1 <= tr.req3_d1;
inf1.cb.req3_d2 <= tr.req3_d2;
inf1.cb.req3_r1 <= tr.req3_r1;

endtask

task input4();
$display("@ %0t [DRIVER] write to port4 \n",$time);
@(negedge inf1.cb)
inf1.cb.req4_data <= tr.req4_data;
inf1.cb.req4_cmd <= tr.req4_cmd;
inf1.cb.req4_tag <= tr.req4_tag;
inf1.cb.req4_d1 <= tr.req4_d1;
inf1.cb.req4_d2 <= tr.req4_d2;
inf1.cb.req4_r1 <= tr.req4_r1;

endtask

task reset();
$display("reset is turned on");
  repeat(7)
  begin
    @(posedge inf1.cb)
inf1.cb.reset <=   1;
inf1.cb.req1_data <= 0;
inf1.cb.req2_data <= 0;
inf1.cb.req3_data <= 0;
inf1.cb.req4_data <= 0;
inf1.cb.req1_cmd <= 4'b0000;
inf1.cb.req2_cmd <= 4'b0000;
inf1.cb.req3_cmd <= 4'b0000;
inf1.cb.req4_cmd <= 4'b0000;
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
g2d.get(tr);
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
tr.display("Driver");
->drinext;
end
$display("@%t: run method ended", $time);

endtask

endclass