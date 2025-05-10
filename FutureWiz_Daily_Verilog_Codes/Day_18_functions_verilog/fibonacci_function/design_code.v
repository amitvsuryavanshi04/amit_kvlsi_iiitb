module fibonacci_function;
  integer i;
  integer fib[0:9];

  // Function to compute nth Fibonacci number
  function integer get_fib;
    input integer n;
    integer a, b, temp, j;
    begin
      if (n == 0 || n == 1)
        get_fib = 1;
      else begin
        a = 1;
        b = 1;
        for (j = 2; j <= n; j = j + 1) begin
          temp = a + b;
          a = b;
          b = temp;
        end
        get_fib = b;
      end
    end
  endfunction

  initial begin
    // Generate and store Fibonacci series
    for (i = 0; i < 10; i = i + 1)
      fib[i] = get_fib(i);

    // Print Fibonacci series
    $display("Fibonacci Series:");
    for (i = 0; i < 10; i = i + 1)
      $write("%0d ", fib[i]);
    $display();
  end
endmodule
