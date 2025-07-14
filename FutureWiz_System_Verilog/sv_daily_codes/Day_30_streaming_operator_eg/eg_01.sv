module test;
  int unsigned a1, a2;
  byte b, c, d, e;

  initial begin
    b = 8'hAB;
    c = 8'hCD;
    d = 8'hEF;
    e = 8'hAA;

    // Packing using streaming operator on RHS
    a1 = {>>{b, c, d, e}};
    $display("Packed value (a1) using streaming operator: %h", a1);

    // Assign a 32-bit value to a2
    a2 = 32'h1234ABCD;

    // Unpacking using streaming operator on LHS
    {>>{b, c, d, e}} = a2;
    $display("Unpacked values from a2 = %0h:", a2);
    $display("  b = %0h", b);
    $display("  c = %0h", c);
    $display("  d = %0h", d);
    $display("  e = %0h", e);
  end
endmodule
