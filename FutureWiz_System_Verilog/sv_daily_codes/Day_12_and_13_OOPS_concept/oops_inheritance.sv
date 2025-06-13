// the code shows how inheritance happens , 
//a pillar of OOPS concept
class parent;
  int x;
  function void pdisplay();
    $display("Hi I am in parent class.");
    $display("x = %0d",x);
  endfunction
endclass

//declaration of child class
class child extends parent; 
  ///syntax for inheritance
  //class derived_class extends base_class
  int y;
  function void cdisplay();
    $display("Hi I am in child class.");
    $display("x = %0d, and y = %0d",super.x,y);
  endfunction
endclass

//testcase 
module testcase_inheritance;
  parent p;
  child c;
  initial begin
    p = new(); //creating parent handle object
    c = new(); //creating child handle object
    
    p.x = 100;
    $display("Here after declaring the x value as 100, printing happens.");
    p.pdisplay();  //prints parent class x value
    $display("$parent display gives different result than child display result");
    c.pdisplay();// child class x value 
   
    c.x = 20;
    c.y = 30; //writing the child and parent properties 
    $display("The child cdisplay code will give the correct proper output , as it shows the inherited property from parent class,\n  implicitly the super new function is used to call the one upper parent class.");
    c.cdisplay();//display the child and parent class
    
  end
endmodule
    