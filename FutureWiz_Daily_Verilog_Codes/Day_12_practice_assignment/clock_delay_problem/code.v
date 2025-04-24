module dual_clk_10ns_5ns_delay;
    reg clk1;
    reg clk2;

    // Dumpfile and Display Setup
    initial begin
        $dumpfile("dual_clk_10ns_5ns_delay.vcd");
        $dumpvars(0, dual_clk_10ns_5ns_delay);
        $display("Time\tclk1\tclk2");
        $monitor("%0t\t%b\t%b", $time, clk1, clk2);
        #100 $finish;
    end

    // Clock 1: 10ns period, 50% duty cycle
    initial begin
        clk1 = 0;
    end
        always #5 clk1 = ~clk1;
    // Clock 2: 10ns period, but delayed by 5ns relative to clk1
    initial begin
        #5 clk2 = 0;
    end // 5ns delay to phase shift clk2
        always #5 clk2 = ~clk2;

endmodule
