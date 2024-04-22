`include "calc2_monitor.sv"


class scoreboard;
mailbox #(transaction) mon2scb , driv2scb;
event sconext;
int count;
int error_count;
int k1=0,k2=0,k3=0,k4=0;
transaction driv_tr;
transaction mon_tr;

reg [0:32] exp_data1,exp_data2,exp_data3,exp_data4;
reg [0:3] exp_res1,exp_res2,exp_res3,exp_res4;
reg [0:1] exp_tag1,exp_tag2,exp_tag3,exp_tag4;

reg [0:32] qa1[$],qa2[$],qa3[$],qa4[$],qb1[$],qb2[$],qb3[$],qb4[$];
reg [0:3] qc1[$],qc2[$],qc3[$],qc4[$],qd1[$],qd2[$],qd3[$],qd4[$];
reg [0:1] qe1[$],qe2[$],qe3[$],qe4[$],qf1[$],qf2[$],qf3[$],qf4[$];

function new(mailbox #(transaction) mon2scb,driv2scb);
this.driv2scb = driv2scb;
this.mon2scb = mon2scb;
endfunction

task scb_in1();

 $display("@%0d: Expected caliculation method is started- f0r port1",
                   $time);
begin
  
exp_tag1 = driv_tr.req1_tag_in ;
case(driv_tr.req1_cmd_in)
4'd0 : begin
         exp_res1 = 2'b00;
       end
4'd1 : begin
         exp_data1 = driv_tr.req1_data_in1 + driv_tr.req1_data_in2;
         if (exp_data1 > 32'hFFFFFFFF) 
           exp_res1 = 2'b10;
         else exp_res1= 1'b1;
        end
4'd2 : begin
         exp_data1 = driv_tr.req1_data_in1 - driv_tr.req1_data_in2;
         if (driv_tr.req1_data_in2 > driv_tr.req1_data_in1) 
          exp_res1 = 2'b10;
         else exp_res1= 1'b1;
        end
4'd5 : begin
         exp_data1 = driv_tr.req1_data_in1 << driv_tr.req1_data_in2[27:31];
         if (driv_tr.req1_data_in2 > driv_tr.req1_data_in1) 
          exp_res1 = 2'b10;
         else exp_res1= 1'b1;
        end
4'd6 : begin
         exp_data1 = driv_tr.req1_data_in1 >> driv_tr.req1_data_in2[27:31];
         if (exp_data1 > 32'hFFFFFFFF) 
         exp_res1 = 2'b10;
         else exp_res1= 1'b1;
        end
           
endcase


 $display("@%0d: calculated expected data1 = %d and expected response1 = %d and expected tag1=%d - for port1",
                   $time,exp_data1,exp_res1,exp_tag1);
end
endtask

task scb_in2();

 $display("@%0d: Expected caliculation method is started- f0r port2",$time);
begin
  exp_tag2 = driv_tr.req2_tag_in ;
case(driv_tr.req2_cmd_in)
4'd0 : begin
         exp_res2 = 2'b00;
       end
4'd1 : begin
         exp_data2 = driv_tr.req2_data_in1 + driv_tr.req2_data_in2;
         if (exp_data2 > 32'hFFFFFFFF)
          exp_res2 = 2'b10;
         else exp_res2 = 1'b1;
        end
4'd2 : begin
         exp_data2 = driv_tr.req2_data_in1 - driv_tr.req2_data_in2;
         if (driv_tr.req2_data_in2> driv_tr.req2_data_in1)
          exp_res2 = 2'b10;
         else exp_res2 = 1'b1;
        end
4'd5 : begin
         if (driv_tr.req2_data_in2> driv_tr.req2_data_in1)
          exp_res2 = 2'b10;
         else exp_res2 = 1'b1;
        end
4'd6 : begin
         exp_data2 = driv_tr.req2_data_in1 >> driv_tr.req2_data_in2[27:31];
         if (exp_data2 > 32'hFFFFFFFF)
          exp_res2 = 2'b10;
         else exp_res2 = 1'b1;
        end
endcase
 
 $display("@%0d: calculated expected data2 = %d and expected response2 = %d and expected tag2=%d - for port2",
                   $time,exp_data2,exp_res2,exp_tag2);
end
endtask

task scb_in3();

 $display("@%0d: Expected caliculation method is started- f0r port3",
                   $time);
begin
exp_tag3 = driv_tr.req3_tag_in ;
case(driv_tr.req3_cmd_in)
4'd0 : begin
         exp_res3 = 2'b00;
       end
4'd1 : begin
         exp_data3 = driv_tr.req3_data_in1 + driv_tr.req3_data_in2;
         if (exp_data3 > 32'hFFFFFFFF)
         exp_res3 = 2'b10;
         else exp_res3 = 1'b1;
        end
4'd2 : begin
         exp_data3 = driv_tr.req3_data_in1 - driv_tr.req3_data_in2;
         if (driv_tr.req3_data_in2 > driv_tr.req3_data_in1)
         exp_res3 = 2'b10;
         else exp_res3 = 1'b1;
        end
4'd5 : begin
         exp_data3 = driv_tr.req3_data_in1 << driv_tr.req3_data_in2[27:31];
         if (driv_tr.req3_data_in2 > driv_tr.req3_data_in1)
         exp_res3 = 2'b10;
         else exp_res3 = 1'b1;
        end
4'd6 : begin
         exp_data3 = driv_tr.req3_data_in1 >> driv_tr.req3_data_in2[27:31];
         if (exp_data3 > 32'hFFFFFFFF)
         exp_res3 = 2'b10;
         else exp_res3 = 1'b1;
        end
endcase



 $display("@%0d: calculated expected data3 = %d and expected response3 = %d and expected tag3=%d - for port3",
                   $time,exp_data3,exp_res3,exp_tag3);
end
endtask


task scb_in4();

 $display("@%0d: Expected caliculation method is started- f0r port4",
                   $time);

begin
exp_tag4 = driv_tr.req4_tag_in ;
case(driv_tr.req4_cmd_in)
4'd0 : begin
         exp_res4 = 2'b00;
       end
4'd1 : begin
         exp_data4 = driv_tr.req4_data_in1 + driv_tr.req4_data_in2;
         if (exp_data4 > 32'hFFFFFFFF)
         exp_res4 = 2'b10;
         else exp_res4=  1'b1;
        end
4'd2 : begin
         exp_data4 = driv_tr.req4_data_in1 - driv_tr.req4_data_in2;
         if (driv_tr.req4_data_in2 > driv_tr.req4_data_in1)
         exp_res4 = 2'b10;
         else exp_res4=  1'b1;
        end
4'd5 : begin
         exp_data4 = driv_tr.req4_data_in1 << driv_tr.req4_data_in2[27:31];
         if (driv_tr.req4_data_in2 > driv_tr.req4_data_in1)
         exp_res4 = 2'b10;
         else exp_res4=  1'b1;
        end
4'd6 : begin
         exp_data4 = driv_tr.req4_data_in1 >> driv_tr.req4_data_in2[27:31];
         if (exp_data4 > 32'hFFFFFFFF)
         exp_res4 = 2'b10;
         else exp_res4=  1'b1;
        end
endcase


 
 $display("@%0d: calculated expected data4 = %d and expected response4 = %d and expected tag4=%d - f0r port4",
                   $time,exp_data4,exp_res4,exp_tag4);
                   $display("");
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
join

fork
sub_check1();
sub_check2();
sub_check3();
sub_check4();
join
count++;
$display("");
$display("scoreboard method completed");
$display(" Total errors found = %0p",error_count);
$display("");
-> sconext;
end
endtask


task sub_check1();
begin
if (exp_tag1 == mon_tr.out_tag1)
  begin
  if ((exp_data1[1:32] == mon_tr.out_data1) && (exp_res1 == mon_tr.out_resp1))
      $display("@%0d: Data match---port 1- expected_data1=%H monitor_Data1=%H ; expected_res1 = %d monitor_res1 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data1[1:32], mon_tr.out_data1, exp_res1, mon_tr.out_resp1,exp_tag1, mon_tr.out_tag1);
  else begin
  $display("@%0d: *** ERROR *** expected_data1=%H monitor_Data1=%H ; expected_res1 = %d monitor_res1 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data1[1:32], mon_tr.out_data1, exp_res1, mon_tr.out_resp1,exp_tag1, mon_tr.out_tag1);
  error_count++;
  end
  end
else
   begin
     $display("@%0d: Tag didn't match for port 1---sending data into queue ", $time);
     qa1.push_front(mon_tr.out_tag1);
     qb1.push_front(exp_tag1);
     qc1.push_front(mon_tr.out_data1);
     qd1.push_front(exp_data1[1:32]);
     qe1.push_front(mon_tr.out_resp1);
     qf1.push_front(exp_res1);
   end
     if (qb1.size() == 1)begin
       if(k1 == 1)begin
         $display("*********TAG ERROR in first command of port 1***********");
         error_count++;
         k1--;
                qb1.pop_front(); 
                qd1.pop_front();
                qf1.pop_front();
                qa1.pop_front(); 
                qc1.pop_front();
                qe1.pop_front();
       end
     else k1++;
     end
      if ((qb1.size() > 1) && (qb1.size() < 3) )
      begin
        for (int i = 0; i < qb1.size(); i = i + 1) 
        begin
          if (qb1[i] == mon_tr.out_tag1) 
          begin
              if ((qc1[0] == qd1[i]) && (qe1[0] == qf1[i]))begin
                $display("@%0d: Data match--port 1-- expected_data1=%H monitor_Data1=%H ; expected_res1 = %d monitor_res1 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data1[1:32], mon_tr.out_data1, exp_res1, mon_tr.out_resp1,exp_tag1, mon_tr.out_tag1);
                qb1.pop_front(); 
                qd1.pop_front();
                qf1.pop_front();
                qa1.pop_front(); 
                qc1.pop_front();
                qe1.pop_front();
                break; 
              end
              else  begin
              $display("@%0d: *** ERROR *** expected_data1=%H monitor_Data1=%H ; expected_res1 = %d monitor_res1 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data1[1:32], mon_tr.out_data1, exp_res1, mon_tr.out_resp1,exp_tag1, mon_tr.out_tag1);
              error_count++;
            end
        end 
        qb1.shuffle(); // Move the first element to the back of the queue
        qd1.shuffle();
        qf1.shuffle();
   
  end
end
    if (qb1.size() > 2)begin
      $display("*********TAG ERROR in QUEUE***********");
      error_count++;
      repeat(3)begin
                qb1.pop_front(); 
                qd1.pop_front();
                qf1.pop_front();
                qa1.pop_front();
                qc1.pop_front();
                qe1.pop_front(); 
              end
          end

end
endtask

task sub_check2();
  begin

if (exp_tag2 == mon_tr.out_tag2)
  begin
  if ((exp_data2[1:32] == mon_tr.out_data2) && (exp_res2 == mon_tr.out_resp2))
      $display("@%0d: Data match---- expected_data2=%H monitor_Data2=%H ; expected_res2 = %d monitor_res2 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data2[1:32], mon_tr.out_data2, exp_res2, mon_tr.out_resp2,exp_tag2, mon_tr.out_tag2);
  else  begin
  $display("@%0d: *** ERROR *** expected_data2=%H monitor_Data2=%H ; expected_res2 = %d monitor_res2 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data2[1:32], mon_tr.out_data2, exp_res2, mon_tr.out_resp2,exp_tag2, mon_tr.out_tag2);
  error_count++;
  end
  end
else
  begin
     $display("@%0d: Tag didn't match---sending data into queue ", $time);
     qa2.push_front(mon_tr.out_tag2);
     qb2.push_front(exp_tag2);
     qc2.push_front(mon_tr.out_data2);
     qd2.push_front(exp_data2[1:32]);
     qe2.push_front(mon_tr.out_resp2);
     qf2.push_front(exp_res2);
   end
     if (qb2.size() == 1)begin
       int k2=0;
       if(k2 == 1)begin
         $display("*********TAG ERROR in first command of port 2***********");
         error_count++;
         k2--;
                  qb2.pop_front(); 
                  qd2.pop_front();
                  qf2.pop_front();
                  qa2.pop_front(); 
                  qc2.pop_front();
                  qe2.pop_front();
       end
      else k2++;
     end
      if ((qb2.size() > 1) && (qb2.size() < 3) )
      begin
        for (int i = 0; i < qb2.size(); i = i + 1) 
        begin
          if (qb2[i] == mon_tr.out_tag2) 
            begin
              if ((qc2[0] == qd2[i]) && (qe2[0] == qf2[i])) begin
                $display("@%0d: Data match---- expected_data2=%H monitor_Data2=%H ; expected_res2 = %d monitor_res2 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data2[1:32], mon_tr.out_data2, exp_res2, mon_tr.out_resp2,exp_tag2, mon_tr.out_tag2);
                  qb2.pop_front(); 
                  qd2.pop_front();
                  qf2.pop_front();
                  qa2.pop_front(); 
                  qc2.pop_front();
                  qe2.pop_front();
                  break; 
                  end
              else  begin
              $display("@%0d: *** ERROR *** expected_data2=%H monitor_Data2=%H ; expected_res2 = %d monitor_res2 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data2[1:32], mon_tr.out_data2, exp_res2, mon_tr.out_resp2,exp_tag2, mon_tr.out_tag2);
              error_count++;
              end
            end
        qb2.shuffle(); // Move the first element to the back of the queue
        qd2.shuffle();
        qf2.shuffle();
    
    end
  end
    if (qb2.size() > 2)begin
      $display("*********TAG ERROR IN QUEUE***********");
      error_count++;
      repeat(3)begin
                  qb2.pop_front(); 
                  qd2.pop_front();
                  qf2.pop_front();
                  qa2.pop_front(); 
                  qc2.pop_front();
                  qe2.pop_front();
                end
            end
 
  end
endtask

task sub_check3();
  begin

if (exp_tag3 == mon_tr.out_tag3)
  begin
  if ((exp_data3[1:32] == mon_tr.out_data3) && (exp_res3 == mon_tr.out_resp3))
      $display("@%0d: Data match---- expected_data3=%H monitor_Data3=%H ; expected_res3 = %d monitor_res3 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data3[1:32], mon_tr.out_data3, exp_res3, mon_tr.out_resp3,exp_tag3, mon_tr.out_tag3);
  else  begin
  $display("@%0d: *** ERROR *** expected_data3=%H monitor_Data3=%H ; expected_res3 = %d monitor_res3 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data3[1:32], mon_tr.out_data3, exp_res3, mon_tr.out_resp3,exp_tag3, mon_tr.out_tag3);
  error_count++;
  end
  end
else
  begin
     $display("@%0d: Tag didn't match---sending data into queue ", $time);
     qa3.push_front(mon_tr.out_tag3);
     qb3.push_front(exp_tag3);
     qc3.push_front(mon_tr.out_data3);
     qd3.push_front(exp_data3[1:32]);
     qe3.push_front(mon_tr.out_resp3);
     qf3.push_front(exp_res3);
   end
     if (qb3.size() == 1)begin
       int k3=0;
       if(k3 == 1)begin
         $display("*********TAG ERROR in first command of port 3***********");
         error_count++;
         k3--;
                 qb3.pop_front(); 
                 qd3.pop_front();
                 qf3.pop_front();
                 qa3.pop_front(); 
                 qc3.pop_front();
                 qe3.pop_front();
       end
      else k3++;
     end
      if ((qb3.size() > 1) && (qb3.size() < 3) )
      begin
        for (int i = 0; i < qb3.size(); i = i + 1) 
        begin
          if (qb3[i] == mon_tr.out_tag3) 
            begin
              if ((qc3[0] == qd3[i]) && (qe3[0] == qf3[i]))begin
                $display("@%0d: Data match---- expected_data3=%H monitor_Data3=%H ; expected_res3 = %d monitor_res3 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data3[1:32], mon_tr.out_data3, exp_res3, mon_tr.out_resp3,exp_tag3, mon_tr.out_tag3);
                 qb3.pop_front(); 
                 qd3.pop_front();
                 qf3.pop_front();
                 qa3.pop_front(); 
                 qc3.pop_front();
                 qe3.pop_front();
                 break; 
               end
              else  begin
              $display("@%0d: *** ERROR *** expected_data3=%H monitor_Data3=%H ; expected_res3 = %d monitor_res3 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data3[1:32], mon_tr.out_data3, exp_res3, mon_tr.out_resp3,exp_tag3, mon_tr.out_tag3);
              error_count++;
            end
            end
        qb3.shuffle(); // Move the first element to the back of the queue
        qd3.shuffle();
        qf3.shuffle();
    
    end
  end
    if (qb3.size() > 2)begin
      $display("*********TAG ERROR IN QUEUE***********");
    error_count++;
      repeat(3)begin
                 qb3.pop_front(); 
                 qd3.pop_front();
                 qf3.pop_front();
                 qa3.pop_front(); 
                 qc3.pop_front();
                 qe3.pop_front();
                end
            end

end
endtask

task sub_check4();
  begin

if (exp_tag4 == mon_tr.out_tag4)
  begin
  if ((exp_data4[1:32] == mon_tr.out_data4) && (exp_res4 == mon_tr.out_resp4))
      $display("@%0d: Data match---- expected_data4=%H monitor_Data4=%H ; expected_res4 = %d monitor_res4 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data4[1:32], mon_tr.out_data4, exp_res4, mon_tr.out_resp4,exp_tag4, mon_tr.out_tag4);
  else  begin
  $display("@%0d: *** ERROR *** expected_data4=%H monitor_Data4=%H ; expected_res4 = %d monitor_res4 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data4[1:32], mon_tr.out_data4, exp_res4, mon_tr.out_resp4,exp_tag4, mon_tr.out_tag4);
  end
  end
else
  begin
     $display("@%0d: Tag didn't match---sending data into queue ", $time);
     qa4.push_front(mon_tr.out_tag4);
     qb4.push_front(exp_tag4);
     qc4.push_front(mon_tr.out_data4);
     qd4.push_front(exp_data4[1:32]);
     qe4.push_front(mon_tr.out_resp4);
     qf4.push_front(exp_res4);
   end
 if (qb3.size() == 1)begin
      int k4=0;
       if(k4 == 1)begin
         $display("*********TAG ERROR in first command of port 4***********");
         error_count++;
         k4--;
                qb4.pop_front(); 
                qd4.pop_front();
                qf4.pop_front();
                qa4.pop_front(); 
                qc4.pop_front();
                qe4.pop_front();
       end
     else k4++;
  end
  if ((qb4.size() > 1) && (qb4.size() < 3) )
      begin
        for (int i = 0; i < qb4.size(); i = i + 1) 
        begin
          if (qb4[i] == mon_tr.out_tag4) 
            begin
              if ((qc4[0] == qd4[i]) && (qe4[0] == qf4[i])) begin
                $display("@%0d: Data match---- expected_data4=%H monitor_Data4=%H ; expected_res4 = %d monitor_res4 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data4[1:32], mon_tr.out_data4, exp_res4, mon_tr.out_resp4,exp_tag4, mon_tr.out_tag4);
                qb4.pop_front(); 
                qd4.pop_front();
                qf4.pop_front();
                qa4.pop_front(); 
                qc4.pop_front();
                qe4.pop_front();
                break; 
               end
              else  begin
              $display("@%0d: *** ERROR *** expected_data4=%H monitor_Data4=%H ; expected_res4 = %d monitor_res4 = %d; expected tag =%d and monitor tag = %d;", $time, exp_data4[1:32], mon_tr.out_data4, exp_res4, mon_tr.out_resp4,exp_tag4, mon_tr.out_tag4);
              error_count++;
              end
            end
        qb4.shuffle(); // Move the first element to the back of the queue
        qd4.shuffle();
        qf4.shuffle();
        
      end
    end
    if (qb4.size() > 3)begin
      $display("*********TAG ERROR IN QUEUE***********");
    error_count++;
      repeat(3)begin
                qb4.pop_front(); 
                qd4.pop_front();
                qf4.pop_front();
                qa4.pop_front(); 
                qc4.pop_front();
                qe4.pop_front();
                end
            end

  end
endtask

endclass



















