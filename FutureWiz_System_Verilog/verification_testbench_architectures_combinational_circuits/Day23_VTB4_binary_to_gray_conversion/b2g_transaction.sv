//transaction
class b2g_transaction;
  randc bit [3:0]bit_in;
  bit [3:0]gray_out;
  
  //display function
  function void display(string name);
    $display("[%s]: binary_in: %b,  gray_out = %b",name,bit_in,gray_out);
  endfunction
endclass