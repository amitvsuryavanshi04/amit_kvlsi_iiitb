module my_prio_enc(d,i);
	input [3:0]d;
	output [1:0]i;
	wire w0,w1;
	not n1(w0,d[2]);
	and a1(w1,w0,d[1]);
	or o1(i[0],w1,d[2]);
	or o2(i[1],d[3],d[2]);
endmodule 
