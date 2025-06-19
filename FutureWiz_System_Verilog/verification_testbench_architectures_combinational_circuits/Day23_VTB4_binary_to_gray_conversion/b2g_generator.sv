`include "b2g_transaction.sv"
class b2g_generator;
  b2g_transaction b2g_tr;
  mailbox gen2drv;
  
  
  
  //customized constructor
  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  //main task implementation
  task main();
    repeat (10) begin
      b2g_tr = new();
      assert(b2g_tr.randomize());
      gen2drv.put(b2g_tr);
      b2g_tr.display("GEN_B2G");
    end
  endtask
endclass