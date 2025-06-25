module tb_getting_coverage;

  // Declare variables
  bit [3:0] a, b;

  // Covergroup definition
  covergroup cvg;
    cvp1 : coverpoint a;
    cvp2 : coverpoint b;
    cvp3 : cross a, b;
  endgroup

  // Declare a handle for the covergroup
  cvg cvg1;

  // Initial block for stimulus and sampling
  initial begin
    cvg1 = new();  // Create a new instance of the covergroup

    repeat (10) begin
      a = $random(); 
      b = $random(); 

      cvg1.sample();  // Sample values of a and b

      $display("A = %0d & B = %0d", a, b);
     
    end
     $display("Coverage of A = %0.2f%%, B = %0.2f%%, and A*B Cross = %0.2f%%\n",
                cvg1.cvp1.get_coverage(),
                cvg1.cvp2.get_coverage(),
                cvg1.cvp3.get_coverage());
  end

endmodule
