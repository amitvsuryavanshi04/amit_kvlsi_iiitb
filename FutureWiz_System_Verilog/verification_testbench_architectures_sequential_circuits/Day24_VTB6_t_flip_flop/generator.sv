class generator;
  transaction tr;
  mailbox #(transaction) mbx, mbxref;
  event sconext, done;
  int count;

  function new(mailbox #(transaction) mbx, mailbox #(transaction) mbxref);
    this.mbx = mbx;
    this.mbxref = mbxref;
    tr = new();
  endfunction

  task run();
    repeat(count) begin
      assert(tr.randomize());
      mbx.put(tr.copy());
      mbxref.put(tr.copy());
      tr.display("GEN");
      @(sconext);
    end
    ->done;
  endtask
endclass