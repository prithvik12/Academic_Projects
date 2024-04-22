
program automatic calc3_test(calc3_if calc);

`include "environment.sv"


// Top level environment
environment the_env;
//calc2_if calc;

initial begin
  // Instanciate the top level
  the_env = new(calc);
  the_env.gen.iteration=20;
  // Kick off the test now
  the_env.run();

  $finish;
end 

endprogram