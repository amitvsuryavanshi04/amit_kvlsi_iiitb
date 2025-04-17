`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2025 10:11:45
// Design Name: 
// Module Name: xnor_3ip
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module mux21_design(i,s,y);
    input [1:0]i;
    input s;
    output y;
    assign y = (s) ? i[1] : i[0];
endmodule

module xnor_3ip(a,b,c,y);
input a,b,c;
output y;
wire [3:0]w; 
mux21_design m1({c,w[2]},b,w[0]);
mux21_design m2({w[2],c},b,w[1]);
mux21_design m3(w,a,y);
mux21_design m4({1'b0,1'b1},c,w[2]);
endmodule
