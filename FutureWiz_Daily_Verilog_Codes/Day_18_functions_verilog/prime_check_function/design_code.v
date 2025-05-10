// Code your design here
module prime_check_functional;
  integer num;

  // Function to check if a number is prime
  function is_prime;
    input integer n;
    integer j;
    begin
      if (n < 2)
        is_prime = 0;
      else begin
        is_prime = 1;  // Assume prime
        for (j = 2; j <= n / 2; j = j + 1) begin
          if (n % j == 0) begin
            is_prime = 0;
            // No 'disable' in Verilog-2005 functions, so just break logic
            j = n;  // Force loop exit
          end
        end
      end
    end
  endfunction

  initial begin
    num = 29;  // Change number to test here

    if (is_prime(num))
      $display("Number %0d is Prime", num);
    else
      $display("Number %0d is Not Prime", num);
  end
endmodule
