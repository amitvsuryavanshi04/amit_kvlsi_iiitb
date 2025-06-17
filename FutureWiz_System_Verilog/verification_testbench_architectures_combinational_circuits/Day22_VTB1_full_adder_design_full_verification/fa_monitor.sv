
//monitor code

class monitor;
  //handles declaration 
  transaction tr;
  mailbox mon2scb;
  virtual fa_intf vif;
  //customized constructor
  function new(mailbox mon2scb,virtual fa_intf vif);
    this.mon2scb = mon2scb;
    this.vif = vif;
  endfunction
  
  //main task implementation
  task main();
    repeat(10) begin
      #2;
      tr = new();
      tr.a = vif.a;
      tr.b = vif.b;
      tr.cin = vif.cin;
      tr.s = vif.s;
      tr.cout = vif.cout;
      mon2scb.put(tr);
      tr.display("MONITOR");
    end
  endtask
endclass