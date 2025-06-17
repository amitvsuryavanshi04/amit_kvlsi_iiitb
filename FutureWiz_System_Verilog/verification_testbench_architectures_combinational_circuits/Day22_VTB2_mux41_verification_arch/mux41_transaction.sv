// Transaction
class transaction;
  randc bit [3:0] i;
  randc bit [1:0] s;
  bit y;

  function display(string tag);
    $display("[%s] i = %b, s = %b, y = %b", tag, i, s, y);
  endfunction
endclass
