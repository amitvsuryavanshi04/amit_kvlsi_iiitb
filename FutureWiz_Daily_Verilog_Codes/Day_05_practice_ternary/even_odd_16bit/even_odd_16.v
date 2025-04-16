module even_odd_checker (
  input [15:0] num,
  output y  // 0 = EVEN, 1 = ODD
);
  assign y = (num[0] == 1'b1) ? 1'b1 : 1'b0;
endmodule