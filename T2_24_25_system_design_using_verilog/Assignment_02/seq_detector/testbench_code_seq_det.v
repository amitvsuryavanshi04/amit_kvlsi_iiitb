`timescale 1ns / 1ps

module sequence_detector_tb;

    reg clk;
    reg reset;
    reg din;
    wire detected;

    // Instantiate the DUT (Device Under Test)
    sequence_detector uut (
        .clk(clk),
        .reset(reset),
        .din(din),
        .detected(detected)
    );

    // Clock generation (10ns period)
    initial clk = 0;
    always #5 clk = ~clk;

    // Bitstream that contains all 3 target sequences
    reg [7:0] seq_data = 8'b01011001;  // Contains 01011, 1100, and 11001
    integer i;

    initial begin
        // Setup for waveform dump
        $dumpfile("sequence_detector.vcd");
        $dumpvars(0, sequence_detector_tb);

        $display("Time\tClk\tReset\tInput\tDetected");
        $monitor("%0dns\t%b\t%b\t%b\t%b", $time, clk, reset, din, detected);

        // Apply reset
        reset = 1;
        din = 0;
        #12;
        reset = 0;

        // Feed input data bit-by-bit (MSB first)
        for (i = 7; i >= 0; i = i - 1) begin
            din = seq_data[i];
            #10;
        end

        #20;
        $finish;
    end

endmodule
