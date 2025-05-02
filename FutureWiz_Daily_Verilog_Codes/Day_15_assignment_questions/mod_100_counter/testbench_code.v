module tb_mod100_counter;
    reg clk;            // Clock signal
    reg rst;            // Reset signal
    wire [6:0] count;   // Counter value
    // Instantiate the mod100 counter
    mod100_counter uut (
        .clk(clk),
        .rst(rst),
        .count(count));
    // Clock generation
    always begin
        #5 clk = ~clk;  // Generate clock with a period of 10 time units
    end
    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst = 0;
        // Apply reset and check counter
        rst = 1; #10;    // Assert reset for 10 time units
        rst = 0; #10;    // Deassert reset
        // Run counter and check its values
        #1000;  // Simulate for some time to observe counting
        $finish;  // End the simulation
    end
    // Display counter values in a readable format
    initial begin
        $monitor("Time: %0t | Count: %d", $time, count);
    end
endmodule