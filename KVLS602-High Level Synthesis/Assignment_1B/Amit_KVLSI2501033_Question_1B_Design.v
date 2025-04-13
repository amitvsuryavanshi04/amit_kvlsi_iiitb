//////////////////////////////////////////////////////////////////////////////////
// Name: Amit 
// Roll No: KVLSI2501033
// Training Institute: IIIT-Bengaluru
// College:- Govt. S.K.S.J Technological Institute
// Create Date: 13.04.2025 10:25:53
// Design Name: Testbench code for f = w1!w3! + w1w3 + w2w3 + w1w2 using figure P4.1
// Module Name: top_module (Design Module
// Project Name: Amit_KVLSI2501033_Question_1B
// Target Devices: Simulated device in Xilinx Vivado
// Tool Versions: 2024.2
// 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module top_module(
    input wire w3,     // dynamic input for or1
    input wire w2, w1, // inputs for mux logic
    output reg f       // final output
);

    // Internal signals
    reg a0, a1, a2;

    // Constants
    wire b = 1'b0;     // constant 0
    wire i0 = 1'b1;    // constant 1

    // or1 logic (with b = 0)
    always @ (w3) begin
        if (w3 == 1'b0 && b == 1'b0)
            a0 = 1'b0;
        else
            a0 = w3;
    end

    // mx1 logic (with i0 = 1)
    always @ (w2 or w1) begin
        if (w1)
            a1 = w2;
        else
            a1 = i0;
    end

    // mx2 logic
    always @ (w2 or w1) begin
        if (w1)
            a2 = w1;
        else
            a2 = w2;
    end

    // mx3 logic (kept as you wrote it)
    always @ (a0 or a1 or a2) begin
        if (a0)
            f = a2;
        else
            f = a1;
    end

endmodule
