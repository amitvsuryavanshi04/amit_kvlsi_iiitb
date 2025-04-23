module dff_design(d,clk,rst,q);
input d,clk,rst;
output reg q;
always @(posedge clk)
	begin
	if(rst) //checks rst
	q<=1'b0;
	else
	q<=d;
end
endmodule