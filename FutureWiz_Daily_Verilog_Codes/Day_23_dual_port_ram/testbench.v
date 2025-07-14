`timescale 1ns/1ps

module tb_rams_sp_nc;

    // DUT Parameters
    reg clk;
    reg we;
    reg en;
    reg [9:0] addr;
    reg [15:0] di;
    wire [15:0] dout;

    // Instantiate DUT
    rams_sp_nc dut (
        .clk(clk),
        .we(we),
        .en(en),
        .addr(addr),
        .di(di),
        .dout(dout)
    );

    // Clock Generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Simulation
    initial begin
        $dumpfile("rams_sp_nc_tb.vcd");
        $dumpvars(0, tb_rams_sp_nc);

        // Initialize signals
        we = 0;
        en = 0;
        addr = 0;
        di = 0;

        $display("Starting Single-Port RAM Test");

        // Wait one clock
        @(posedge clk);

        // Enable and write data to address 0x05
        en = 1;
        we = 1;
        addr = 10'h005;
        di = 16'h1234;
        @(posedge clk);
        we = 0; // disable write

        // Wait a clock to ensure write completes
        @(posedge clk);

        // Read from address 0x05
        addr = 10'h005;
        @(posedge clk);
        // Read result will appear in next cycle due to register
        @(posedge clk);
        $display("Read @ 0x005 = 0x%h ", dout);

        // Write another value to address 0x1A0
        we = 1;
        addr = 10'h1A0;
        di = 16'habcd;
        @(posedge clk);
        we = 0;

        // Wait and read back
        @(posedge clk);
        addr = 10'h1A0;
        @(posedge clk);
        @(posedge clk);
        $display("Read @ 0x1A0 = 0x%h ", dout);

        $display("Test completed.");
        $finish;
        
       
		
    end
    initial begin 
		$dumpfile("dual_port)_ram_tb.vcd");
		$dumpvars(1,tb_rams_sp_nc);
		end

endmodule
