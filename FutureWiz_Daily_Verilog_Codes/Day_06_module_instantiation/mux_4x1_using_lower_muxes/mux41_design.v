module mux41_design(i,s,y);
input [3:0]i;
input [1:0]s;
output y;
wire [1:0]w;
mux21_design m1(.i(i[1:0]),.s(s[1]),.y(w[1]));
mux21_design m2(.i(i[3:2]),.s(s[1]),.y(w[2]));
mux21_design m3(.i(w),.s(s[0]),.y(y));
endmodule