`include "prio_enco_transaction.sv"
`include "prio_enco_generator.sv"
`include "prio_enco_driver.sv"
`include "prio_enco_monitor.sv"
`include "prio_enco_scoreboard.sv"

class prio_enco_environment;
  
prio_enco_generator pgen;
prio_enco_driver pdrv;
prio_enco_monitor pmon;
prio_enco_scoreboard pscb;
  
mailbox gen2drv;
mailbox mon2scb;
  
virtual prio_enco_intf vif;
  
  function new(virtual prio_enco_intf vif);
    this.vif=vif;
    
    gen2drv=new();
    mon2scb=new();
    
    pgen=new(gen2drv);
    pdrv=new(gen2drv,vif);
    pmon=new(mon2scb,vif);
    pscb=new(mon2scb);
  endfunction
  
  task run();
    fork 
      pgen.main();
      pdrv.main();
      pmon.main();
      pscb.main();
    join_any
  endtask
endclass