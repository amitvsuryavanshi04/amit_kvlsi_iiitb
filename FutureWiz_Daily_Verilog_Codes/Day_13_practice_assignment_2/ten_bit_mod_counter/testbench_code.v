// File: tb_mod10_counter.v

module tb_mod10_counter;

reg clk;
reg rst;
wire [3:0] count;

// Instantiate the design
mod10_counter uut (
    .clk(clk),
    .rst(rst),
    .count(count)
);

// Clock Generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns clock period
end

// Stimulus
initial begin
    // Dump waveform file
    $dumpfile("mod10_counter.vcd");   // This will create the VCD file
  $dumpvars(1, tb_mod10_counter);   // Dump all variables in tb_mod10_counter module

    // Test Sequence
    rst = 1;
    #12;
    rst = 0;
    #200;

    $finish;
end

endmodule
