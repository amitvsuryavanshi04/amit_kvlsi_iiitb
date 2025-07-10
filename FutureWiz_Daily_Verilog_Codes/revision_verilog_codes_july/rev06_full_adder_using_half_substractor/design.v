//design code for full adder using half substractor 
//declaration of the module with the inputs and outputs ports

//include the half substractor file to reuse the half substractor module 
//`include "half_sub.v"
/*module full_adder_using_half_substractors(input A,B,Cin, output Sum,Cout);
	wire Diff1, Borrow1, Borrow2;
	
	//half substractor 1 instantiation
	half_substarctor HS1(.A(A),.B(B),.Diff(Diff1),.Borrow(Borrow1));
	//half substractor 2 instantiation
	half_substarctor HS2 (.A(Diff1),.B(Cin),.Diff(Sum),.Borrow(Borrow2));
	
	//Carry out is the ORed result of the both borrow1 and borrow2 
	assign Cout = Borrow1 | Borrow2;
endmodule*/ 


/*module full_adder_using_half_substractors (
    input A, B, Cin,
    output Sum, Cout
);
    wire Diff1, Borrow1, Borrow2;

    // First half subtractor
    half_substractor HS1 (
        .A(A),
        .B(B),
        .Diff(Diff1),
        .Borrow(Borrow1)
    );

    // Second half subtractor
    half_substractor HS2 (
        .A(Diff1),
        .B(Cin),
        .Diff(Sum),
        .Borrow(Borrow2)
    );

    // Carry Out is OR of both borrows
    assign Cout = Borrow1 | Borrow2;
endmodule*/

module full_adder_using_half_substractors (
    input  A, B, Cin,
    output Sum, Cout
);
    wire Diff1, Borrow1, Borrow2, AndAB;

    // First half subtractor (XOR + borrow)
    half_substractor HS1 (
        .A(A), .B(B),
        .Diff(Diff1), .Borrow(Borrow1)
    );

    // Second half subtractor (XOR with Cin)
    half_substractor HS2 (
        .A(Diff1), .B(Cin),
        .Diff(Sum), .Borrow(Borrow2)
    );

    // New AND gate for A and B
    assign AndAB = A & B;
    
    // Correct carry-out logic
    assign Cout = AndAB | Borrow2;

endmodule

module half_substractor (
    input A, B,
    output Diff, Borrow
);
    assign Diff = A ^ B;
    assign Borrow = (~A) & B;
endmodule


