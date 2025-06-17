// Monitor
class monitor;
  transaction tr;
  mailbox mon2scb;
  virtual mux_if vif;

  function new(mailbox mon2scb, virtual mux_if vif);
    this.mon2scb = mon2scb;
    this.vif = vif;
  endfunction

  task main();
    repeat (10) begin
      #2;
      tr = new();
      tr.i = vif.i;
      tr.s = vif.s;
      tr.y = vif.y;
      mon2scb.put(tr);
      tr.display("MONITOR");
    end
  endtask
endclass