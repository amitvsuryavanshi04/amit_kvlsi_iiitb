class prio_enco_driver;
  
virtual prio_enco_intf vif;
prio_enco_transaction tr;
mailbox gen2drv;
  
  function new(mailbox gen2drv, virtual prio_enco_intf vif);
    this.gen2drv=gen2drv;
    this.vif=vif;
  endfunction

  task main();
    repeat(10)
      begin
        gen2drv.get(tr);
        vif.i<=tr.i;
        #3;
        tr.display("DRV");
      end
  endtask
endclass