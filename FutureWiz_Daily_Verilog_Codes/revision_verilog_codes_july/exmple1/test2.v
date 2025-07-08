module test2;
integer a;
	initial begin
	
	a = 1;
	$display("@@@@ a = %0d",a);
	a <= 2;
	
	$strobe("#### a =%0d",a);
	end
endmodule
	
