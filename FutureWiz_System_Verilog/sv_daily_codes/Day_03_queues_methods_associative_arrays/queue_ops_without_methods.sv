// Code your design here
module queue_ops_without_methods;

  //step 1 is initialize the queue
  int q[$] = '{3, 10, 15, 4, 22, 30, 40, 12, 55, 9};

  initial begin
    


    // Step 2: Delete 4th (index 3) and 6th (index 5) using queue concatenation
    q = {q[0:2], q[4], q[6:$]}; // skip index 3 and 5
    $display("After removing 4th and 6th index: %p", q);

    // Step 3: Insert 100 at last using concatenation
    q = {q, 100};
    $display("After inserting 100 at last: %p", q);

    // Step 4: Insert 50 at first using concatenation
    q = {50, q};
    $display("After inserting 50 at first: %p", q);
  end

endmodule
