class prio_enco_scoreboard;
  
  prio_enco_transaction tr;
  mailbox mon2scb;
  
  function new(mailbox mon2scb);
    this.mon2scb=mon2scb;
  endfunction
  
  task main();
    repeat(10)
      begin
        bit [1:0] ref_d;
        mon2scb.get(tr);
        ref_d = (tr.i[3])?2'b11:(tr.i[2])?2'b10:(tr.i[1])?2'b01:(tr.i[0])?2'b00:2'b00;
        if(ref_d==tr.d)
          $display("TEST PASS");
		else 
          $error("TEST FAILED");
        tr.display("SCB");
        
      end
  endtask
endclass