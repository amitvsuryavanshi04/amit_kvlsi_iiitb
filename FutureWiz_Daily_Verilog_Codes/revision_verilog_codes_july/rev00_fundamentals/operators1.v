//code to show the operations of the various codes
module test_op1;
	reg a,b;
	initial begin 
		a = 1; b = 0;
		$display("The and of two operands a: %0d , b: %0d is y:%0d"a,b,a&&b);
		
