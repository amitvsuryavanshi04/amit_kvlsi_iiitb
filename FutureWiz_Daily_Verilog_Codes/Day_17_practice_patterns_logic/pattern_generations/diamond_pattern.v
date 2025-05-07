module pattern_diamond #(parameter N = 4);  // N is the number of rows for the top part
  integer i, j;

  initial begin
    // Top part of diamond
    for (i = 1; i <= N; i = i + 1) begin
      for (j = 1; j <= N - i; j = j + 1) begin
        $write(" ");  // Print spaces
      end
      for (j = 1; j <= (2 * i - 1); j = j + 1) begin
        if (j % 2 == 1) $write("*");  // Print stars at odd positions
        else $write(" ");  // Print spaces in between stars
      end
      $display();
    end

    // Bottom part of diamond
    for (i = N - 1; i >= 1; i = i - 1) begin
      for (j = 1; j <= N - i; j = j + 1) begin
        $write(" ");  // Print spaces
      end
      for (j = 1; j <= (2 * i - 1); j = j + 1) begin
        if (j % 2 == 1) $write("*");  // Print stars at odd positions
        else $write(" ");  // Print spaces in between stars
      end
      $display();
    end
  end
endmodule
