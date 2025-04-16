module tb_top_module;

    // Declare input signals for the DUT (Design Under Test)
    reg w1, w2, w3;
    wire f;  // Output from DUT

    // Instantiate the DUT (top_module)
    top_module dut (
        .w1(w1),
        .w2(w2),
        .w3(w3),
        .f(f)
    );

    // Create a VCD file for GTKWave
    initial begin
        $dumpfile("top_module.vcd"); // VCD file to store waveform data
        $dumpvars(0, tb_top_module); // Dump all signals in the testbench
    end

    // Apply all possible input combinations and generate outputs
    initial begin
        $display("w3 w2 w1 | f");
        $display("-------------");

        // Test all input combinations
        for (integer i = 0; i < 8; i = i + 1) begin
            {w3, w2, w1} = i[2:0];  // Generate inputs from 000 to 111
            #5;                     // Wait for signal propagation
            $display("%b  %b  %b | %b", w3, w2, w1, f); // Display output
        end

        $finish;  // End the simulation
    end

endmodule