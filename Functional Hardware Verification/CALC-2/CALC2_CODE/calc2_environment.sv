//   `include "/nfs/home/p/p_vindra/CALC_2_Modified/CALC_2_Modified/calc2_scoreboard.sv"
   //`include "/nfs/home/p/p_vindra/CALC_2_Modified/CALC_2_Modified/calc2_coverage.sv"
   //`include "calc2_scoreboard.sv";

  `include "calc2_scoreboard.sv";
  //`include "calc2_coverage.sv";
    

    class calc2_env;
    generator gen;
    driver driv;
    monitor mon;
    scoreboard scb;
   coverage cov;
    event nextgd; //generator to driver
    event nextgs;  // generator to scoreboard
    mailbox #(transaction) gen2driv,mon2scb,driv2scb;
    virtual calc2_if inf1;
    
    // custom constructor
    function new(virtual calc2_if inf1);
    this.inf1 = inf1;
    gen2driv=new();
    mon2scb = new();
    driv2scb = new();
    cov=new();
    gen = new(gen2driv);
    driv = new(gen2driv,driv2scb,inf1);
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
    wait(gen.exit.triggered);
    wait(gen.iteration == driv.no_iterations);
    wait(gen.iteration == scb.count);
    endtask
    
    task run();
    intial_reset();
    gen_stim();
    last();
    
    endtask
    
 
    endclass