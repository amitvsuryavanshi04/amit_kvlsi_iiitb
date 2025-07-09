//design a down, decrement counter which can go from 31 to 0 
module downcounter_5bit(clk,rst,count);
  input clk,rst;
  output [4:0] count;
  reg [4:0] temp;
  
  always@(posedge clk)
    begin
      if(rst)
        temp<=0;
      else
        temp<=temp-1;
    end
  
  assign count = temp; //!! the blocking assignment has to be done outside always block 
  
endmodule


//testbench code for the same down counter 
`timescale 1ns/1ps

module tb_downcounter_5bit;

  reg clk = 0;
  reg rst = 1;
  wire [4:0] count;

  downcounter_5bit uut (.clk(clk),.rst(rst),.count(count)); //module instantiation 

  always #5 clk = ~clk; //clock generation 

  initial begin
    #10 rst = 0; //value assignment
    #700 $finish;
  end

  initial $monitor("Time=%0t | rst=%b | count=%d", $time, rst, count);

endmodule
