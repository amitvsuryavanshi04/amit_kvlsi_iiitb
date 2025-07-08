module tb_full_add_four;

    reg  [3:0] a, b;
    reg        cin;
    wire [3:0] sum;
    wire       cout;

    // Instantiate the 4-bit adder
    full_add_four uut(.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

    initial begin
        $display("Time\t a\t b\t cin\t | sum\t cout");
        $display("-------------------------------------------------");

        // Test cases
        a = 4'b0000; b = 4'b0000; cin = 0; #10;
        $display("%0t\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        a = 4'b0101; b = 4'b0011; cin = 0; #10;
        $display("%0t\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        a = 4'b1111; b = 4'b0001; cin = 0; #10;
        $display("%0t\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        a = 4'b1111; b = 4'b1111; cin = 1; #10;
        $display("%0t\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        a = 4'b1010; b = 4'b0101; cin = 1; #10;
        $display("%0t\t %b\t %b\t %b\t | %b\t %b", $time, a, b, cin, sum, cout);

        $finish;
    end
    //storing the values in the wave.vcd files
    /*initial begin 
    $dumpfile ("wave.vcd");
    $dumpvars(0,tb_full_add_four);
    end*/ 

endmodule
