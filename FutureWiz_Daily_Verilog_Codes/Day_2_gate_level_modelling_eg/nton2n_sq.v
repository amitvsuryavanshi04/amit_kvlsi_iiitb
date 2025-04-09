module sq_gene(d,i);
    input [1:0]i;
    output [3:0]d;
    wire w1; //intermediate signal
    not n1(w1,i[0]);
    buf b1(d[0],i[0]);
    buf b2(d[1],0);
    and a1(d[2],w1,i[1]);
    and a2(d[3],i[1],i[0]);
endmodule
    