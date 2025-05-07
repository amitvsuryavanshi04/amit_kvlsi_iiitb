// Code your testbench here
module tb_prime_check;
  prime_check uut();  // Instantiate the DUT

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, uut);
    #100;
    $finish;
  end
endmodule
