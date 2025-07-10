module tb_counter_gidc;
  reg clk, rst;
  wire [2:0] count; // Match DUT width
  wire ctrl;        // DUT internal ctrl exposed (optional)

  // Updated module instantiation (assumes ctrl is now output from DUT)
  counter_gidc dut(.clk(clk), .rst(rst), .count(count));

  // Clock generation in separate block
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Stimulus block
  initial begin
    rst = 0;
    #12 rst = 1;
    // No need to assign ctrl here if it's generated inside DUT
    $monitor("SimTime: [%0t]  Count = %0d", $time, count);
    #500 $finish;
  end

  // Dump VCD file
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tb_counter_gidc);
  end

endmodule
