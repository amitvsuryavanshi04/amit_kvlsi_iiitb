`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: FutureWiz
// Student : Amit KVLSI2501033 
// 
// Create Date: 10.05.2025 08:31:52
// Design Name: RadixSMCU_top
// Module Name: RadixSMCU_top
// Project Name: Radix 2/4/8 SISO Decoder for Turbo Decoding
// Target Devices: Simulation device
// Tool Versions: 2024.2
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module Radix_SMCU_Top (
    input  wire [1:0] sel, // {sel1, sel0}
    input  wire signed [7:0] alpha0, alpha1, alpha2, alpha3, alpha4, alpha5, alpha6, alpha7,
    input  wire signed [7:0] gamma0, gamma1, gamma2, gamma3, gamma4, gamma5, gamma6, gamma7,
    output wire signed [7:0] alpha_out
);

    wire signed [7:0] rad2_out, rad4_out, rad8_out;

    // Radix-2 SMCU instantiation
    Rad2_SMCU rad2 (
        .alpha1(alpha0),
        .gamma1(gamma0),
        .gamma2(gamma1),
        .alpha_out(rad2_out)
    );

    // Radix-4 SMCU instantiation
    Rad4_SMCU rad4 (
        .alpha1(alpha1),
        .gamma1(gamma2),
        .gamma2(gamma3),
        .gamma3(gamma4),
        .gamma4(gamma5),
        .alpha_out(rad4_out)
    );

    // Radix-8 SMCU: two Rad4 blocks
    wire signed [7:0] rad4_1_out, rad4_2_out;

    Rad4_SMCU rad8_1 (
        .alpha1(alpha2),
        .gamma1(gamma0),
        .gamma2(gamma1),
        .gamma3(gamma2),
        .gamma4(gamma3),
        .alpha_out(rad4_1_out)
    );

    Rad4_SMCU rad8_2 (
        .alpha1(alpha3),
        .gamma1(gamma4),
        .gamma2(gamma5),
        .gamma3(gamma6),
        .gamma4(gamma7),
        .alpha_out(rad4_2_out)
    );

    assign rad8_out = (rad4_1_out < rad4_2_out) ? rad4_1_out : rad4_2_out;

    // Output selector
    assign alpha_out = (sel == 2'b10) ? rad8_out :   // sel1=1, sel0=0 → Radix-8
                       (sel == 2'b00) ? rad4_out :   // sel1=0, sel0=0 → Radix-4
                       rad2_out;                    // otherwise Radix-2

endmodule

// ==========================
// Submodule: Rad2_SMCU
// ==========================
module Rad2_SMCU (
    input  wire signed [7:0] alpha1, gamma1, gamma2,
    output wire signed [7:0] alpha_out
);
    wire signed [7:0] sum1, sum2;

    assign sum1 = alpha1 + gamma1;
    assign sum2 = alpha1 + gamma2;

    assign alpha_out = (sum1 < sum2) ? sum1 : sum2;
endmodule

// ==========================
// Submodule: Rad4_SMCU
// ==========================
module Rad4_SMCU (
    input  wire signed [7:0] alpha1, gamma1, gamma2, gamma3,
    input  wire signed [7:0] gamma4,
    output wire signed [7:0] alpha_out
);
    wire signed [7:0] out1, out2;

    Rad2_SMCU smcu1 (
        .alpha1(alpha1),
        .gamma1(gamma1),
        .gamma2(gamma2),
        .alpha_out(out1)
    );

    Rad2_SMCU smcu2 (
        .alpha1(alpha1),
        .gamma1(gamma3),
        .gamma2(gamma4),
        .alpha_out(out2)
    );

    assign alpha_out = (out1 < out2) ? out1 : out2;
endmodule

