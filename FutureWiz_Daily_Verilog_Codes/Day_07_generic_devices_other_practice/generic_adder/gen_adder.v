`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2025 10:53:13
// Design Name: 
// Module Name: gen_adder
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


module gen_adder #(parameter N = 4) (a,b,sum);
 input  [N-1:0]a;     // First operand
    input  [N-1:0]b;  // Second operand
    output [N:0]sum;           
    assign sum = a + b;
endmodule

