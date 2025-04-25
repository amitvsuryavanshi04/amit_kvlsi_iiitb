module tb_up_counter_3bit;

    reg clk;
    reg reset_n;
    wire [2:0] count;

    // Instantiate the counter
    up_counter_3bit uut (
        .clk(clk),
        .reset_n(reset_n),
        .count(count)
    );

    // Clock generation: 10ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        $dumpfile("up_counter_3bit.vcd");   // VCD file name for waveform
        $dumpvars(, tb_up_counter_3bit);   // Dump all variables in this module
        $monitor("Time: %0t | Reset_n: %b | Count: %b", $time, reset_n, count);

        reset_n = 0;       // Apply reset
        #15;
        reset_n = 1;       // De-assert reset
        #100;

        reset_n = 0;       // Apply reset again
        #10;
        reset_n = 1;       // De-assert reset
        #50;

        $finish;
    end

endmodule
