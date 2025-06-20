class dff_monitor;
  
  dff_transaction tr;
  mailbox #(dff_transaction) mbx;
  virtual dff_intf vif;
  
 
  
  function new( mailbox #(dff_transaction) mbx);
   this.mbx = mbx;
  endfunction
  
  task run();
    tr = new();
    forever begin
       @(posedge vif.clk);
       @(posedge vif.clk);
       tr.dout = vif.dout;
       mbx.put(tr);
      tr.display("MON");
    end
  endtask
  
endclass