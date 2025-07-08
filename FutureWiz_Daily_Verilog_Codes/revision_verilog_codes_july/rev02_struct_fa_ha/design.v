`include "/home/amit_fesn/coding_verilog/struct_fa_ha/half_add.v"
module full_add(input a, b, cin, output sum, cout);
	wire sum1, carry1, carry2;
	//declare the instances of the 
	half_add ha1(.a(a),.b(b),.sum(sum1),.carry(carry1));
	half_add ha2(.a(sum1),.b(cin),.sum(sum),.carry(carry2));
	or o1(cout,carry2,carry1);
endmodule
