module mux3_ter(a,sel,y);
	input [2:0]a;
	input [1:0]sel;
	output y;
	
	assign y = sel[1] ?(sel[0] ? 1'b0 : a[2]) : (sel[0] ? (a[1]) : a[0]);
endmodule 
