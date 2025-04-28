module tb_jk_latch_sync_reset;
    reg j, k, clk, reset;
    wire q;

    jk_latch_sync_reset uut(j, k, clk, reset, q);
  initial begin
        $dumpfile("jk_latch_sync_reset.vcd");
        $dumpvars(0, tb_jk_latch_sync_reset);
    end

    initial begin
        clk = 0;
      #100 $finish;
    end
        always #5 clk = ~clk;  // 10ns period
 

    initial begin
        $monitor("At time %0t: j=%b k=%b reset=%b q=%b", $time, j, k, reset, q);
        reset = 1; j = 0; k = 0; #10;
        reset = 0; j = 1; k = 0; #10;
        j = 0; k = 1; #10;
        j = 1; k = 1; #10;
        j = 0; k = 0; #10;
        reset = 1; #10;
    end
endmodule
