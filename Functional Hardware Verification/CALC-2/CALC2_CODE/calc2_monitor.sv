`include "calc2_master.sv"

class monitor;
virtual calc2_if.monitor_cb intf2;
mailbox #(transaction) mon2scb;
transaction tr;
int no_iterations;

function new(virtual calc2_if.monitor_cb intf2,mailbox #(transaction) mon2scb);
this.intf2 = intf2;
this.mon2scb = mon2scb;
endfunction

task input1();
  begin
@(intf2.out_data1 or intf2.out_resp1);
$display("@ %0t [MONITOR] write to port1 \n",$time);
tr.out_data1=intf2.out_data1;
tr.out_resp1=intf2.out_resp1;
tr.out_tag1=intf2.out_tag1;
end
endtask

task input2();
  begin
  @(intf2.out_data2 or intf2.out_resp2);
$display("@ %0t [MONITOR] write to port2 \n",$time);
tr.out_data2=intf2.out_data2;
tr.out_resp2=intf2.out_resp2;
tr.out_tag2=intf2.out_tag2;
end
endtask

task input3();
  begin
  @(intf2.out_data3 or intf2.out_resp3);
$display("@ %0t [MONITOR] write to port3 \n",$time);
tr.out_data3=intf2.out_data3;
tr.out_resp3=intf2.out_resp3;
tr.out_tag3=intf2.out_tag3;
end
endtask

task input4();
  begin
  @(intf2.out_data4 or intf2.out_resp4);
$display("@ %0t [MONITOR] write to port4 \n",$time);
tr.out_data4=intf2.out_data4;
tr.out_resp4=intf2.out_resp4;
tr.out_tag4=intf2.out_tag4;
end
endtask

task mnt_main;
forever 
begin
 @(negedge intf2.monitor_cb);
 #200ns;
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
tr.display_out("Monitor");
end
$display("monitor task completed");
endtask

endclass