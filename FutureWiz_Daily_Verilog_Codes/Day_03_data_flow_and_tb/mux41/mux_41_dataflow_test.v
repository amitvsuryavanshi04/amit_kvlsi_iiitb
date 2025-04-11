// Code your testbench here
// or browse Examples
module tb_mux41_gate;
    reg [3:0] i;
    reg [1:0] s;
    wire y;
    
    // Instantiate the MUX 4:1 module
    mux41_gate uut (.i(i),.s(s),.y(y));
    
    // Test stimulus
    initial begin
        // Monitor values
        $monitor("Time = %0t | i = %b | s = %b | y = %b", $time, i, s, y);
        
        // Apply test cases
        i = 4'b0; s = 2'b00; #10;
        i = 4'b1; s = 2'b01; #10;
        i = 4'b10; s = 2'b10; #10;
        i = 4'b11; s = 2'b11; #10;
    end
    initial begin 
      $dumpfile("dump_mux41.vcd");
      $dumpvars(1,tb_mux41_gate);
    end
    endmodule
