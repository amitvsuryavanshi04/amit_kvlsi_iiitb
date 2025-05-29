// Code your design here
module sequence_detector (
    input clk,
    input reset,
    input din,
    output reg detected
);

    // State encoding using parameter
    parameter S0      = 4'd0,
              S1      = 4'd1,
              S11     = 4'd2,
              S110    = 4'd3,
              S1100   = 4'd4,
              S11001  = 4'd5,
              S01     = 4'd6,
              S010    = 4'd7,
              S0101   = 4'd8,
              S01011  = 4'd9;

    reg [3:0] current_state, next_state;

    // Sequential logic: state transition
    always @(posedge clk or posedge reset) begin
        if (reset)
            current_state <= S0;
        else
            current_state <= next_state;
    end

    // Combinational logic: next state and output
    always @(*) begin
        detected = 0;
        case (current_state)
            S0:      next_state = din ? S1 : S01;

            // 01011 detection path
            S01:     next_state = din ? S010 : S01;
            S010:    next_state = din ? S0101 : S0;
            S0101:   next_state = din ? S01011 : S01;
            S01011: begin
                detected = 1;                     // 01011 detected
                next_state = din ? S1 : S01;
            end

            // 1100 and 11001 detection path
            S1:      next_state = din ? S11 : S01;
            S11:     next_state = din ? S11 : S110;
            S110:    next_state = din ? S0101 : S1100;
            S1100: begin
                detected = 1;                     // 1100 detected
                next_state = din ? S11001 : S01;
            end
            S11001: begin
                detected = 1;                     // 11001 detected
                next_state = din ? S1 : S01;
            end

            default: next_state = S0;
        endcase
    end

endmodule
