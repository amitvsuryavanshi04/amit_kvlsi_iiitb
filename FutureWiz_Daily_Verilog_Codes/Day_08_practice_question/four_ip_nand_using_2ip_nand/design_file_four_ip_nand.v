`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 18:44:23
// Design Name: 
// Module Name: design_file_four_ip_nand
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


module design_file_four_ip_nand(i,y);//the inputs present in the 
//diagram are A,B,C,D corresponding to i[0],i[1],i[2],i[3] in this code
input [3:0]i;
output y;
wire [4:1]w;
nand n1(w[1],i[0],i[1]);
nand n3(w[2],i[2],i[3]);
nand n2(w[3],w[1],w[1]);
nand n4(w[4],w[2],w[2]);
nand n5(y,w[3],w[4]);
endmodule
