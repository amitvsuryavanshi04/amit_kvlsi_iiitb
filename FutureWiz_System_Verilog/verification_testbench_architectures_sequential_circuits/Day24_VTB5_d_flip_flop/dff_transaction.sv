class dff_transaction;
  
  // 2 state variable since din/dout will be either 1 or 0 not 4 state logic
  rand bit din;
  bit dout; // no randomization for output
  
  function void display(input string tag);
    $display("[%0s] : din : %0b : dout : %0b",tag,din,dout);
  endfunction
  
  function dff_transaction copy();// deep copy for transaction
    copy = new();
    copy.din = this.din;
    copy.dout = this.dout;
  endfunction
  
endclass