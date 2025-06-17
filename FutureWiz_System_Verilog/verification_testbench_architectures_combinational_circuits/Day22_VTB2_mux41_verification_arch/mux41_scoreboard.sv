
class scoreboard;
  transaction tr;
  mailbox mon2scb;

  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task main();
    repeat (10) begin
      mon2scb.get(tr);
      if (tr.y == ((tr.s[1]) ? ((tr.s[0]) ? tr.i[3] : tr.i[2]) : (tr.s[0]) ? tr.i[1] : tr.i[0]))
        $display("TEST PASSED");
      else
        $error("TEST FAILED: Expected %b, Got %b", ((tr.s[1]) ? ((tr.s[0]) ? tr.i[3] : tr.i[2]) : (tr.s[0]) ? tr.i[1] : tr.i[0]), tr.y);
      tr.display("SCB");
    end
  endtask
endclass
