
`include "mux41_environment.sv"
// Test
module test(mux_if mif);
  env e;
initial begin
  e = new(mif);
  e.run();
end
  
endmodule