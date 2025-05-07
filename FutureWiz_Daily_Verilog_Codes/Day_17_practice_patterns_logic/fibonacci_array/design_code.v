module fibonacci;
  integer fib[0:9];
  integer i;

  initial begin
    // Start from 1, 1 instead of 0, 1
    fib[0] = 1;
    fib[1] = 1;

    for (i = 2; i < 10; i = i + 1)
      fib[i] = fib[i - 1] + fib[i - 2];

    // Print Fibonacci series
    $display("Fibonacci Series:");
    for (i = 0; i < 10; i = i + 1)
      $write("%0d ", fib[i]);
    $display();
  end
endmodule
