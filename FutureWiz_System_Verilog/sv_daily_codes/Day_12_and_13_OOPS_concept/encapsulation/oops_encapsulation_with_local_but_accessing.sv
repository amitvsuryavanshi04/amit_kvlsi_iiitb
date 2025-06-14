
//scenario 
//where the new methods and new function is used to access the local properties 
class pkt;
  local bit [7:0] addr;
  local bit [7:0] data;

  // Constructor with typed arguments
  function new(bit [7:0] addr, bit [7:0] data);
    this.addr = addr;
    this.data = data;
    display();
  endfunction

  function void display();
    $display("Addr = %0d, Data = %0d", addr, data);
  endfunction
endclass

// Testcase
module test_local_encapsulation;
  pkt p;
  initial begin
    p = new(100, 200);  // Correct: constructor initializes values
    // Illegal: Cannot access local members directly
    // p.addr = 100;
    // p.data = 200;
    
    p.display();        // Legal: method inside class can access local
  end
endmodule
