module logical_operators;
  reg a = 1, b = 0;
  reg result;

  initial begin
    result = a && b;
    $display("The operation using &&: %b && %b = %b", a, b, result);
    result = a || b;
    $display("The operation using ||: %b || %b = %b", a, b, result);
    result = !a;
    $display("The operation using !: !%b = %b", a, result);
  end
endmodule
