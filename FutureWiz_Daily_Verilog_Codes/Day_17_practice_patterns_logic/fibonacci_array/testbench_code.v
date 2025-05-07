`timescale 1ns/1ns

module tb_fibonacci;
  fibonacci uut();  // Instantiate DUT

  integer i;

  initial begin
    $dumpfile("waveform.vcd");

    // Dump each Fibonacci array element to waveform
    for (i = 0; i < 10; i = i + 1)
      $dumpvars(0, uut.fib[i]);

    #100;
    $finish;
  end
endmodule
