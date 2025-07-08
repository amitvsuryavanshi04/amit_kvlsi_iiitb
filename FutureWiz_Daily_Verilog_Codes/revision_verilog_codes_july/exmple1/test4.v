module test4;
	integer a,b,c,d;
	initial begin 
		a = 10;
		b = 20;
		c = 30;
		
		b <= a;
		c <= b;
		d <= c;
		
		//b = a;
		//c = b;
		//d = c;
		//$display("The value of a: %0d, b = %0d, c = %0d , d = %0d",a,b,c,d);
		$strobe("The value of a: %0d, b = %0d, c = %0d , d = %0d",a,b,c,d);
		end
endmodule 
