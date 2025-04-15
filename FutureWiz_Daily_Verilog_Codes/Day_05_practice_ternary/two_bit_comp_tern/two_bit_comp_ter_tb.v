module tb_comparator_2bit_ternary;

  reg [1:0] A, B;
  wire A_eq_B, A_gt_B, A_lt_B;

  // Instantiate the DUT (Device Under Test)
  comparator_2bit_ternary uut (
    .A(A),
    .B(B),
    .A_eq_B(A_eq_B),
    .A_gt_B(A_gt_B),
    .A_lt_B(A_lt_B)
  );

  initial begin
    $display("Time\tA\tB\tA==B\tA>B\tA<B");
    $monitor("%0t\t%b\t%b\t%b\t%b\t%b", 
              $time, A, B, A_eq_B, A_gt_B, A_lt_B);

    // Loop through all combinations of 2-bit A and B
    for (A = 0; A < 4; A = A + 1) begin
      for (B = 0; B < 4; B = B + 1) begin
        #5; // Wait 5 time units between each test
      end
    end

    $finish; // End simulation
  end

endmodule
