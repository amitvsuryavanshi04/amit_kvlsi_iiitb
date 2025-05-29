`timescale 1ns / 1ns

module washing_machine_tb;

    reg clk;
    reg reset;
    reg start;
    wire [2:0] state_out;
    wire beep;

    // Instantiate the DUT
    washing_machine uut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .state_out(state_out),
        .beep(beep)
    );

    // Simulated Clock: 1kHz → 1ms period (1 real second ≈ 1ms)
    initial clk = 0;
    always #500 clk = ~clk;  // 1ms total cycle

    // Function to map state names
    function [79:0] get_state_name;
        input [2:0] state;
        case (state)
            3'd0: get_state_name = "IDLE ";
            3'd1: get_state_name = "FILL ";
            3'd2: get_state_name = "WASH ";
            3'd3: get_state_name = "RINSE";
            3'd4: get_state_name = "DRAIN";
            3'd5: get_state_name = "SPIN ";
            3'd6: get_state_name = "DONE ";
            default: get_state_name = "UNDEF";
        endcase
    endfunction

    integer i;

    initial begin
        // Dump for waveform
        $dumpfile("washing_machine.vcd");
        $dumpvars(0, washing_machine_tb);

        $display("Time(ns)\tClk\tReset\tStart\tState\tBeep");
        $monitor("%0dns\t%b\t%b\t%b\t%s\t%b", $time, clk, reset, start, get_state_name(state_out), beep);

        // Initial state
        reset = 1;
        start = 0;

        #1000;   // Hold reset for 1ms
        reset = 0;

        #1000;   // Wait 1ms
        start = 1;

        #1000;   // Hold start high
        start = 0;

        // Simulate 2500 ms = 2500 simulated "real seconds"
        for (i = 0; i < 2500; i = i + 1)
            #1000;  // Wait 1ms = 1 second of simulated time

        $finish;
    end

endmodule
