
class packet;
  int addr;
  int data;
  function void display();
    $display("Address = %0d, Data = %0d",addr,data);
  endfunction
endclass
//testcase
module test;
  packet p1,p2;
  initial begin
    p1=new();
    p2=new();
    p1.display(); //error should be given because new is not used if it is used then the first display will show 0 as values 
    p2.display();
    p1.addr = 10;//assigning the values to the properties
    p1.data = 20;//using the dot hierarchial approach
    p2.addr = 100;
    p2.data = 200;
    p1.display();//using the display function
    p2.display(); //for the object p2
  end
endmodule