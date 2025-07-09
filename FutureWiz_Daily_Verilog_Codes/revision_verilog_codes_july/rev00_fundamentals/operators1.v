//code to show the operations of the various codes
module test_op1;
	reg[3:0] a,b;
	initial begin 
		//a = 1; b = 0;
		//$display("The and of two operands a: %0d , b: %0d is y:%0d",a,b,a&&b);
		//$display("The or of two operands a: %0d , b: %0d is y:%0d",a,b,a||b);
		//$display("The not of 'a' operand a: %0d is y:%0d",a,~a);
		//$display("The or of two operands a: %0d , b: %0d is y:%0d",a,b,a||b);
		
		//to show the difference between the logical equality and case equality
		a = 4'b010; b = 4'b010x;
		$display("The '==' of two operands a: %b , b: %b is y:%b",a,b,a==b);
		a = 4'b010x; b = 4'b01z0;
		$display("The '==' of two operands a: %b , b: %b is y:%b",a,b,a==b);
		a = 4'b010x; b = 4'b01z0;
		$display("The '===' of two operands a: %b , b: %b is y:%b",a,b,a===b);
		a = 4'b0101;b = 4'b0101;
		$display("The '==' of two operands a: %b , b: %b is y:%b",a,b,a==b);
		$display("The '===' of two operands a: %b , b: %b is y:%b",a,b,a===b);
		a = 4'b0x01; b = 4'b0x01;
		$display("The '==' of two operands a: %b , b: %b is y:%b",a,b,a==b);
		$display("The '===' of two operands a: %b , b: %b is y:%b",a,b,a===b);
		a = 4'b0z01; b = 4'b0x01;
		$display("The '==' of two operands a: %b , b: %b is y:%b",a,b,a==b);
		$display("The '===' of two operands a: %b , b: %b is y:%b",a,b,a===b);
		a = 4'b0x01; b = 4'b0z01;
		$display("The '==' of two operands a: %b , b: %b is y:%b",a,b,a==b);
		$display("The '===' of two operands a: %b , b: %b is y:%b",a,b,a===b);
		a = 4'b0z01; b = 4'b0z01;
		$display("The '==' of two operands a: %b , b: %b is y:%b",a,b,a==b);
		$display("The '===' of two operands a: %b , b: %b is y:%b",a,b,a===b);
	end
endmodule
