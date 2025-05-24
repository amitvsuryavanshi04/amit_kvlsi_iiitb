module two_d_array_unpacked;

  // Declare a 2D unpacked fixed integer array (5x5)
  int matrix[5][5];

  initial begin
    // Initialize the array such that matrix[i][j] = j + 1
    for (int i = 0; i < 5; i++) begin
      for (int j = 0; j < 5; j++) begin
        matrix[i][j] = j + 1;
      end
    end

    // Print array using foreach loop (matrix-style)
    $display("Printing matrix using foreach loop (row-wise):");
    foreach (matrix[i]) begin
      foreach (matrix[i][j]) begin
        $write("%0d ", matrix[i][j]);
      end
      $display("");  // Newline after each row
    end

    // Print array element-by-element
    $display("\nPrinting matrix element-by-element:");
    for (int i = 0; i < 5; i++) begin
      for (int j = 0; j < 5; j++) begin
        $display("matrix[%0d][%0d] = %0d", i, j, matrix[i][j]);
      end
    end
  end

endmodule

