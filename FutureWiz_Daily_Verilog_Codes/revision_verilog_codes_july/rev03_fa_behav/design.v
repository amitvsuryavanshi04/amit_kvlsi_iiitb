//full adder using behavioural modelling 
module full_add(a,b,cin,sum,cout);
	input a,b,cin;
	output reg sum,cout;
		
		//to write behavioural code use always block
		always @(a,b,cin) begin
			{cout,sum} = a + b + cin;
			end
endmodule 
