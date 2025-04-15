module tb_mux41;

  // Testbench signals
  reg [3:0] i;
  reg [1:0] s;
  wire y;

  // Instantiate the DUT (Device Under Test)
  mux41_t uut (
    .s(s),
    .i(i),
    .y(y)
  );

  initial begin
    // Monitor changes
    $monitor("Time=%0t | s=%b | i=%b | y=%b", $time, s, i, y);
    
    // Set inputs
    i = 4'b1010; // You can change this to any test pattern
    
    // Test all combinations of select lines
    s = 2'b00; #10;
    s = 2'b01; #10;
    s = 2'b10; #10;
    s = 2'b11; #10;

    // Try another input pattern
    i = 4'b1101; #10;
    s = 2'b00; #10;
    s = 2'b01; #10;
    s = 2'b10; #10;
    s = 2'b11; #10;

    $finish;
  end

endmodule
