module b2g_dut ( input  [3:0] bit_in, output [3:0] gray_out);
  assign gray_out[3] = bit_in[3];
  assign gray_out[2] = bit_in[3] ^ bit_in[2];
  assign gray_out[1] = bit_in[2] ^ bit_in[1];
  assign gray_out[0] = bit_in[1] ^ bit_in[0];
endmodule
