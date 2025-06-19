// Code your testbench here
// or browse Examples

//top code 
`include "b2g_test.sv"
module top;
  b2g_intf b2g_if();
  b2g_dut dut(.bit_in(b2g_if.bit_in),.gray_out(b2g_if.gray_out));
  b2g_test b2g_tb (b2g_if);
endmodule