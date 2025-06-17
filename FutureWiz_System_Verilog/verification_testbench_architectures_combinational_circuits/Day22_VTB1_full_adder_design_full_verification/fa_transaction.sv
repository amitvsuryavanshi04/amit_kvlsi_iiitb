//transaction 
class transaction ;
  rand bit a,b,cin;
  bit s,cout;
  function void display(string name);
    $display("$[%s]: a = %b, b=%b,cin=%b,cout=%b,s=%b",name,a,b,cin,cout,s);
  endfunction
endclass