//---------------------------------------------------------------
// Half-Adder (ha)
//---------------------------------------------------------------
module ha (
    input  [1:0] i,   // i[1] = A, i[0] = B
    output       s,   // Sum
    output       c    // Carry
);
    assign s = i[1] ^ i[0];
    assign c = i[1] & i[0];
endmodule

//---------------------------------------------------------------
// Full-Adder (fa) – built from two half-adders
//---------------------------------------------------------------
module fa (
    input  A, B, Cin,
    output Sum, Cout
);
    wire s1, c1, c2;

    // First half-adder: A + B
    ha ha1 (
        .i({A, B}),
        .s(s1),
        .c(c1)
    );

    // Second half-adder: s1 + Cin
    ha ha2 (
        .i({s1, Cin}),
        .s(Sum),
        .c(c2)
    );

    // Final carry
    assign Cout = c1 | c2;
endmodule

//---------------------------------------------------------------
// Self-Checking Testbench with Scoreboard (tb)
//---------------------------------------------------------------
module tb;

    reg  A, B, Cin;
    wire Sum, Cout;

    integer total_tests = 0;
    integer passed_tests = 0;
	integer i;

    // Instantiate full-adder
    fa uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    // Expected outputs
    reg expected_sum, expected_cout;

    initial begin
        $display("A B Cin | Sum Cout | ExpSum ExpCout | Result");
        $display("------------------------------------------------");

        // Exhaustive stimulus for 1-bit full adder (8 combos)
        for ( i = 0; i < 8; i = i + 1) begin
            {A, B, Cin} = i[2:0];
            #1;  // allow signals to settle

            {expected_cout, expected_sum} = A + B + Cin;

            total_tests = total_tests + 1;
            if (Sum === expected_sum && Cout === expected_cout) begin
                passed_tests = passed_tests + 1;
                $display("%b %b  %b  |  %b    %b   |    %b       %b   | PASS",
                         A, B, Cin, Sum, Cout, expected_sum, expected_cout);
            end else begin
                $display("%b %b  %b  |  %b    %b   |    %b       %b   | FAIL",
                         A, B, Cin, Sum, Cout, expected_sum, expected_cout);
            end
        end

        $display("------------------------------------------------");
        $display("SCOREBOARD: %0d / %0d tests passed.", passed_tests, total_tests);
        if (passed_tests == total_tests)
            $display("✅ ALL TESTS PASSED");
        else
            $display("❌ SOME TESTS FAILED");

        $finish;
    end

endmodule

