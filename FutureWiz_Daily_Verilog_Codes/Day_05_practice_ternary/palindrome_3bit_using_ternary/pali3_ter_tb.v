module tb_pali_detect_ter;

  reg [2:0] i;
  wire y;

  // Instantiate the DUT
  pali_detect_ter dut (
    .i(i),
    .y(y)
  );

  initial begin
    $display("Time\ti\t y");
    $monitor("%0t\t%b\t%b", $time, i, y);

    i = 3'b000; #5;
    i = 3'b001; #5;
    i = 3'b010; #5;
    i = 3'b011; #5;
    i = 3'b100; #5;
    i = 3'b101; #5;
    i = 3'b110; #5;
    i = 3'b111; #5;

    $finish;
  end

endmodule
