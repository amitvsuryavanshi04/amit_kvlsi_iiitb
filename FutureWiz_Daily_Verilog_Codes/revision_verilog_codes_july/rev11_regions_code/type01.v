//blocking vs non blocking statements 
module test_typ1;
	integer a = 10,b = 20;
	//running of two initial blocks 
	/*initial a = b;
	initial b = a;
	initial begin
	$display("The values of a:%0d, b:%0d using blocking assignments.",a,b);
	end*/
	
	initial a <= b;
	initial b <= a;
	initial begin
	$display("The values of a:%0d, b:%0d using non-blocking assignments.",a,b);
	end
endmodule 
	
