module three_d_array_unpacked ;

  // Declare a 3D unpacked fixed integer array (3x3x3)
  int cube[3][3][3];

  initial begin
    // Initialize the array: cube[i][j][k] = k + 1
    for (int i = 0; i < 3; i++) begin
      for (int j = 0; j < 3; j++) begin
        for (int k = 0; k < 3; k++) begin
          cube[i][j][k] = k + 1;
        end
      end
    end

    // 1. Print using foreach loop
    $display("Printing using foreach loop (i, j, k):");
    foreach (cube[i]) begin
      foreach (cube[i][j]) begin
        foreach (cube[i][j][k]) begin
          $display("cube[%0d][%0d][%0d] = %0d", i, j, k, cube[i][j][k]);
        end
      end
    end

    // 2. Element-by-element print using for loop
    $display("\nElement-by-element printing:");
    foreach (cube[i,j,k]) begin
		$display("cube[%0d][%0d][%0d] = %0d", i, j, k, cube[i][j][k]);
	end


    // 3. One-line curly brace print
    $write("\nOne-line curly brace format:\n");
    
$display("cube = %p", cube);
        
  end

endmodule

