class monitor;
  transaction tr;
  mailbox #(transaction) mbx;
  virtual tff_if vif;

  function new(mailbox #(transaction) mbx);
    this.mbx = mbx;
  endfunction

  task run();
    tr = new();
    forever begin
      @(posedge vif.clk);
      tr.t=vif.t;
      tr.q = vif.q;
      mbx.put(tr);
      tr.display("MON");
    end
  endtask
endclass