// regions in verilog 
module test_typ3;
  reg clk  = 0;
  reg a = 0, b = 0, c = 0;
  event trigger_event;

  // clock generation
  always #5 clk = ~clk;

  // prepone region 
  wire x = a & b;

  // active region
  always @(posedge clk) begin
    a = 1;
    b <= 1;
    -> trigger_event;
    $display("Active Region: a=%0d, b=%0d, x=%0d @ %0t.", a, b, x, $time);
  end

  // inactive region
  always @(trigger_event) begin
    $display("Inactive Region: a=%0d, b=%0d, x=%0d @ %0t", a, b, x, $time);
  end

  // postponed region
  always @(posedge clk) begin
    #0; // 0 delay → postponed region
    $strobe("Postponed Region: a=%0d, b=%0d, c=%0d, x=%0d @ %0t", a, b, c, x, $time);
  end

  // monitor (also postponed region)
  initial begin
    $monitor("Monitor (Postponed): a=%0d, b=%0d, c=%0d, x=%0d @ %0t", a, b, c, x, $time);
  end

  // simulation control — run for limited time
  initial begin
    #30; // run for 30 time units
    $display("Simulation completed at time %0t", $time);
    $finish;
  end

endmodule
