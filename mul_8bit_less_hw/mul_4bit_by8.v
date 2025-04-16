module mul_by_8 (in,out);
  input [3:0] in;
  output [6:0] out;  // 4-bit input × 8 = max 7-bit output
  assign out = in << 3;
endmodule
