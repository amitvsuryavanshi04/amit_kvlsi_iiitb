//given situation : there are four outputs named as w,x,y, and z and there are three
//input variables a,b,c such that they are assigned in the below 
//a - > w, b -> x, b ->y and c -> z
module top_module (
	input a,
	input b,
	input c,
	output w,
	output x,
	output y,
	output z  );
	
	assign w = a;
	assign x = b;
	assign y = b;
	assign z = c;

	// If we're certain about the width of each signal, using 
	// the concatenation operator is equivalent and shorter:
	// assign {w,x,y,z} = {a,b,b,c};
	
endmodule 
