module even_odd_function_check;
  reg [7:0] num;
  reg result;

  // Function to check if number is even
  function is_even;
    input [7:0] val;
    begin
      if (val[0] == 0)
        is_even = 1;  // Even
      else
        is_even = 0;  // Odd
    end
  endfunction

  initial begin
    num = 8'd42;  // Change number here

    result = is_even(num);

    if (result)
      $display("Number %0d is Even", num);
    else
      $display("Number %0d is Odd", num);
  end
endmodule
