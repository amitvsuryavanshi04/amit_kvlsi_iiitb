// Class declaration with extern functions
class xyz;
  // Declarations (prototypes only)
  extern function void fun1();
  extern function void fun2();
  extern function void fun3();
endclass

// Definitions outside the class
function void xyz::fun1();
  $display("Inside function fun1");
endfunction

function void xyz::fun2();
  $display("Inside function fun2");
endfunction

function void xyz::fun3();
  $display("Inside function fun3");
endfunction

// Testbench to verify
module tb_extern_functions;
  initial begin
    xyz obj = new();     // Create object
    obj.fun1();          // Call extern functions
    obj.fun2();
    obj.fun3();
  end
endmodule
