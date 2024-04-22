
`include "scoreboard.sv";

class environment;
generator gen;
driver driv;
monitor mon;
scoreboard scb;
event nextgd; //generator to driver
event nextgs;  // generator to scoreboard
mailbox #(transaction) g2d,mon2scb,driv2scb;
virtual calc3_if inf1;
 // custom constructor
 function new(virtual calc3_if inf1);
 this.inf1 = inf1;
g2d=new();
mon2scb = new();
driv2scb = new();
 gen = new(g2d);
 driv = new(g2d,driv2scb,inf1);
mon = new(inf1,mon2scb);
scb = new(mon2scb,driv2scb);

gen.drinext = nextgd;
driv.drinext = nextgd;
gen.sconext = nextgs;
scb.sconext = nextgs;

 endfunction
 
 task intial_reset();
 driv.reset;
 endtask
 
 task gen_stim();
 fork
 gen.major;
 driv.run;
mon.mnt_main;
scb.main;
 join
 endtask
 
 task last();
 wait(gen.done.triggered);
 wait(gen.iteration == driv.no_iterations);
 wait(gen.iteration == scb.count);
 endtask
 
 task run();
 intial_reset();
 gen_stim();
 last();
 endtask

endclass