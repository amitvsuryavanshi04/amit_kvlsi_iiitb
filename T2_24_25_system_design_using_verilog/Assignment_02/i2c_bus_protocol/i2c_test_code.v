// =======================
// Testbench for I2C Master
// =======================
module tb_i2c_master;

  // Inputs
  reg clk;
  reg rst;
  reg enable;
  reg [6:0] slave_address = 7'b1010001;
  reg rw = 0;
  reg [7:0] data_in = 8'hAB;

  // Outputs
  wire sda;
  wire scl;
  wire done;
  wire [2:0] state;

  // Instantiate DUT
  i2c_master uut (
    .clk(clk),
    .rst(rst),
    .enable(enable),
    .slave_address(slave_address),
    .rw(rw),
    .data_in(data_in),
    .sda(sda),
    .scl(scl),
    .done(done),
    .state(state)
  );

  // Clock generation (10ns period = 100 MHz)
  always #5 clk = ~clk;

  initial begin
    // Initialize
    clk = 0;
    rst = 1;
    enable = 0;

    // Reset
    #20 rst = 0;

    // Start transaction
    #10 enable = 1;
    #20 enable = 0;

    // Wait and finish
    #500 $finish;
  end

  // Console monitor
  initial begin
    $monitor("Time=%0t | SDA=%b SCL=%b DONE=%b STATE=%d", $time, sda, scl, done, state);
  end

  // Dump for waveform (for ModelSim)
  initial begin
    $dumpfile("i2c_wave.vcd");
    $dumpvars(0, tb_i2c_master);
  end

endmodule

