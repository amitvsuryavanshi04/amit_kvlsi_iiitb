//monitor code for binary to gray conversion
class b2g_monitor;
  b2g_transaction b2g_tr;
  mailbox mon2scb;
  virtual b2g_intf vif;
  
  //customized constructor
  function new(mailbox mon2scb,virtual b2g_intf vif);
    this.mon2scb = mon2scb;
    this.vif= vif;
  endfunction
  
  //main task implementation
  task main();
    repeat(10) begin
      #2;
      b2g_tr = new();
      b2g_tr.bit_in = vif.bit_in;
      b2g_tr.gray_out = vif.gray_out;
      mon2scb.put(b2g_tr);
      b2g_tr.display("MON_B2G");
    end
  endtask
endclass
