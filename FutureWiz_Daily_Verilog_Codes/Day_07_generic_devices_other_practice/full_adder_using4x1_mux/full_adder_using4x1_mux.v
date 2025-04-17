`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2025 09:46:39
// Design Name: 
// Module Name: full_adder_using4x1_mux
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


module full_adder_using4x1_mux(i,sum,cout);
input [2:0]i;
output sum, cout;
wire [1:0]w;
assign w[1] = {i[0],~i[0],~i[0],i[0]};
assign w[0] = {1'b1,i[0],i[0],1'b0};
mux41_design m1(w[1],i,sum);
mux41_design m2(w[0],i,cout);
endmodule
