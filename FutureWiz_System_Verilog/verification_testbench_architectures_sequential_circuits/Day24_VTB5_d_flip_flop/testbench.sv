// Code your testbench here
// or browse Examples
`include "dff_transaction.sv"
`include "dff_generator.sv"
`include "dff_monitor.sv"
`include "dff_driver.sv"
`include "dff_scoreboard.sv"
`include "dff_environment.sv"
module tb;
  dff_intf vif();
  
  dff_dut dut(vif);
  
  initial begin
    
    vif.clk = 1'b0;
  end
  
  always #10 vif.clk <= ~vif.clk;
  
  dff_environment env;
  
  initial begin
    env = new(vif);
    env.gen.count = 20;
    env.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule
