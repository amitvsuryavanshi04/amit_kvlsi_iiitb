
//design a counter such that it counts from say 3 to 45 
module mod3_to_45_upcounter(count, clk, rst);
  input clk, rst;
  output [7:0] count;

  reg [7:0] temp; //the temporary variable used to make the rtl synthesizable code 

  always @(posedge clk) begin
    if (!rst)
      temp <= 8'd3; //assign the lower value here 
    else if (temp >= 8'd45) // assign the upper value 
      temp <= 8'd3;
    else
      temp <= temp + 1;
  end

  assign count = temp;

endmodule


//testbench code for the counter 
`timescale 1ns/1ps

module tb_mod3_to_45_upcounter;

  reg clk = 0;
  reg rst = 0;
  wire [7:0] count;

  mod3_to_45_upcounter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
  );

  always #5 clk = ~clk;

  initial begin
    rst = 0; #10;
    rst = 1; #400;
    rst = 0; #10;
    rst = 1; #100;
    $finish;
  end

  initial $monitor("Time=%0t | rst=%b | count=%d", $time, rst, count);

endmodule
