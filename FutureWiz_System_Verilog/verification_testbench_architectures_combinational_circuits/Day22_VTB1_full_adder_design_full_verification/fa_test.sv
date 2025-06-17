`include "fa_environment.sv"
// Test
class test;
  env e;

  function new(virtual fa_intf vif);
    e = new(vif);
  endfunction

  task run();
    e.run();
  endtask
endclass