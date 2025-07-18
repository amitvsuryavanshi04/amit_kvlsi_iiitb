class dff_driver;
  
  dff_transaction tr;
  mailbox #(dff_transaction) mbx;
  virtual dff_intf vif;
  
 
  
  
  
  function new( mailbox #(dff_transaction) mbx);
   this.mbx = mbx;
  endfunction
  
  task reset();
    vif.rst <= 1'b1;
    repeat(5) @(posedge vif.clk);
    vif.rst <= 1'b0;
    @(posedge vif.clk);
    $display("[DRV] : RESET DONE");
  endtask
  
  
  task run();
    forever begin
      mbx.get(tr);
      vif.din <= tr.din;
      tr.display("DRV");
      @(posedge vif.clk);
    end
    endtask
  
endclass