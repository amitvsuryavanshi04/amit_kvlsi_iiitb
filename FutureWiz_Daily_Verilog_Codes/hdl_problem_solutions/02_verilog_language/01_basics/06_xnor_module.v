//create a module that implements XNOR functionality
module top_module( 
    input a, 
    input b, 
    output out );
	assign out = ~(a ^ b); // 'target = ~(op1^op2)' line is used to implement XNOR functionality
endmodule
