//method-1 using always block
module clk_gen_always;
 reg clk;
 always #5 clk = ~clk;
 initial begin
 clk = 0;
 $monitor("Time=%0t | clk=%b", $time, clk);
 #50 $finish;
 end
endmodule
//method-2 using initial and forever
module clk_gen_forever;
 reg clk;
 initial begin
 clk = 0;
 forever #10 clk = ~clk;
 end
 initial begin
 $monitor("Time=%0t | clk=%b", $time, clk);
 #100 $finish;
 end
endmodule
//method-3 using for loop
module clk_gen_for;
 reg clk;
 integer i;
 initial begin
 clk = 0;
 for (i = 0; i < 10; i = i + 1) begin
 #15 clk = ~clk;
 end
 end
 initial begin
 $monitor("Time=%0t | clk=%b", $time, clk);
 #160 $finish;
 end
endmodule
//method-4 using repeat statement
module clk_gen_repeat;
 reg clk;
 initial begin
 clk = 0;
 repeat (10) begin
 #7 clk = ~clk;
 end
 end
 initial begin
 $monitor("Time=%0t | clk=%b", $time, clk);
 #100 $finish;
 end
endmodule
