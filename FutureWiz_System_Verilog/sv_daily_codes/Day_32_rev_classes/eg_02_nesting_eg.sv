// Code your testbench here
// or browse Examples
//code to show the nesting in class 
class A;
  int a;
endclass

class B;
  A ah;
  function new();
    ah = new();
  endfunction
  int b;
endclass

module test;
  //A ah;
  B bh;
  initial begin
    //ah = new(); not required because already the function new in the
    // class will call the super.new which in turns calls the one upper parent class 
    bh = new();
    //bh.a = 10;
    bh.b = 20;
    $display("The value of  b %d in handle bh",bh.b);
    bh.ah.a = 10;
    $display("The value of a is %d  in handle ah",bh.ah.a);
  end
endmodule 
