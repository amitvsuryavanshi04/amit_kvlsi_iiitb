module tb_mux3_ter;
	reg [2:0]a;
	reg [1:0]sel;
	wire y;
	
	//instantiate the design module 
	mux3_ter dut (.a(a),.sel(sel),.y(y));
	initial begin
	a = 3'b010; sel = 2'b00; #1;
	$display("Sim time: [%0t] a: %0b, sel: %0b, y = %0b", $time, a, sel, y);

	#2 a = 3'b010; sel = 2'b01; #1;
	$display("Sim time: [%0t] a: %0b, sel: %0b, y = %0b", $time, a, sel, y);

	#2 a = 3'b010; sel = 2'b10; #1;
	$display("Sim time: [%0t] a: %0b, sel: %0b, y = %0b", $time, a, sel, y);

	#2 a = 3'b100; sel = 2'b11; #1;
	$display("Sim time: [%0t] a: %0b, sel: %0b, y = %0b", $time, a, sel, y);
end

	// $monitor ("Sim time: [%0t] a: %0b,sel: %0b, y = %0b",a,sel,y);
	 initial begin
		$dumpfile ("wave.vcd");
		$dumpvars(0,tb_mux3_ter);
		end
endmodule
	 
		
	
