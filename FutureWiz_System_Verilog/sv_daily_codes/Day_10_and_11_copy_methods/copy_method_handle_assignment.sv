//class copy method: handle assignment 
class A;
  int a;
endclass

class B;
  int b;
  A h_a;
  function new();
    h_a = new();
  endfunction
endclass

//testcase
module test_case_handle_assignment;
  B h_b1,h_b2;
  initial begin
    h_b1 = new();
    h_b2 = new();
    h_b1.b = 50;
    h_b1.h_a.a = 100;
    h_b2 = h_b1;
    h_b1.h_a.a = 1000;
    
    $display("Handle 1 data A = %0d,B = %0d",h_b1.h_a.a,h_b1.b); //display for handle 1 
    $display("Handle 2 data A = %0d,B = %0d",h_b2.h_a.a,h_b2.b);
  end
endmodule 