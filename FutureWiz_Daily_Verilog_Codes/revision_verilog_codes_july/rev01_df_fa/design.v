//dataflow code for full adder 
module df_full_adder(input a,b,c, output sum,cout);
	assign sum = a ^ b ^ c;
	assign cout = (a & b ) | (b & c) | (c & a);
endmodule 
