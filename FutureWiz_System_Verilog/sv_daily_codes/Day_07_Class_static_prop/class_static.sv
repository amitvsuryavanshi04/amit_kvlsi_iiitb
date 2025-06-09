class packet;
  static int addr;//declaring the properties as static
  static int data;//if not declared as static they are default automatic
  static function void display();
    $display("Address = %0d, Data = %0d",addr,data);
  endfunction
endclass
//testcase
module test;
  packet p1,p2;
  initial begin
    p1.display();
    p2.display(); //will show 0,0 as values
    p1.addr = 100;
    p1.data = 200;
    p1.display();//100,200
    p2.display();//same as of the packet p1
    //since both the functions are static the p1 and p2 will
    //share the same memory and p1 and p2 object has same values for properties
  end
endmodule
