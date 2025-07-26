//question: Build a circuit that has two 3-bit inputs that computes 
//the bitwise-OR of the two vectors, the logical-OR of the two vectors,
// and the inverse (NOT) of both vectors. Place the inverse of b in the 
//upper half of out_not (i.e., bits [5:3]), and the inverse of a in the 
//lower half.


module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
);
    // Bitwise OR of a and b
    assign out_or_bitwise = a | b;

    // Logical OR: true if any bit in a or b is 1
    assign out_or_logical = |a | |b;

    // Inverse: top half is ~b, bottom half is ~a
    assign out_not = {~b, ~a};

endmodule
