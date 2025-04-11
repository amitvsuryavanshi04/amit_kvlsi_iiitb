module decoder2_4(i,d);
	input [1:0]i; //declaring the input vector
	output [3:0]d; // declaring the output vector

	//intermediate signals
	wire w1,w0;

	//output signals
	not n1(w1,i[1]);
	not n2(w0,i[0]);
	and a1(d[0],w1,w0);
	and a2(d[1],w1,i[0]);
	and a3(d[2],w2,i[1]);
	and a4(d[3],i[1],i[0]);
endmodule