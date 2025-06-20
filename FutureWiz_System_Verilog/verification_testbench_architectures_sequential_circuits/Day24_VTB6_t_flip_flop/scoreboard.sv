class scoreboard;
  transaction tr, trref;
  mailbox #(transaction) mbx, mbxref;
  event sconext;
  bit last_q = 0;

  function new(mailbox #(transaction) mbx, mailbox #(transaction) mbxref);
    this.mbx = mbx;
    this.mbxref = mbxref;
  endfunction

  task run();
    forever begin
      mbx.get(tr);
      mbxref.get(trref);

      if (trref.t)
        last_q = ~trref.q;
      else 
        last_q=trref.q;

      if (tr.q == last_q)
        $display("[SCO] : PASS");
      else
        $display("[SCO] : FAIL");

      ->sconext;
    end
  endtask
endclass