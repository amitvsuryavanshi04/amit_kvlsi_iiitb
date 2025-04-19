
module mux21(i[0],i[1],s,y);
input [1:0]i;
input s;
output y;
assign y = (s) ?i[1]:i[0];
endmodule

module dff(d,clk,q);
input clk,d;
output q;

wire q_int1;
 wire q_int2;

mux21 m1(q_int1,d,clk,q_int1);
mux21 m2(q_int2,q_int1,~clk,q_int2);

assign q = q_int2;
endmodule