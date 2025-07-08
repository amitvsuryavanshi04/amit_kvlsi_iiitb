module test3;
reg a;
	initial begin
	#1 a = 1;
	$display("The value of a = %0d in active region",a);
	a = 0;
	#0 $display("The value of a in inactive region= %0d",a);
	
	end
endmodule 

