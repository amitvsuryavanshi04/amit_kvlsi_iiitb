`include "full_adder_gate_level.v"
module rca_using_full_adder(a,b,sum,cin,cout);
	input [3:0]a;
	input [3:0]b;
	input cin;
	output [3:0]sum;
	wire [2:0]c;
	output cout;
	
	fa_gate_level fa0(.a(a[0]),.b(b[0]),.c(cin),.sum(sum[0]),.carry(c[0]));
	fa_gate_level fa1(.a(a[1]),.b(b[1]),.c(c[0]),.sum(sum[1]),.carry(c[1]));
	fa_gate_level fa2(.a(a[2]),.b(b[2]),.c(c[1]),.sum(sum[2]),.carry(c[2]));
	fa_gate_level fa3(.a(a[3]),.b(b[3]),.c(c[2]),.sum(sum[3]),.carry(cout));
endmodule