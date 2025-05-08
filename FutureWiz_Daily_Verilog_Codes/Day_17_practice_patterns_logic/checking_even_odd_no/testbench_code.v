// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module tb_even_odd_check;

  reg [7:0] num;          // Input number for DUT
  wire is_even;           // Output from DUT
  
  // Instantiate the DUT (Design Under Test)
  even_odd_check uut (
    .num(num), 
    .is_even(is_even)
  );

  initial begin
    // Create dump file for waveform
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_even_odd_check);

    // Test different numbers
    num = 8'b00000000;  // 0 - Even
    #10;
    $display("Number: %0d, Is Even: %b", num, is_even);

    num = 8'b00000001;  // 1 - Odd
    #10;
    $display("Number: %0d, Is Even: %b", num, is_even);

    num = 8'b00000100;  // 4 - Even
    #10;
    $display("Number: %0d, Is Even: %b", num, is_even);

    num = 8'b00000101;  // 5 - Odd
    #10;
    $display("Number: %0d, Is Even: %b", num, is_even);

    num = 8'b00001000;  // 8 - Even
    #10;
    $display("Number: %0d, Is Even: %b", num, is_even);

    num = 8'b00001001;  // 9 - Odd
    #10;
    $display("Number: %0d, Is Even: %b", num, is_even);

    $finish;
  end
endmodule
