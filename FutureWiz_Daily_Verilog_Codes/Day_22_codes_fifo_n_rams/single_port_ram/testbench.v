`timescale 1ns / 1ps

module tb_single_port_ram;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    // Testbench signals
    reg clk;
    reg en;
    reg we;
    reg [ADDR_WIDTH-1:0] addr;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;

    // Instantiate the RAM
    single_port_ram #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) uut (
        .clk(clk),
        .en(en),
        .we(we),
        .addr(addr),
        .din(din),
        .dout(dout)
    );

    // Clock generation
    always #5 clk = ~clk;  // 100MHz clock (10ns period)

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        en = 0;
        we = 0;
        addr = 0;
        din = 0;

        // Wait for a few cycles
        #10;

        // Write some values
        en = 1;
        we = 1;

        repeat (8) begin
            @(posedge clk);
            addr = addr + 1;
            din = din + 8'hA0;
        end

        // Stop writing
        @(posedge clk);
        we = 0;

        // Wait before reading
        #10;

        // Read values back
        addr = 0;

        repeat (8) begin
            @(posedge clk);
            addr = addr + 1;
        end

        // Finish simulation
        #20;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | en=%b we=%b addr=%h din=%h dout=%h", 
                  $time, en, we, addr, din, dout);
    end

    // VCD waveform dumping
    initial begin
        $dumpfile("single_port_ram_tb.vcd");
        $dumpvars(0, tb_single_port_ram);
    end

endmodule
