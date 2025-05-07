module pattern_numbers #(parameter N = 4);  // N is the number of rows
  integer i, j;

  initial begin
    for (i = 1; i <= N; i = i + 1) begin
      for (j = 1; j <= i; j = j + 1) begin
        $write("%0d ", j);
      end
      $display();
    end
  end
endmodule
