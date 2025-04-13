// Structural Verilog for a 4-bit Magnitude Comparator
module magnitude_comparator (
    input [3:0] A,  // 4-bit Input A
    input [3:0] B,  // 4-bit Input B
    output A_gt_B,  // Output: A Greater than B
    output A_lt_B,  // Output: A Less than B
    output A_eq_B   // Output: A Equal to B
);

    wire [3:0] x;  // Intermediate XNOR results

    // XNOR gates to generate x[i] = A(i) XNOR B(i)
    xnor (x[3], A[3], B[3]);
    xnor (x[2], A[2], B[2]);
    xnor (x[1], A[1], B[1]);
    xnor (x[0], A[0], B[0]);

    // Wires for different terms
    wire term1, term2, term3, term4;
    wire term5, term6, term7, term8;

    // Logic for A_gt_B (A > B)
    and (term1, A[3], ~B[3]);
    and (term2, x[3], A[2], ~B[2]);
    and (term3, x[3], x[2], A[1], ~B[1]);
    and (term4, x[3], x[2], x[1], A[0], ~B[0]);
    or (A_gt_B, term1, term2, term3, term4);

    // Logic for A_lt_B (A < B)
    and (term5, ~A[3], B[3]);
    and (term6, x[3], ~A[2], B[2]);
    and (term7, x[3], x[2], ~A[1], B[1]);
    and (term8, x[3], x[2], x[1], ~A[0], B[0]);
    or (A_lt_B, term5, term6, term7, term8);

    // Logic for A_eq_B (A == B)
    and (A_eq_B, x[3], x[2], x[1], x[0]);

endmodule
