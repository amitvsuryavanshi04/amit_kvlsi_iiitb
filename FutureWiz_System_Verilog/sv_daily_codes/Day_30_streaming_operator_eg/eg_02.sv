	module stream_pack_lsb;
	  byte a = 8'h11, b = 8'h22, c = 8'h33, d = 8'h44;
	  int result;

	  initial begin
		result = {>>{a, b, c, d}};
		$display("Packed (LSB-first): 0x%0h", result); // Expect: 0x44332211
	  end
	endmodule
