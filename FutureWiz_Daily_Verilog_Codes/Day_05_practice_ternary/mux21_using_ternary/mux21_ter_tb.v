module tb_mux21_t;
  reg s;
  reg [1:0] i;
  wire y;

  // Instantiate the mux
  mux21_t uut (.s(s), .i(i), .y(y));

  initial begin
    // Monitor changes
    $monitor("Time=%0t | s=%b | i[1]=%b i[0]=%b | y=%b", $time, s, i[1], i[0], y);

    // Test Case 1
    s = 0; i = 2'b01; #10;  // Expected y = i[0] = 1

    // Test Case 2
    s = 1; i = 2'b10; #10;  // Expected y = i[1] = 1

    // Test Case 3
    s = 0; i = 2'b00; #10;  // Expected y = 0

    // Test Case 4
    s = 1; i = 2'b11; #10;  // Expected y = 1

    $finish;
  end
endmodule
