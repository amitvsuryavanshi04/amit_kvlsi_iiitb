// code to demostrate the inheritance 
class parent;
  function new();
    $display("Parent.");
  endfunction
endclass

//child class
class child extends parent;
  function new();
    $display("Child class.");
  endfunction
endclass

//testcase
module test;
  child c;
  initial begin 
    c = new();
  end
endmodule 
