`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Name: Amit 
// Roll No: KVLSI2501033
// Training Institute: IIIT-Bengaluru
// College:- Govt. S.K.S.J Technological Institute
// Create Date: 29.03.2025 10:25:53
// Design Name: Testbench code for Simple PIC
// Module Name: simple_pic_tb
// Project Name: Simple PIC testbench code
// Target Devices: Simulated device in Xilinx Vivado
// Tool Versions: 2024.2
// 
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module simple_pic_tb;

  reg clk_i, rst_i, cyc_i, stb_i, we_i;
  reg [1:0] adr_i; // Fixed Address Bus Indexing
  reg [7:0] dat_i;
  wire [7:0] dat_o;
  wire ack_o, int_o;
  reg [7:0] irq;

  // Instantiate DUT (Device Under Test)
  simple_pic uut (
    .clk_i(clk_i), .rst_i(rst_i), .cyc_i(cyc_i), .stb_i(stb_i),
    .adr_i(adr_i), .we_i(we_i), .dat_i(dat_i), .dat_o(dat_o),
    .ack_o(ack_o), .int_o(int_o), .irq(irq)
  );

  // Clock Generation
  always #5 clk_i = ~clk_i;

  initial begin
    // Initialize signals
    clk_i = 0; rst_i = 0; cyc_i = 0; stb_i = 0; we_i = 0;
    adr_i = 2'b00; dat_i = 8'b00000000; irq = 8'b00000000;
    #10 rst_i = 1; // Deassert reset
    
    // TC_01: Reset Verification
    #10;
    if (uut.edgen !== 8'b00000000 || uut.pol !== 8'b00000000 || uut.mask !== 8'b11111111)
      $display("[FAIL] Reset did not initialize registers correctly");
    else
      $display("[PASS] Reset correctly initializes registers");
    
    // TC_02: Write & Read Registers
    #10 cyc_i = 1; stb_i = 1; we_i = 1; adr_i = 2'b00; dat_i = 8'b00001111;
    #10 cyc_i = 0; stb_i = 0; we_i = 0;
    #10 cyc_i = 1; stb_i = 1; we_i = 0;
    #10;
    if (dat_o !== 8'b00001111) $display("[FAIL] Write/Read EDGE-ENABLE"); else $display("[PASS] Write/Read EDGE-ENABLE");
    
    // TC_03: Level-Sensitive IRQ
    #10 irq = 8'b00000001;
    #10;
    if (uut.pending[1] !== 1'b1) $display("[FAIL] Level IRQ Handling"); else $display("[PASS] Level IRQ Handling");
    
    // TC_04: Edge-Sensitive IRQ
    #10 irq = 8'b00000000;
    #10 irq = 8'b00000001;
    #10 irq = 8'b00000000;
    #10;
    if (uut.pending[1] !== 1'b1) $display("[FAIL] Edge IRQ Handling"); else $display("[PASS] Edge IRQ Handling");
    
    // TC_05: Clear Pending IRQs
    #10 cyc_i = 1; stb_i = 1; we_i = 1; adr_i = 2'b11; dat_i = 8'b00000001;
    #10 cyc_i = 0; stb_i = 0; we_i = 0;
    #10;
    if (uut.pending[1] !== 1'b0) $display("[FAIL] Pending IRQ Clear"); else $display("[PASS] Pending IRQ Clear");
    
    // TC_06: Verify `int_o` Behavior
    #10 irq = 8'b00000100;
    #10;
    if (int_o !== 1'b1) $display("[FAIL] Interrupt Generation"); else $display("[PASS] Interrupt Generation");
    
    #10 $finish;
  end

  initial begin
    $dumpfile("simple_pic_tb.vcd");
    $dumpvars(0, simple_pic_tb);
  end

endmodule
