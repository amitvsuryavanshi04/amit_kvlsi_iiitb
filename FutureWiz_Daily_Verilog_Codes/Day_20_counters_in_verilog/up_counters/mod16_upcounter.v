module m16_counter(clk , count , rst);
 input clk,rst;
 output reg [3:0]count;
 reg [3:0]temp;
  
 always @( posedge clk) begin
   if (rst)
     temp<=4'b0000;
   else 
     temp<= temp+1;
 
 count <= temp ;
end
endmodule

//testbench code
//`timescale 1ns/1ps

module tb_m16_counter;

  // Inputs
  reg clk;
  reg rst;

  // Outputs
  wire [3:0] count;

  // Instantiate the Unit Under Test (UUT)
  m16_counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  // Clock generation: 10ns period (100MHz)
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test stimulus
  initial begin
    // Initialize reset
    rst = 1;
    #12;
    rst = 0;

    // Let the counter run for some time
    #100;

    // Apply another reset
    rst = 1;
    #10;
    rst = 0;

    // Run a bit more
    #50;

    $finish;
  end

  // Monitor output
  initial begin
    $monitor("Time = %0t | rst = %b | count = %b", $time, rst, count);
  end

endmodule
