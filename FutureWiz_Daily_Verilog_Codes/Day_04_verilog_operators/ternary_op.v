module ternary_operator;
  reg sel = 1;
  reg [3:0] a = 4'b1010, b = 4'b0101;
  reg [3:0] result;

  initial begin
    result = sel ? a : b;
    $display("The operation using ?: %b ? %b : %b = %b", sel, a, b, result);
  end
endmodule
