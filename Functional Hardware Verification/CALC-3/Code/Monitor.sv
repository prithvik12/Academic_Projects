

`include "driver.sv"

class monitor;
virtual calc3_if.monitor_cb intf2;
mailbox #(transaction) mon2scb;
transaction tr;
int no_iterations;

function new(virtual calc3_if.monitor_cb intf2,mailbox #(transaction) mon2scb);
this.intf2 = intf2;
this.mon2scb = mon2scb;
endfunction

task input1();
  begin
@(intf2.out1_data or intf2.out1_resp);
$display("@ %0t [MONITOR] write to port1 \n",$time);
tr.out1_data=intf2.out1_data;
tr.out1_resp=intf2.out1_resp;
tr.out1_tag=intf2.out1_tag;

end
endtask

task input2();
  begin
  @(intf2.out2_data or intf2.out2_resp);
$display("@ %0t [MONITOR] write to port2 \n",$time);
tr.out2_data=intf2.out2_data;
tr.out2_resp=intf2.out2_resp;
tr.out2_tag=intf2.out2_tag;

end
endtask

task input3();
  begin
  @(intf2.out3_data or intf2.out3_resp);
$display("@ %0t [MONITOR] write to port3 \n",$time);
tr.out3_data=intf2.out3_data;
tr.out3_resp=intf2.out3_resp;
tr.out3_tag=intf2.out3_tag;

end
endtask

task input4();
  begin
  @(intf2.out4_data or intf2.out4_resp);
$display("@ %0t [MONITOR] write to port4 \n",$time);
tr.out4_data=intf2.out4_data;
tr.out4_resp=intf2.out4_resp;
tr.out4_tag=intf2.out4_tag;

end
endtask

task mnt_main;
forever 
begin
 @(negedge intf2.monitor_cb);
 #400ns;
tr = new();
fork
input1();
input2();
input3();
input4();
join
mon2scb.put(tr);
no_iterations++;
$display("No of Iterations: %p",no_iterations);
tr.display("Monitor");
end
$display("monitor task completed");
endtask

endclass