module mux21(input i0,i1,s,output reg y);
	always @(i0,i1,s)
		begin
			y = (s) ? i1 : i0;
		end
endmodule 