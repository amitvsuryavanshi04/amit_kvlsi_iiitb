//testbench code for the full adder using the half substractor 
module testbench;
    reg A, B, Cin;
    wire Sum, Cout;

	//main module instantiation
    full_adder_using_half_substractors FA (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        $display("A B Cin | Sum Cout");
        for (integer i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i;
            #1 $display("%b %b  %b  |  %b    %b", A, B, Cin, Sum, Cout);
        end
    end
    
    //dumping the output files in the wave.vcd file 
    initial begin 
		$dumpfile("wave.vcd");
		$dumpvars(0,testbench);
	end
	
endmodule

