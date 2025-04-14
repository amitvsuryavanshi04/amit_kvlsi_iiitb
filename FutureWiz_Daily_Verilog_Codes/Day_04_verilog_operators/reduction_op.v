module reduction_operators;
  reg [3:0] a = 4'b1101;
  reg result;

  initial begin
    result = &a;
    $display("The operation using &: &%b = %b", a, result);
    result = |a;
    $display("The operation using |: |%b = %b", a, result);
    result = ^a;
    $display("The operation using ^: ^%b = %b", a, result);
    result = ~&a;
    $display("The operation using ~&: ~&%b = %b", a, result);
    result = ~|a;
    $display("The operation using ~|: ~|%b = %b", a, result);
    result = ~^a;
    $display("The operation using ~^: ~^%b = %b", a, result);
  end
endmodule
