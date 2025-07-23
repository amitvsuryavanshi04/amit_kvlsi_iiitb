//Build a circuit, has one 3-bit input, then outputs the same vector 
//and also splits it into three separate 1-bit outputs. Connect output 
//o0 to the input vector's position 0, o1 to position 1, etc. 

//answer 
module top_module ( 
    input wire [2:0] vec,
    output wire [2:0] outv,
    output wire o2,
    output wire o1,
    output wire o0  ); // Module body starts after module declaration
	//assigning the input vector to the output vector using the assign 
	//statement 
	assign outv = vec;
    assign o0 = outv[0]; //asssignment of the each bit to the wires 
    assign o1 = outv[1]; //o0,o1,o2 wires for the bit outv[0],1,2 resp
    assign o2 = outv[2];
endmodule

