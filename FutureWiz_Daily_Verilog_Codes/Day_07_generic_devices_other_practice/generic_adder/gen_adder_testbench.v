`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.04.2025 10:55:18
// Design Name: 
// Module Name: gen_adder_testbench
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
module gen_adder_testbench;
reg [dut.N-1:0]a,b;
wire [dut.N:0]sum;
defparam dut.N = 6; //N can be changed here as well
gen_adder dut(a,b,sum);

initial begin 
     for (integer i = 0; i<2**(2*dut.N);i=i+1) begin
     {a,b} = i;
     #5;
     end
     end
endmodule