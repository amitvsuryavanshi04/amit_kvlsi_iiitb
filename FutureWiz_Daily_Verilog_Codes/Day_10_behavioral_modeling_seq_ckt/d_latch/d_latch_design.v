module dlatch(d,clk,rst,q);
	input d,clk,rst;
	output reg q;
		always @(d,clk,rst) begin
			if (clk)
				if(rst)
				q <= 1'b0;
				else
				q <= d;
				else
				q <= q;
		end
endmodule