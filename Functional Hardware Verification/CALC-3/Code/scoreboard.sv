`include "Monitor.sv"

class scoreboard;
mailbox #(transaction) mon2scb , driv2scb;
event sconext;
int count;
transaction driv_tr;
transaction mon_tr;

reg [0:32] exp_data1,exp_data2,exp_data3,exp_data4;
reg [0:32] shift_data1,shift_data2,shift_data3,shift_data4;
reg [0:3] exp_res1,exp_res2,exp_res3,exp_res4;
reg [0:1] exp_tag1,exp_tag2,exp_tag3,exp_tag4;
reg [0:63] exp1_r1 [0:15],exp2_r1[0:15],exp3_r1[0:15],exp4_r1[0:15];
reg [0:1] shift1 = 0,shift2=0,shift3=0,shift4=0;

function new(mailbox #(transaction) mon2scb,driv2scb);
this.driv2scb = driv2scb;
this.mon2scb = mon2scb;
endfunction

task scb_in1();
/*output [0:31] exp_data;
output exp_res;
input [0:31] req_data_ina, req_data_inb;
input [0:3] req_cmd_in;*/
 $display("@%0d: Expected caliculation method is started- f0r port1",
                   $time);
begin
shift1--;
if (shift1 == 0)begin
exp_tag1 = driv_tr.req1_tag ;
case(driv_tr.req1_cmd)
16'b0001 : begin
         exp1_r1[driv_tr.req1_r1] = exp1_r1[driv_tr.req1_d1] + exp1_r1[driv_tr.req1_d2];
         exp_data1 = 32'h0000;
       end
16'b0010 : begin
         exp1_r1[driv_tr.req1_r1] = exp1_r1[driv_tr.req1_d2] - exp1_r1[driv_tr.req1_d1];
         exp_data1 = 32'h0000;
        end
16'b0101 : begin
          shift_data1 = exp1_r1[driv_tr.req1_d2];
         exp1_r1[driv_tr.req1_r1] = exp1_r1[driv_tr.req1_d1] << shift_data1 [27:31];
         exp_data1 = 32'h0000;
        end
16'b0110 : begin
          shift_data1 = exp1_r1[driv_tr.req1_d2];
         exp1_r1[driv_tr.req1_r1] = exp1_r1[driv_tr.req1_d1] >> shift_data1 [27:31];
         exp_data1 = 32'h0000;
        end
16'b1001 : begin
         exp1_r1[driv_tr.req1_r1] = driv_tr.req1_data;
        end
16'b1010 : begin
         exp_data1 = exp1_r1[driv_tr.req1_d1];
        end
16'b1100 : begin
         if(exp1_r1[driv_tr.req1_d1]== 0)
             shift1++;
        end
16'b1101 : begin
         if(exp1_r1[driv_tr.req1_d1]== exp1_r1[driv_tr.req1_d1])
             shift1++;
        end
endcase
end
else begin
  $display ("command is skipped due to branching");
  exp_data1 = 32'h0001;
  exp_res1 = 2'b11 ;
end

if (exp_data1 > 32'hFFFFFFFF)
       exp_res1 = 2'b10;
else exp_res1= 2'b01;

 $display("@%0d: calculated expected data1 = %d and expected response1 = %d and expected tag1=%d - f0r port1",
                   $time,exp_data1,exp_res1,exp_tag1);
end
endtask

task scb_in2();
/*output [0:31] exp_data;
output exp_res;
input [0:31] req_data_ina, req_data_inb;
input [0:3] req_cmd_in;*/
 $display("@%0d: Expected caliculation method is started- f0r port2",$time);
 begin
shift2--;
if (shift2 == 0)begin
exp_tag2 = driv_tr.req2_tag ;
case(driv_tr.req2_cmd)
16'b0001 : begin
         exp2_r1[driv_tr.req2_r1] = exp2_r1[driv_tr.req2_d1] + exp2_r1[driv_tr.req2_d2];
         exp_data2 = 32'h0000;
       end
16'b0010 : begin
         exp2_r1[driv_tr.req2_r1] = exp2_r1[driv_tr.req2_d2] - exp2_r1[driv_tr.req2_d1];
         exp_data2 = 32'h0000;
        end
16'b0101 : begin
          shift_data2 = exp2_r1[driv_tr.req2_d2];
         exp2_r1[driv_tr.req2_r1] = exp2_r1[driv_tr.req2_d1] << shift_data2 [27:31];
         exp_data2 = 32'h0000;
        end
16'b0110 : begin
          shift_data2 = exp2_r1[driv_tr.req2_d2];
         exp2_r1[driv_tr.req2_r1] = exp2_r1[driv_tr.req2_d1] >> shift_data2 [27:31];
         exp_data2 = 32'h0000;
        end
16'b1001 : begin
         exp2_r1[driv_tr.req2_r1] = driv_tr.req2_data;
        end
16'b1010 : begin
         exp_data2 = exp2_r1[driv_tr.req2_d1];
        end
16'b1100 : begin
         if(exp2_r1[driv_tr.req2_d1]== 0)
             shift2++;
        end
16'b1101 : begin
         if(exp2_r1[driv_tr.req2_d1]== exp2_r1[driv_tr.req2_d1])
             shift2++;
        end
endcase
end
else begin
  $display ("command is skipped due to branching");
  exp_data2 = 32'h0001;
  exp_res1 = 2'b11 ;
end
if (exp_data2 > 32'hFFFFFFFF)
       exp_res2 = 2'b10;
else exp_res2 = 1'b1;
 
 $display("@%0d: calculated expected data2 = %d and expected response2 = %d and expected tag2=%d - f0r port2",
                   $time,exp_data2,exp_res2,exp_tag2);
end
endtask

task scb_in3();
/*output [0:31] exp_data;
output exp_res;
input [0:31] req_data_ina, req_data_inb;
input [0:3] req_cmd_in;*/
 $display("@%0d: Expected caliculation method is started- f0r port3",
                   $time);
begin
shift3--;
if (shift3 == 0)begin
exp_tag1 = driv_tr.req3_tag ;
case(driv_tr.req3_cmd)
16'b0001 : begin
         exp3_r1[driv_tr.req3_r1] = exp3_r1[driv_tr.req3_d1] + exp3_r1[driv_tr.req3_d2];
         exp_data3 = 32'h0000;
       end
16'b0010 : begin
         exp3_r1[driv_tr.req3_r1] = exp3_r1[driv_tr.req3_d2] - exp3_r1[driv_tr.req3_d1];
         exp_data3 = 32'h0000;
        end
16'b0101 : begin
          shift_data3 = exp3_r1[driv_tr.req3_d2];
         exp3_r1[driv_tr.req3_r1] = exp3_r1[driv_tr.req3_d1] << shift_data3 [27:31];
         exp_data3 = 32'h0000;
        end
16'b0110 : begin
          shift_data3 = exp3_r1[driv_tr.req3_d2];
         exp3_r1[driv_tr.req3_r1] = exp3_r1[driv_tr.req3_d1] >> shift_data3 [27:31];
         exp_data3 = 32'h0000;
        end
16'b1001 : begin
         exp3_r1[driv_tr.req3_r1] = driv_tr.req3_data;
        end
16'b1010 : begin
         exp_data3 = exp3_r1[driv_tr.req3_d1];
        end
16'b1100 : begin
         if(exp3_r1[driv_tr.req3_d1]== 0)
             shift3++;
        end
16'b1101 : begin
         if(exp3_r1[driv_tr.req3_d1]== exp3_r1[driv_tr.req3_d1])
             shift3++;
        end
endcase
end
else begin
  $display ("command is skipped due to branching");
  exp_data3 = 32'h0001;
  exp_res1 = 2'b11 ;
end

if (exp_data3 > 32'hFFFFFFFF)
       exp_res3 = 2'b10;
else exp_res3 = 1'b1;

 $display("@%0d: calculated expected data3 = %d and expected response3 = %d and expected tag3=%d - f0r port3",
                   $time,exp_data3,exp_res3,exp_tag3);
end
endtask


task scb_in4();
/*output [0:31] exp_data;
output exp_res;
input [0:31] req_data_ina, req_data_inb;
input [0:3] req_cmd_in;*/
 $display("@%0d: Expected caliculation method is started- f0r port4",
                   $time);
begin
shift4--;
if (shift4 == 0)begin
exp_tag1 = driv_tr.req4_tag ;
case(driv_tr.req4_cmd)
16'b0001 : begin
         exp4_r1[driv_tr.req4_r1] = exp4_r1[driv_tr.req4_d1] + exp4_r1[driv_tr.req4_d2];
         exp_data4 = 32'h0000;
       end
16'b0010 : begin
         exp4_r1[driv_tr.req4_r1] = exp4_r1[driv_tr.req4_d2] - exp4_r1[driv_tr.req4_d1];
         exp_data4 = 32'h0000;
        end
16'b0101 : begin
          shift_data4 = exp4_r1[driv_tr.req4_d2];
         exp4_r1[driv_tr.req4_r1] = exp4_r1[driv_tr.req4_d1] << shift_data3 [27:31];
         exp_data4 = 32'h0000;
        end
16'b0110 : begin
          shift_data3 = exp4_r1[driv_tr.req4_d2];
         exp4_r1[driv_tr.req4_r1] = exp4_r1[driv_tr.req4_d1] >> shift_data3 [27:31];
         exp_data4 = 32'h0000;
        end
16'b1001 : begin
         exp4_r1[driv_tr.req4_r1] = driv_tr.req4_data;
        end
16'b1010 : begin
         exp_data3 = exp4_r1[driv_tr.req4_d1];
        end
16'b1100 : begin
         if(exp4_r1[driv_tr.req4_d1]== 0)
             shift4++;
        end
16'b1101 : begin
         if(exp4_r1[driv_tr.req4_d1]== exp4_r1[driv_tr.req4_d1])
             shift4++;
        end
endcase
end
else begin
  $display ("command is skipped due to branching");
  exp_data3 = 32'h0001;
  exp_res1 = 2'b11 ;
end

if (exp_data4 > 32'hFFFFFFFF)
       exp_res4 = 2'b10;
else exp_res4=  1'b1;
 
 $display("@%0d: calculated expected data4 = %d and expected response4 = %d and expected tag4=%d - f0r port4",
                   $time,exp_data4,exp_res4,exp_tag4);
end
endtask


task main();


    $display($time, ": Starting scoreboard for %0d transaction", count);

forever
begin
driv2scb.get(driv_tr);
mon2scb.get(mon_tr);

fork
scb_in1();
scb_in2();
scb_in3();
scb_in4();
/*
scb_in (exp_out1,exp_res1,driv_tr.req4_data_ina,driv_tr.req1_data_inb,driv_tr.req1_cmd_in);
scb_in (exp_out2,exp_res2,driv_tr.req2_data_ina,driv_tr.req2_data_inb,driv_tr.req2_cmd_in);
scb_in (exp_out3,exp_res3,driv_tr.req3_data_ina,driv_tr.req3_data_inb,driv_tr.req3_cmd_in);
scb_in (exp_out4,exp_res4,driv_tr.req4_data_ina,driv_tr.req4_data_inb,driv_tr.req4_cmd_in);*/
join

fork
sub_check1();
sub_check2();
sub_check3();
sub_check4();
join
count++;
$display("scoreboard method completed");
-> sconext;
end
endtask


task sub_check1();
  begin
@(posedge intf1.out1_tag)
if (exp_tag1 == mon_tr.out1_tag)
  begin
  if ((exp_data1[1:32] == mon_tr.out1_data) && (exp_res1 == mon_tr.out1_resp))
      $display("@%0d: Data match---- expected_data1=%H monitor_Data1=%H ; expected_res1 = %d monitor_res1 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data1[0:31], mon_tr.out1_data, exp_res1, mon_tr.out1_resp,exp_tag1, mon_tr.out1_tag);
  else  $display("@%0d: *** ERROR *** expected_data1=%H monitor_Data1=%H ; expected_res1 = %d monitor_res1 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data1[0:31], mon_tr.out1_data, exp_res1, mon_tr.out1_resp,exp_tag1, mon_tr.out1_tag);
  end
else
     $display("@%0d: Tag didn't match---", $time);
     
  end
 
endtask

task sub_check2();
  begin
@(posedge intf1.out2_tag)
if (exp_tag2 == mon_tr.out2_tag)
  begin
  if ((exp_data2[1:32] == mon_tr.out2_data) && (exp_res2 == mon_tr.out2_resp))
      $display("@%0d: Data match---- expected_data2=%H monitor_Data2=%H ; expected_res2 = %d monitor_res2 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data2[0:31], mon_tr.out2_data, exp_res2, mon_tr.out2_resp,exp_tag2, mon_tr.out2_tag);
  else  $display("@%0d: *** ERROR *** expected_data2=%H monitor_Data2=%H ; expected_res2 = %d monitor_res2 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data2[0:31], mon_tr.out2_data, exp_res2, mon_tr.out2_resp,exp_tag2, mon_tr.out2_tag);
  end
else
     $display("@%0d: Tag didn't match---", $time);
     
  end
endtask

task sub_check3();
  begin
@(posedge intf1.out3_tag)
if (exp_tag3 == mon_tr.out3_tag)
  begin
  if ((exp_data3[1:32] == mon_tr.out3_data) && (exp_res3 == mon_tr.out3_resp))
      $display("@%0d: Data match---- expected_data3=%H monitor_Data3=%H ; expected_res3 = %d monitor_res3 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data3[0:31], mon_tr.out3_data, exp_res3, mon_tr.out3_resp,exp_tag3, mon_tr.out3_tag);
  else  $display("@%0d: *** ERROR *** expected_data3=%H monitor_Data3=%H ; expected_res3 = %d monitor_res3 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data3[0:31], mon_tr.out3_data, exp_res3, mon_tr.out3_resp,exp_tag3, mon_tr.out3_tag);
  end
else
     $display("@%0d: Tag didn't match--- ", $time);
     
  end
endtask

task sub_check4();
  begin
@(posedge intf1.out4_tag)
if (exp_tag4 == mon_tr.out4_tag)
  begin
  if ((exp_data4[1:32] == mon_tr.out4_data) && (exp_res4 == mon_tr.out4_resp))
      $display("@%0d: Data match---- expected_data4=%H monitor_Data4=%H ; expected_res4 = %d monitor_res4 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data4[0:31], mon_tr.out4_data, exp_res4, mon_tr.out4_resp,exp_tag4, mon_tr.out4_tag);
  else  $display("@%0d: *** ERROR *** expected_data4=%H monitor_Data4=%H ; expected_res4 = %d monitor_res4 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data4[0:31], mon_tr.out4_data, exp_res4, mon_tr.out4_resp,exp_tag4, mon_tr.out4_tag);
  end
else
     $display("@%0d: Tag didn't match---", $time);
     
  end
endtask

endclass




















/*function scb_in(logic [0:3] req_cmd_in,logic [0:34] out_data,logic [0:31] input1,logic [0:31] input2);
//output [0:31] exp_data;
//output exp_res;
logic [0:31] exp_data;
logic [0:3] exp_res;
//input [0:31] req_data_ina, req_data_inb;
//input [0:3] req_cmd_in;
forever
      begin
case(req_cmd_in)
4'd1 : 
begin
  exp_data = input1 + input2;
  exp_res = 1'b1;
	if(exp_data==out_data);
		$display("Match");
		count++;
end
4'd2 : 
begin
  exp_data = input1 - input2;
  exp_res = 1'b1;
	if(exp_data==out_data);
		$display("Match");
		count++;
end
4'd5 : 
begin
    exp_data = input1 << input2[0:4];
    exp_res = 1'b1;
	  if(exp_data==out_data);
		  $display("Match");
		  count++;
end
4'd6 : 
begin
         exp_data = input1 >> input2[0:4];
         if(exp_data==out_data);
		$display("Match");
		count++;
end
endcase
end
endfunction
task main();
$display("[scoreboard] Main Task:");
driv2scb.get(driv_tr);
mon2soc.get(mon_tr);
fork
scb_in(driv_tr.req1_cmd_in,driv_tr.out_data1,driv_tr.req1_data_ina,driv_tr.req1_data_inb);
scb_in(driv_tr.req2_cmd_in,driv_tr.out_data2,driv_tr.req2_data_ina,driv_tr.req2_data_inb);
scb_in(driv_tr.req3_cmd_in,driv_tr.out_data3,driv_tr.req3_data_ina,driv_tr.req3_data_inb);
scb_in(driv_tr.req4_cmd_in,driv_tr.out_data4,driv_tr.req4_data_ina,driv_tr.req4_data_inb);
join
$display("[scoreboard] count: %p",count);
endtask*/