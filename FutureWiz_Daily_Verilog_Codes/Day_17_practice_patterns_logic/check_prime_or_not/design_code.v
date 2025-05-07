// Code your design here
module prime_check;
  integer num;        // Number to check
  integer i;
  reg is_prime;
  reg found_divisor;

  initial begin
    num = 29;  // Change this number to test

    is_prime = 1;         // Assume prime
    found_divisor = 0;

    if (num < 2) begin
      is_prime = 0;
    end else begin
      for (i = 2; i <= num / 2; i = i + 1) begin
        if (num % i == 0 && found_divisor == 0) begin
          is_prime = 0;
          found_divisor = 1;  // Acts like 'break'
        end
      end
    end

    if (is_prime)
      $display("Number %0d is Prime", num);
    else
      $display("Number %0d is Not Prime", num);
  end
endmodule
