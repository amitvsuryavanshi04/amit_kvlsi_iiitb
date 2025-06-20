class transaction;
  rand bit t;
  bit q;

  function void display(string tag);
    $display("[%s] : T = %0b | Q = %0b", tag, t, q);
  endfunction

  function transaction copy();
    copy = new();
    copy.t = this.t;
    copy.q = this.q;
  endfunction
endclass