//even parity generator verilog code for gate level modelling
module (a,b,c,y_even,y_odd);
    input a,b,c;
    output y_even,y_odd;
    wire w1,w2; //intermediate signals 
    //even parity generator
    xor x1(w1,a,b);
    xor x2(y_even,w1,c);
    //odd parity generator
    xnor xn1(w2,a,b);
    xnor xn2(y_odd,w2,c);

endmodule