`timescale 1ns / 1ps

module magnitude_comparator_tb;
    reg [3:0] A, B;
    wire A_gt_B, A_lt_B, A_eq_B;

    // Instantiate the comparator module
    magnitude_comparator uut (
        .A(A),
        .B(B),
        .A_gt_B(A_gt_B),
        .A_lt_B(A_lt_B),
        .A_eq_B(A_eq_B)
    );

    initial begin
        $dumpfile("magnitude_comparator.vcd");  // Generates waveform dump
        $dumpvars(0, magnitude_comparator_tb);

        // Test Cases
        A = 4'b0000; B = 4'b0000; #10;  // A == B
        A = 4'b1010; B = 4'b1001; #10;  // A > B
        A = 4'b0110; B = 4'b0111; #10;  // A < B
        A = 4'b1111; B = 4'b1111; #10;  // A == B
        A = 4'b0101; B = 4'b1000; #10;  // A < B
        A = 4'b1100; B = 4'b1011; #10;  // A > B
        
        $finish;
    end

    initial begin
        $monitor("Time=%0t A=%b B=%b | A_gt_B=%b A_lt_B=%b A_eq_B=%b", 
                 $time, A, B, A_gt_B, A_lt_B, A_eq_B);
    end
endmodule
