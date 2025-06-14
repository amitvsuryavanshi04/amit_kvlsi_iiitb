//encapsulation ..... without local keyword 
class parent;
  int x;
  function void displayp();
    $display("Hi I am in parent class.");
    $display("Value of parent class properties , using parent display x = %0d",x);
  endfunction
endclass

//child class
class child extends parent;
  int y;
  function void displayc(); 
    $display("Hi I am in child class.");
    $display("Value of child class properties  , using child display x = %0d and y = %0d",super.x,y);
  endfunction
endclass

//testcase
module test;
  parent p;
  child c;
  initial begin
    p = new();
    c = new();
    p.x = 100;
    c.x = 20;
    c.y = 30;
    p.displayp();
    c.displayp();
    c.displayc();
  end
endmodule

