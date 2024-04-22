
program automatic calc2_test(calc2_if calc);

`include "calc2_environment.sv"
//`include "calc2_environment.sv"


// Top level environment
calc2_env the_env;


initial begin
  // Instanciate the top level
  the_env = new(calc);
 the_env.gen.iteration =20;
  // Kick off the test now
  the_env.run();
  
  $finish;
end 

endprogram
