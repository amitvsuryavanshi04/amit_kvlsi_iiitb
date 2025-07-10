//simple fork join block execution 
module test_fk1;
  integer a, b, c;

  initial begin
    a = 5;
    #5 b = 6;
    #4 c = 2;

    $display("Initial block BEFORE fork @ %0t", $time);
    $display("Values: a = %0d, b = %0d, c = %0d", a, b, c);

    fork
      // Block 1: Display fork start
      begin
        $display("-> Fork block STARTS at @ %0t", $time);
      end

      // Block 2: Assign a
      begin
        a = 1;
        $display("a assigned in fork @ %0t", $time);
      end

      // Block 3: Delay and assign b
      begin
        #5 b = 2;
        $display("b assigned after 5 units @ %0t", $time);
      end

      // Block 4: Delay and assign c
      begin
        #4 c = 3;
        $display("c assigned after 4 units @ %0t", $time);
      end

      // Block 5: Display current values after 6 units
      begin
        #6 $display("AFTER FORK (delayed 6): a = %0d, b = %0d, c = %0d @ %0t", a, b, c, $time);
      end

      // Block 6: Exit message
      begin
        #7 $display("-> Fork block ENDS at @ %0t", $time);
      end
    join

    $display(">> After fork-join block: a = %0d, b = %0d, c = %0d @ %0t", a, b, c, $time);
  end
endmodule
