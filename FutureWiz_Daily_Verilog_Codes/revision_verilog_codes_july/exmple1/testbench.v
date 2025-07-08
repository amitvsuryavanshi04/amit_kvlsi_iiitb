module test_ex1;
  reg a, b;
  wire y;

  m1 uut(.a(a), .b(b), .y(y));

  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, test_ex1);
    
    a = 0; b = 0;
    #10 a = 0; b = 1;
    #10 a = 1; b = 0;
    #10 a = 1; b = 1;
    #10 $finish;
  end

  initial begin
    $monitor("Time=%0t a=%b b=%b y=%b", $time, a, b, y);
  end
endmodule
