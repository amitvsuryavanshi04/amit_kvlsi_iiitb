
`include "b2g_environment.sv"

module b2g_test(b2g_intf b2g_if);
  b2g_environment b2g_env;
  initial begin
    b2g_env = new( b2g_if);
    b2g_env.run();
  end
endmodule