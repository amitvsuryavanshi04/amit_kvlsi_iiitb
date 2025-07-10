//module code for half substractor 
module half_substractor(input A,B , output Diff, Borrow);
	assign Diff = A ^ B;
	assign Borrow = (~A) & B;
endmodule 
