`timescale 1ns/1ps

module clk_gen_all_methods;

  // Method 1: always block
  reg clk_m1;

  always #5 clk_m1 = ~clk_m1;

  initial begin
    clk_m1 = 0;
  end

  // Method 2: initial + forever
  reg clk_m2;

  initial begin
    clk_m2 = 0;
    forever #10 clk_m2 = ~clk_m2;
  end

  // Method 3: for loop
  reg clk_m3;
  integer i;

  initial begin
    clk_m3 = 0;
    for (i = 0; i < 10; i = i + 1) begin
      #15 clk_m3 = ~clk_m3;
    end
  end

  // Method 4: repeat
  reg clk_m4;

  initial begin
    clk_m4 = 0;
    repeat (10) begin
      #7 clk_m4 = ~clk_m4;
    end
  end

  // Common monitor and simulation control
  initial begin
    $display("Comparing different clock generation methods");
    $monitor("Time=%0t | clk_m1=%b | clk_m2=%b | clk_m3=%b | clk_m4=%b",
             $time, clk_m1, clk_m2, clk_m3, clk_m4);

    $dumpfile("wave.vcd");
    $dumpvars(0, clk_gen_all_methods);

    #200 $finish;  // Enough time to view all clocks
  end

endmodule
