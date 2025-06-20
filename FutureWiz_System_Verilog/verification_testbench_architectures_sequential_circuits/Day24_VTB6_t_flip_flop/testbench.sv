// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "monitor.sv"
`include "driver.sv"
`include "scoreboard.sv"
`include "environment.sv"
module tb;
  tff_if vif();
  tff dut(vif);
  environment env;

  initial vif.clk = 0;
  always #5 vif.clk = ~vif.clk;

  initial begin
    env = new(vif);
    env.gen.count = 10;
    env.run();
  end

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule