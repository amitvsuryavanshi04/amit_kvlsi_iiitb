//deep copy example 
class A;
  int a;

  // Copy method for class A
  function A copy();
    A temp = new();
    temp.a = this.a;
    return temp;
  endfunction
endclass

class B;
  int b;
  A h_a;

  function new();
    h_a = new();
  endfunction

  // Deep copy method for class B
  function B copy();
    B temp = new();
    temp.b = this.b;
    temp.h_a = this.h_a.copy();  // deep copy of object A
    return temp;
  endfunction
endclass

module test_case_deep_copy;
  B h_b1, h_b2;

  initial begin
    h_b1 = new();
    h_b2 = new();

    h_b1.b = 50;
    h_b1.h_a.a = 100;

    // Deep copy: creates independent copy of h_b1
    h_b2 = h_b1.copy();

    // Modify original after copy
    h_b1.h_a.a = 1000;
    h_b2.b = 20;

    // Display results
    $display("Handle 1 data A = %0d, B = %0d", h_b1.h_a.a, h_b1.b);
    $display("Handle 2 data A = %0d, B = %0d", h_b2.h_a.a, h_b2.b);
  end
endmodule
