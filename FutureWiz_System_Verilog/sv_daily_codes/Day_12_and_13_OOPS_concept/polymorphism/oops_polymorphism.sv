//code for polymorphism in OOPs concept
//definition of polymorphism 
//it's simply means many forms which refers to the accessing the methods of child using
//parent handle. parent act like child 
class A; 
  virtual function void display();
    $display("A");
  endfunction
endclass

//declare another class B
class B extends A;
  function void display();
    $display("B");
  endfunction
endclass

//declare third class C
class C extends B;
  function void display();
    $display("C");
  endfunction
endclass


//testcase 
module test_polymorphism;
  A a;
  B b;
  C c;
  
  initial begin
    c = new();
    b = c;
    a = b;
    b.display();
    a.display();
  end 
endmodule
