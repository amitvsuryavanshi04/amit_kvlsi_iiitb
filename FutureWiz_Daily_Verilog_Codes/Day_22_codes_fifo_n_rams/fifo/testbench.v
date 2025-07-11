`timescale 1ns / 1ps

module tb_simple_fifo;

    // Parameters
    parameter DATA_WIDTH = 8;
    parameter ADDR_WIDTH = 4;

    // Signals
    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [DATA_WIDTH-1:0] din;
    wire [DATA_WIDTH-1:0] dout;
    wire empty;
    wire full;

    // Instantiate the FIFO
    simple_fifo #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .din(din),
        .dout(dout),
        .empty(empty),
        .full(full)
    );

    // Clock generation
    always #5 clk = ~clk;  // 100 MHz clock

    // Test sequence
    initial begin
        // Initialization
        clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        din = 0;

        // Reset
        #10;
        rst = 0;

        // Write data into FIFO
        repeat (8) begin
            @(posedge clk);
            wr_en = 1;
            din = din + 8'h11;  // Example data: 0x11, 0x22, ...
        end

        @(posedge clk);
        wr_en = 0;

        // Wait a bit
        #20;

        // Read data from FIFO
        repeat (8) begin
            @(posedge clk);
            rd_en = 1;
        end

        @(posedge clk);
        rd_en = 0;

        // Finish simulation
        #20;
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | wr_en=%b rd_en=%b din=%h dout=%h full=%b empty=%b",
                 $time, wr_en, rd_en, din, dout, full, empty);
       $dumpvars(0,tb_simple_fifo);
	   $dumpfile("wave.vcd");
    end

endmodule
