class dff_scoreboard;
  
  dff_transaction tr;
  dff_transaction trref;
  mailbox #(dff_transaction) mbx;
  mailbox #(dff_transaction) mbxref;
  event sconext;
 
 
  function new( mailbox #(dff_transaction) mbx,  mailbox #(dff_transaction) mbxref);
   this.mbx = mbx;
   this.mbxref = mbxref;
  endfunction
  
  task run();
    forever begin
      mbx.get(tr);
      mbxref.get(trref);
      tr.display("SCO");
      trref.display("REF");
      if(tr.dout == trref.din)
        $display("[SCO] : DATA MATCHED");
      else
        $display("[SCO] : DATA MISMATCHED"); 
      ->sconext;
    end
  endtask
  
  
endclass