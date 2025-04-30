//creation of the module for the full adder using dataflow.
module full_adder(a,b,cin,sum,cout); //declaration of module and I/O ports
	input a,b,cin;  	//input ports
	output sum,cout;	//output ports
	assign sum = a^b^cin; //expression for the sum
	assign cout = (a&b)|(b&cin)|(cin&a); //expression for the cout
endmodule