class prio_enco_monitor;
  
  virtual prio_enco_intf vif;
  prio_enco_transaction tr;
  mailbox mon2scb;
  
  function new(mailbox mon2scb, virtual prio_enco_intf vif);
    this.mon2scb=mon2scb;
    this.vif=vif;
  endfunction
  
  
  task main();
    repeat(10)
      begin
        tr=new();
        #3;
        tr.i=vif.i;
        tr.d=vif.d;
        mon2scb.put(tr);
        tr.display("MON");
      end
  endtask
endclass
        