module tb_getting_coverage;

  // Declare integer variables
  int a, b;

  // Covergroup with all types of bins
  covergroup cvg;
    
    // Coverpoint A with automatic bins
    cvp1: coverpoint a {
      bins auto_bins[] = {[0:15]};
    }

    // Coverpoint B with all bin types correctly used
    cvp2: coverpoint b {
      bins single_bin = {5};                      // Single bin
      bins array_bin[] = {[1:3], [7:9]};          // Array bins
      bins default_bin = default;                 // Default bin
      ignore_bins ignore_vals = {13};             
      illegal_bins illegal_vals = {10};          
    }


  endgroup

  // Covergroup instance
  cvg cvg1;

  // Test stimulus and sampling
  initial begin
    cvg1 = new();

    repeat (10) begin
      a = $urandom_range(0, 20);
      b = $urandom_range(0, 15); // include chance to hit 5, 10, 13

      $display("A = %0d, B = %0d", a, b);
      cvg1.sample();
    end

    // Report coverage
    $display("\n--- COVERAGE REPORT ---");
    $display("Coverage of A = %0.2f%%", cvg1.cvp1.get_coverage());
    $display("Coverage of B = %0.2f%%", cvg1.cvp2.get_coverage());
    $display("------------------------\n");
  end

endmodule
