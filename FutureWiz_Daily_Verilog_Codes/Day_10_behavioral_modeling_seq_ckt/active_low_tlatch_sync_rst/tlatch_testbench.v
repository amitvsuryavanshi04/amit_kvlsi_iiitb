module tb_tlatch;
    reg t, clk, rst;
    wire q;

    tlatch uut (t, clk, rst, q);

    initial begin
        // Initial values
        t = 0; clk = 0; rst = 1;

        #5  rst = 0; // De-assert reset
        #5  t = 1; clk = 0; #5 clk = 1;
        #5  clk = 0; #5 clk = 1;
        #5  t = 0; clk = 0; #5 clk = 1;
        #5  t = 1; clk = 0; #5 clk = 1;

        #10 $finish;
    end

    initial begin
        $monitor("Time=%0t | t=%b clk=%b rst=%b => q=%b", $time, t, clk, rst, q);
    end
endmodule
