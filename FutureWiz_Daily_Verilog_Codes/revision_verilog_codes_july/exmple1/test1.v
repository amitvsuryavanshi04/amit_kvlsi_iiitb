module test;
	integer a;
	
	initial begin
		$strobe("@@@@ %0d",a);
		a = 1;
		a <= 2;
		$display("#### %0d",a);
		end
endmodule
		
