// Code your design here
`timescale 1ns / 1ps

module washing_machine (
    input wire clk,
    input wire reset,
    input wire start,
    output reg [2:0] state_out,
    output reg beep
);

    // State Encoding
    parameter IDLE  = 3'd0,
              FILL  = 3'd1,
              WASH  = 3'd2,
              RINSE = 3'd3,
              DRAIN = 3'd4,
              SPIN  = 3'd5,
              DONE  = 3'd6;

    reg [2:0] state, next_state;
    reg [15:0] timer;

    // Duration Constants (in seconds)
    parameter FILL_TIME  = 2 * 60;
    parameter WASH_TIME  = 20 * 60;
    parameter RINSE_TIME = 10 * 60;
    parameter DRAIN_TIME = 3 * 60;
    parameter SPIN_TIME  = 5 * 60;
    parameter DONE_TIME  = 30;

    // State Register
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            timer <= 0;
        end else begin
            state <= next_state;
            if (state != next_state)
                timer <= 0;
            else
                timer <= timer + 1;
        end
    end

    // Output and Next State Logic
    always @(*) begin
        next_state = state;
        beep = 0;

        case (state)
            IDLE: begin
                if (start)
                    next_state = FILL;
            end

            FILL: begin
                if (timer >= FILL_TIME)
                    next_state = WASH;
            end

            WASH: begin
                if (timer >= WASH_TIME)
                    next_state = RINSE;
            end

            RINSE: begin
                if (timer >= RINSE_TIME)
                    next_state = DRAIN;
            end

            DRAIN: begin
                if (timer >= DRAIN_TIME)
                    next_state = SPIN;
            end

            SPIN: begin
                if (timer >= SPIN_TIME)
                    next_state = DONE;
            end

            DONE: begin
                beep = 1;
                if (timer >= DONE_TIME)
                    next_state = IDLE;
            end

            default: next_state = IDLE;
        endcase
    end

    // For monitoring state externally
    always @(posedge clk) begin
        state_out <= state;
    end

endmodule
