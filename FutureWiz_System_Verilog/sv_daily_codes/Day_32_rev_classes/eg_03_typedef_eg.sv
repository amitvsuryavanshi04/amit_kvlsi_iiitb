//class example for the typedef keyword usage 

typedef class A;
class B;
  A ah;
  function new();
    ah = new();
  endfunction
  int b;
endclass
//typedef used for forward referencing 

class A;
  int a;
endclass

module test;
  //A ah;
  B bh;
  initial begin
    //ah = new();
    bh = new();
    //bh.a = 10;
    bh.b = 20;
    $display("The value of  b %d in handle bh",bh.b);
    bh.ah.a = 10;
    $display("The value of a is %d  in handle ah",bh.ah.a);
  end
endmodule 
