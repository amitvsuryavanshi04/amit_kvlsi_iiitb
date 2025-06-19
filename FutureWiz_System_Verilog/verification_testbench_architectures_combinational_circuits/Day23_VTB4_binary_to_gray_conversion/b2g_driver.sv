//driver for binary to gray 
class b2g_driver;
  b2g_transaction b2g_tr;
  mailbox gen2drv;
  virtual b2g_intf vif;
  
  //function customized constructor
  function new(mailbox gen2drv,virtual b2g_intf vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction
  
  //main task implementation
  task main();
    forever begin
      gen2drv.get(b2g_tr);
      vif.bit_in <= b2g_tr.bit_in;
      #2;
      b2g_tr.display("DRV_B2G");
    end
  endtask
endclass
