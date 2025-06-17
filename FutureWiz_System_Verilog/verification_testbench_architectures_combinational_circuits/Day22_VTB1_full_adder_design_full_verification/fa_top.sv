`include "fa_test.sv"
`include "fa_interface.sv"
// Top module
module top;
  fa_intf inf();
  fa dut(.a(inf.a), .b(inf.b), .cin(inf.cin), .s(inf.s), .cout(inf.cout));

  initial begin
    test t;
    t = new(inf);
    t.run();
    $finish;
  end
endmodule