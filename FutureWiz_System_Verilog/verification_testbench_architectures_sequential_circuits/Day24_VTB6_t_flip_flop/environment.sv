class environment;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard sco;

  mailbox #(transaction) gdmbx, msmbx, mbxref;
  event next;
  virtual tff_if vif;

  function new(virtual tff_if vif);
    gdmbx = new();
    msmbx = new();
    mbxref = new();

    gen = new(gdmbx, mbxref);
    drv = new(gdmbx);
    mon = new(msmbx);
    sco = new(msmbx, mbxref);

    this.vif = vif;
    drv.vif = vif;
    mon.vif = vif;
    gen.sconext = next;
    sco.sconext = next;
  endfunction

  task pre_test();
    drv.reset();
  endtask

  task test();
    fork
      gen.run();
      drv.run();
      mon.run();
      sco.run();
    join_any
  endtask

  task post_test();
    wait(gen.done.triggered);
    $finish();
  endtask

  task run();
    pre_test();
    test();
    post_test();
  endtask
endclass