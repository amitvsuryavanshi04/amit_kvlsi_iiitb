module b2g_converter(b,g);
input [2:0]b;
output [2:0]g;
//g[2]=b[2] buffer can be used
buf b1(g[2],b[2]);
xor x1(g[1],b[2],b[1]);
xor x2(g[0],b[1],b[0]);
endmodule