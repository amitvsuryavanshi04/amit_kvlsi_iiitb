//xor using nand gate primitives
module xnp(a,b,y);
    input a,b;
    output y;
    wire w1,w2,w3; //intermediate signals 
    nand n1(w1,a,b); //nand stages for the different
    nand n2(w2,w1,a); //nand implementation for making xor gate.
    nand n3(w3,w1,b);
    nand n4(y,w2,w3);
endmodule