`include "transaction.sv"
class generator;

transaction tr;
int iteration;

event sconext;
event drinext; /// to know when to send the next transaction.
event done; /// conveys completion of requested no. of transactions.

mailbox #(transaction) g2d;


function new(mailbox #(transaction) g2d);
    this.g2d = g2d;
    tr = new();
endfunction


task major();
   
	repeat(iteration) begin
    assert (tr.randomize()) else $error("Randomization failed");
     g2d.put(tr.copy);
     tr.display("GEN"); 
     @(sconext);
    @(drinext);
end 
->done;  
endtask



endclass




/* module tb;
generator gen;
mailbox #(transaction) g2d;
initial begin
    g2d=new();
    gen=new(g2d);
    gen.a=5;
    gen.run();

end
endmodule */