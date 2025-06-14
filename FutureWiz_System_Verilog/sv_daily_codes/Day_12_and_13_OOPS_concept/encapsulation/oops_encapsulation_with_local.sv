//using local keyword 
// Parent class with encapsulated variable
class parent;
  local int x;

  // Constructor
  function new(int a = 0);
    x = a;
  endfunction

  // Setter
  function void set_x(int val);
    x = val;
  endfunction

  // Getter
  function int get_x();
    return x;
  endfunction

  function void displayp();
    $display("Hi I am in parent class.");
    $display("Value of parent class property x = %0d", x);
  endfunction
endclass

// Child class
class child extends parent;
  local int y;

  // Constructor
  function new(int a = 0, int b = 0);
    super.new(a); // sets x
    y = b;
  endfunction

  // Setter
  function void set_y(int val);
    y = val;
  endfunction

  // Getter
  function int get_y();
    return y;
  endfunction

  function void displayc();
    $display("Hi I am in child class.");
    $display("Value of parent x = %0d, child y = %0d", get_x(), y);
  endfunction
endclass

// Testbench
module test;
  parent p;
  child c;

  initial begin
    p = new();           // Default constructor, x = 0
    c = new();           // Default constructor, x = 0, y = 0

    p.set_x(100);        // Set parent x
    c.set_x(20);         // Set child x via parent method
    c.set_y(30);         // Set child y

    p.displayp();        // Display parent's x
    c.displayp();        // Inherited display of parent's x
    c.displayc();        // Display child-specific values
  end
endmodule

