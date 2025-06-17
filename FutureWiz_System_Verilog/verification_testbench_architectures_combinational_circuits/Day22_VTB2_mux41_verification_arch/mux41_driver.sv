// Driver
class driver;
  transaction tr;
  mailbox gen2drv;
  virtual mux_if vif;

  function new(mailbox gen2drv, virtual mux_if vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction

  task main();
    repeat (10) begin
      gen2drv.get(tr);
      vif.i <= tr.i;
      vif.s <= tr.s;
      
      #2;
      tr.display("DRV");
    end
  endtask
endclass