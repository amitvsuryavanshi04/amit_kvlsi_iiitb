`include "fa_transaction.sv"
`include "fa_generator.sv"
`include "fa_driver.sv"
`include "fa_monitor.sv"
`include "fa_scoreboard.sv"

// Environment
class env;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;

  mailbox gen2drv;
  mailbox mon2scb;

  virtual fa_intf vif;

  function new(virtual fa_intf vif);
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