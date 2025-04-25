
module test;

  reg clk, rst;
  wire [2:0] count;

  gradual_counter dut(clk, rst, count);

  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;

    #200 $finish;
  end

  always #5 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1, test);
  end
endmodule
