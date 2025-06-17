`include "mux41_interface.sv"
`include "mux41_generator.sv"
`include "mux41_driver.sv"
`include "mux41_monitor.sv"
`include "mux41_scoreboard.sv"

// Environment
class env;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;

  mailbox gen2drv;
  mailbox mon2scb;

  virtual mux_if vif;

  function new(virtual mux_if vif);
    this.vif = vif;
    gen2drv = new();
    mon2scb = new();
    gen = new(gen2drv);
    drv = new(gen2drv, vif);
    mon = new(mon2scb, vif);
    scb = new(mon2scb);
  endfunction

  task run();
    fork
      gen.main();
      drv.main();
      mon.main();
      scb.main();
    join
  endtask
endclass