class packet;

  // Declare variable to be covered
  rand bit [3:0] a;

  // Declare the covergroup
  covergroup cvg;
    cvp1: coverpoint a;
  endgroup

  // Constructor
  function new();
    cvg = new();
  endfunction

  // Task to sample and display coverage
  task sample_and_display();
    cvg.sample(); // Sample the coverage
    $display("The coverpoint 'a' has this much coverage = %0.2f%%", cvg.get_coverage());
  endtask

endclass



module tb;
  packet pkt;

  initial begin
    pkt = new();
    repeat (30) begin
      void'(pkt.randomize());
      pkt.sample_and_display();
    end
  end
endmodule
