//driver code one of the most important component
class driver;
  transaction tr;
  mailbox gen2drive;
  virtual fa_intf vif;
  //customized constructor
  function new(mailbox gen2drive, virtual fa_intf vif);
    this.gen2drive = gen2drive;
    this.vif = vif;
  endfunction
  //main task
	task main();
	  repeat(10) begin
    	gen2drive.get(tr);
    	//driver logic
    	vif.a <= tr.a;
    	vif.b <= tr.b;
    	vif.cin <= tr.cin;
    
    	tr.display("DRV");
    	#2;
  		end
	endtask
endclass