class dff_generator;
  
  dff_transaction tr;
  mailbox #(dff_transaction) mbx;
  mailbox #(dff_transaction) mbxref;
  event sconext;
  event done;
  int count;
  
  
  function new( mailbox #(dff_transaction) mbx,  mailbox #(dff_transaction) mbxref);
   this.mbx = mbx;
   this.mbxref = mbxref; 
    tr = new(); 
  endfunction
  
  
  task run();
    repeat(count) begin
      for(int i = 0; i<10; i++) begin
        assert(tr.randomize) else $error("[GEN] : RANDOMIZATION FAILED");
        mbx.put(tr.copy);
        mbxref.put(tr.copy);
        tr.display("GEN");
        @(sconext);
      end
    end
    ->done;
  endtask
  
  
endclass