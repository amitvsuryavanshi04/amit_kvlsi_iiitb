//create a module that implements NOR gate functionality
module top_module( 
    input a, 
    input b, 
    output out );
    nor n1(out,a,b);
endmodule
