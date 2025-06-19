`include "b2g_interface.sv"
`include "b2g_generator.sv"
`include "b2g_driver.sv"
`include "b2g_monitor.sv"
`include "b2g_scoreboard.sv"

class b2g_environment;
  b2g_generator b2g_gen;
  b2g_driver b2g_drv;
  b2g_monitor b2g_mon;
  b2g_scoreboard b2g_scb;
  
  //mailbox declaration
  mailbox gen2drv;
  mailbox mon2scb;
  
  //interface declaration
  virtual b2g_intf vif;
  
  //customized constructor
  function new(virtual b2g_intf vif);
    this.vif = vif;
    gen2drv = new();
    mon2scb = new();
    b2g_gen = new(gen2drv);
    b2g_drv = new(gen2drv,vif);
    b2g_mon = new(mon2scb,vif);
    b2g_scb = new(mon2scb);
  endfunction
  
  //run task implementation
  task run();
    fork 
      b2g_gen.main();
      b2g_drv.main();
      b2g_mon.main();
      b2g_scb.main();
    join
  endtask
endclass
