module test_typ4;
	reg [7:0] a,b,c,d,e;
		initial begin
			a <= 8'h12;
			$display("The value for a: %0h, b: %0h, c: %0h, d: %0h, e: %0h @ %0t ns.",a,b,c,d,e,$time);
			b <= 8'h34;
			$display("The value for a: %0h, b: %0h, c: %0h, d: %0h, e: %0h @ %0t ns.",a,b,c,d,e,$time);
			c <= 8'h45;
			$display("The value for a: %0h, b: %0h, c: %0h, d: %0h, e: %0h @ %0t ns.",a,b,c,d,e,$time);
		end
		
		initial begin 
			#1 d <= 8'h56;
			$display("The value for a: %0h, b: %0h, c: %0h, d: %0h, e: %0h @ %0t ns.",a,b,c,d,e,$time);
			#2 e <= 8'h67;
			$display("The value for a: %0h, b: %0h, c: %0h, d: %0h, e: %0h @ %0t ns.",a,b,c,d,e,$time);
			#1 a <= 8'h0;
			$display("The value for a: %0h, b: %0h, c: %0h, d: %0h, e: %0h @ %0t ns.",a,b,c,d,e,$time);
		end
endmodule 
		
			 
