`timescale 1ns/1ps
module tlatch_test;

  reg t, clk, rst_n;
  wire q;

  // Instantiate DUT
  t_latch dut (
    .clk(clk),
    .rst_n(rst_n),
    .t(t),
    .q(q)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk; // 10ns clock period
  end

  // Stimulus
  initial begin
    // Initialize inputs
    t = 0;
    rst_n = 0;

    // Apply reset
    #12 rst_n = 1;

    // Toggle T at different clock cycles
    #10 t = 1;  // Expect toggle
    #10 t = 0;  // No toggle
    #10 t = 1;  // Toggle
    #20 t = 0;  // Hold
    #10 t = 1;  // Toggle
    #20 t = 0;

    // Finish simulation
    #40 $finish;
  end

  // Monitor signal values
  initial begin
    $monitor("Time = %0t | rst_n = %b | t = %b | q = %b", $time, rst_n, t, q);
  end

  // Dump waveform
  initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, tlatch_test);
  end

endmodule
