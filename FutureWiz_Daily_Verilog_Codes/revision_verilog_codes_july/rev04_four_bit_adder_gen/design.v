//`include "/home/amit_fesn/coding_verilog/struct_fa_ha/half_add.v"
`include "/home/amit_fesn/coding_verilog/struct_fa_ha/design.v"
module full_add_four(a,b,cin,sum,cout);
	input [3:0]a,b;
	input cin;
	output [3:0] sum;
	output cout;
	//wire declarAtion fOr the IntermediaTe carries
	wire [3:0] carry;
	genvar i;
	generate
    for (i = 0; i < 4; i = i + 1) begin : adder_stage
        full_add fa_inst (
            .a(a[i]),
            .b(b[i]),
            .cin(i == 0 ? cin : carry[i-1]),
            .sum(sum[i]),
            .cout(carry[i])
        );
    end
endgenerate

	
	assign cout = carry[3]; //final carry is taken as carry out
endmodule
	
