class dff_environment;
 
    dff_generator gen;
    dff_driver drv;
    dff_monitor mon;
    dff_scoreboard sco; 
  
    
  
    event next;  /// gen -> sco
  
  mailbox #(dff_transaction) gdmbx; ///gen - drv
    
     
  mailbox #(dff_transaction) msmbx;  /// mon - sco
  
  mailbox #(dff_transaction) mbxref; ///// gen -> sco
  
    virtual dff_intf vif;
 
  
  function new(virtual dff_intf vif);
       
    gdmbx = new();
    mbxref = new();
    
    gen = new(gdmbx, mbxref);
    drv = new(gdmbx);
    
    
    msmbx = new();
    mon = new(msmbx);
    sco = new(msmbx, mbxref);
    
    this.vif = vif;
    drv.vif = this.vif;
    mon.vif = this.vif;
    
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