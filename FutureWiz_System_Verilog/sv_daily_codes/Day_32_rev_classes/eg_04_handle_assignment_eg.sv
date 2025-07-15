//classes copy methods
  //handle assignment 
  class A;
    int a;
  endclass
  
  //
  class B;
    A ah;
    function new();
      ah = new();
    endfunction
    int b;
  endclass[
  
  module test_handle_assignment;
    B hb1,hb2;
    initial begin 
      hb1 = new();
      $display("The values of the a: %0d and b: %0d before handle assignment copy method ",hb1.b,hb1.ah.a);
      hb1.b = 100;
      hb1.ah.a = 200;
      hb2 = hb1;
      $display("The values of the a: %0d and b: %0d",hb1.b,hb1.ah.a);
    end
  endmodule
