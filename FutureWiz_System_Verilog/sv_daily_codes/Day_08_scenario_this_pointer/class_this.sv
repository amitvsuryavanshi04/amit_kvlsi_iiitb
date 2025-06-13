//scenario one , the arguments have different names 
class packet;
  int a;
  int b;
  function new( int x  = 0,int y = 0);
  a = x;
  b = y;//here the arguments have different names as that of class properties 
endfunction
  function void display();
    $display("a=%0d,b=%0d",a,b);
  endfunction

endclass

//testcase 
module test;
  packet p1,p2;
  initial begin
    p1 = new();
    p2 = new();
    p1.display();
    p2.display();
    $display("Values of packet 1 and 2 before assignment.");
    p1 = new(10,20);
    p2 = new(100,200);
    $display("Values of packet 1 and 2 after assignment.");
    p1.display();
    p2.display();
  end
endmodule

//-------------------------------------------------------
//scenario two the names of the properties and arguments are same 
class packet;
  int a;
  int b;
  function new( int a  = 0,int b = 0);
  a = a;
  b = a;//here the arguments have same names as that of calss properties 
  //but their is no this pointer
endfunction
  function void display();
    $display("a=%0d,b=%0d",a,b);
  endfunction

endclass

//testcase 
module test;
  packet p1,p2;
  initial begin
    p1 = new();
    p2 = new();
    p1.display();
    p2.display();
    $display("Values of packet 1 and 2 before assignment.");
    p1 = new(10,20);
    p2 = new(100,200);
    $display("Values of packet 1 and 2 after assignment.");
    p1.display();
    p2.display();
  end
endmodule

//-------------------------------------------------------
//scenario three when this pointer is used if the names of function arguments and class properties are same
class packet;
  int a;
  int b;
  function new( int a  = 0,int b = 0);
  this.a = a;
  this.b = b;//here the arguments have different names as that of calss properties 
endfunction
  function void display();
    $display("a=%0d,b=%0d",a,b);
  endfunction

endclass

//testcase 
module test;
  packet p1,p2;
  initial begin
    p1 = new();
    p2 = new();
    $display("Results after using the this after pointer.");
    p1.display();
    p2.display();
    $display("Values of packet 1 and 2 before assignment.");
    p1 = new(10,20);
    p2 = new(100,200);
    $display("Values of packet 1 and 2 after assignment.");
    p1.display();
    p2.display();
  end
endmodule
