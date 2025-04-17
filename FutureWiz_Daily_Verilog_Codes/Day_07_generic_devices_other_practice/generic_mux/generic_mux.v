`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2025 19:34:35
// Design Name: 
// Module Name: generic_mux
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


module generic_mux #(parameter N = 4)(
    input  [N-1:0]          data,     // N inputs
    input  [$clog2(N)-1:0]  sel,      // select lines (clog2(N) bits)
    output                  y         // 1-bit output
);

    assign y = data[sel];

endmodule

