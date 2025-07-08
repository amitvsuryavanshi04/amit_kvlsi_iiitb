`timescale 1ns/1ps
module df_fa_test;
	reg a,b,c;
	wire sum, cout;
	df_full_adder dut(.a(a),.b(b),.c(c),.sum(sum),.cout(cout));
	
	//assign the testing values
	initial begin
	
	$dumpfile("wave.vcd"); //dumpfile to store the output values
	$dumpvars(0,df_fa_test);
	
	a = 0; b = 0 ; c = 0; #2; //values are given after delay of 2 ns
	a = 0; b = 0 ; c = 1; #2;
	a = 0; b = 1 ; c = 0; #2;
	a = 0; b = 1 ; c = 1; #2;
	a = 1; b = 0 ; c = 0; #2;
	a = 1; b = 0 ; c = 1; #2;
	a = 1; b = 1 ; c = 0; #2;
	a = 1; b = 1 ; c = 1; #2;
	$finish ;
	end
	//viewing the values 
	initial begin
	$monitor ("Simtime : [%0t] value of a = %0b, b = %0b, c = %0b, sum = %0b , carry_out = %0b ",$time,a,b,c,sum,cout);
	end
	
endmodule
	
	
	/*Clock Generation
Latches and FFs !!!!
Combinational Circuits with all modeling Styles !!!!*/

	
