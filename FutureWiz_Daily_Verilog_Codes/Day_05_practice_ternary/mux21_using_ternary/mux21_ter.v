// Code your design here
//2x1 using ternary operator
module mux21_t(s,i,y);
  input [1:0]s;
  input i;
  output y;
  assign y = (s) ? i[1]:i[0];
endmodule
