
//generator code
class generator;
  rand transaction tr; //only this handle has to be randomized otherwise the a,b,cin will not get randomize
  mailbox gen2drive;
  //customized constructor
  function new(mailbox gen2drive);
    this.gen2drive = gen2drive;
  endfunction
  
  //implementation of the main task
  task main();
    repeat(10) begin
      tr = new();
      assert (tr.randomize());
      //after randomize packets are saved in mailbox
      gen2drive.put(tr);
      //creation of the transaction 
      //display the transaction 
      tr.display("GEN");
    end
  endtask
endclass