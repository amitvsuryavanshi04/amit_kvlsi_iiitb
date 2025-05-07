module tb_array_sort;
  // Instantiate the DUT (Design Under Test)
  array_sort uut();

  initial begin
    // Create dump file and dump variables
    $dumpfile("waveform.vcd");
    $dumpvars(0, tb_array_sort);
  end
endmodule