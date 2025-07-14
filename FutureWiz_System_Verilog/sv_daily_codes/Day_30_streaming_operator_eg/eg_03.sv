module stream_pack_msb;
  byte a = 8'h11, b = 8'h22, c = 8'h33, d = 8'h44;
  int result;

  initial begin
    result = {<<{a, b, c, d}};
    $display("Packed (MSB-first): 0x%0h", result); // Expect: 0x11223344
  end
endmodule
