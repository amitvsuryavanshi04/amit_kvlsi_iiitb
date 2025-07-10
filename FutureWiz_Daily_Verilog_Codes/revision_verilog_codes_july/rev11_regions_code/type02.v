//blocking vs non blocking type2

module  test_typ2;
	integer a = 10,b = 20, c = 30,d = 40;
	
	//blocking statements
	/*initial begin 
		b = a;
		c = b;
		d = c;
	$display("The values of when blocking statements are used.");
	$display("a: %0d, b: %0d, c: %0d, d: %0d.",a,b,c,d);
	end*/
	
	//non- blocking statements
	initial begin 
		b <= a;
		c <= b;
		d <= c;
	$display("The values of when non-blocking statements are used.");
	$display("a: %0d, b: %0d, c: %0d, d: %0d.",a,b,c,d);
	end
endmodule
