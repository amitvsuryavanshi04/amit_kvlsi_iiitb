`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.04.2025 18:56:51
// Design Name: 
// Module Name: simulation_code_for_design
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

module tb_design_file_four_ip_nand;
  reg [3:0] i;
  wire y;

  // Instantiate the design under test
  design_file_four_ip_nand dut (.i(i),.y(y));
  integer k;
  initial begin
    $display("Time\t i\t y");
    $display("--------------------");

    for (k = 0; k < 16; k = k + 1) begin
      i = k[3:0]; // apply all combinations from 0000 to 1111
      #10; // wait for output to settle
      $display("%2t\t%b\t%b", $time, i, y);
    end
    $finish;
  end
endmodule

