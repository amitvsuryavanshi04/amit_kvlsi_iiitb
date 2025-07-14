// Single-Port Block RAM No-Change Mode
// File: rams_sp_nc.v

module rams_sp_nc (clk, we, en, addr, di, dout);

	input clk;
	input we;
	input en;
	input [9:0] addr; //address 10 bit 
	input [15:0] di; //16 bit input 
	output [15:0] dout;// 16 output 

	reg [15:0] RAM [1023:0]; //declaration of the RAM memory 
	reg [15:0] dout;

		always @(posedge clk)
		begin
				if (en)
			begin
				if (we)
					RAM[addr] <= di;
				else
					dout <= RAM[addr];
			end
		end
endmodule
