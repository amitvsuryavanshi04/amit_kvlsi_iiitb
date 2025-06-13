//creating a class A..... 
//minimum two classes are required to make nesting of classes 


typedef class A; //with typedef  
//class b
class B;
  int b;
  A h_a; //nesting of class handle of class a in class b
  function new();
    h_a = new();//creating handle of class A
  endfunction
endclass
//declaring class a (top class after the class B )
class A;
  int a;
endclass


//testcase
module test;
  B h_b1,h_b2; //creating handles of class B
  initial begin
    h_b1 = new(); //creating mem for handle h_b1
    h_b2 = new(); //creating mem for handle h_b2
    //writing the values to the handles
    h_b1.b = 100;
    h_b1.h_a.a = 200;
    $display("For handle h_b1 a = %0d,b = %0d",h_b1.b, h_b1.h_a.a);//for h_b1 handle
    $display("For handle h_b2 a = %0d,b = %0d",h_b2.b, h_b2.h_a.a);//for h_b2 handle
  end
endmodule