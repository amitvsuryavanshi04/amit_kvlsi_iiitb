`include "mux41_transaction.sv"
// Generator
class generator;
  transaction tr;
  mailbox gen2drv;

  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction

  task main();
    repeat (10) begin
      tr = new();
      assert(tr.randomize());
      gen2drv.put(tr);
      tr.display("GEN");
    end
  endtask
endclass
