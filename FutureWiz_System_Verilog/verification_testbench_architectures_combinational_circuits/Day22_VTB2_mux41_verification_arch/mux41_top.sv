`include "mux41_test.sv"
// Top Module
module top;
  mux_if mif();

  // DUT instantiation using ternary operator-based mux
  mux41_t dut (.i(mif.i), .s(mif.s), .y(mif.y));
test t (mif);
endmodule
