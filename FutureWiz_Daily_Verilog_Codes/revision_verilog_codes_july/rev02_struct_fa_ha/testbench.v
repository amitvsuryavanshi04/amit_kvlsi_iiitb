module fa_struct_test;
	reg a,b,cin;
	wire sum,carry;
	full_add fa1(a,b,cin,sum,cout);
	//generation of the stimulus 
	initial begin
		a = 0; b = 0; cin = 0;
	#2 cin = 1;
	#2 b = 1; cin = 0;
	#2 b = 0; cin = 1;
	#2 b = 1; cin = 1;	
	#2 a = 1; b = 0; cin = 0;
	#2 cin = 1;
	#2 b = 1; cin = 0;
	#2 b = 0; cin = 1;
	#2 b = 1; cin = 1;
	#10; $finish;
	end
	initial begin
	$dumpfile("wave.vcd");
	$dumpvars(0,fa_struct_test);
	end
endmodule
