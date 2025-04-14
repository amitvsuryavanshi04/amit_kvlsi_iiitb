module bitwise_operators;
  reg [3:0] a = 4'b1100, b = 4'b1010;
  reg [3:0] result;

  initial begin
    result = a & b;
    $display("The operation using &: %b & %b = %b", a, b, result);
    result = a | b;
    $display("The operation using |: %b | %b = %b", a, b, result);
    result = a ^ b;
    $display("The operation using ^: %b ^ %b = %b", a, b, result);
    result = ~a;
    $display("The operation using ~: ~%b = %b", a, result);
  end
endmodule
