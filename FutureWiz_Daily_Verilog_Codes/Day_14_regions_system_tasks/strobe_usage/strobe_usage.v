module test_strobe;
	reg [3:0] a,b;
	initial begin
		a= 4'hA; b= 4'h9;
		#5 a= 4'h1;
		$display("Display: Sim Time=%t, a=%h b= %h", $time,a,b);
		$strobe("Strobe: Sim Time=%t, a=%h b= %h", $time,a,b);
		b= 4'h1;
	end
endmodule

