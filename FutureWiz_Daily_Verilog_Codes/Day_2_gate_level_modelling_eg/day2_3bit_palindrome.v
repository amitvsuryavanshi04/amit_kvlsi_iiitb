module palin_detect(b,y);
input [2:0]b;
output y;
xnor xn1(y,b[2],b[0]);
endmodule