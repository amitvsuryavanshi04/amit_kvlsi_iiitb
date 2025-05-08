// Code your design here
module even_odd_check(
  input [7:0] num,      // 8-bit input number
  output reg is_even    // 1 if even, 0 if odd
);

  always @ (num) begin
    // Check LSB for even or odd
    if (num[0] == 0)  // LSB = 0 implies even
      is_even = 1;
    else              // LSB = 1 implies odd
      is_even = 0;
  end
endmodule
