//scoreboard implementation 
class scoreboard;
  //declare handles 
  transaction tr;
  mailbox mon2scb;
  //customized constructor
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  //main sb logic
  task main();
    repeat(10) begin 
      mon2scb.get(tr);
      //checker circuit
      if({tr.cout,tr.s} == tr.a+tr.b+tr.cin)
        $display("TEST PASSED !!!");
      else
        $error("TEST FAILED ...");
      tr.display("SCB");
    end
  endtask
endclass