// Clock generator module using a task
module clk_gen;

  reg clk;

  // Clock generation task: toggles clk every 5 time units
  task generate_clk;
    integer i;
    begin
      for (i = 0; i < 10; i = i + 1) begin
        #5 clk = ~clk;
        $display("Time = %0t : clk = %b", $time, clk);
      end
    end
  endtask

  initial begin
    clk = 0;             // Initialize clock
    generate_clk();      // Call the task
    $finish;
  end

endmodule
