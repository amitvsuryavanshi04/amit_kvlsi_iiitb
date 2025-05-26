module array_queue_operations;

  int dyn_array[] = '{2, 4, 6, 4, 8, 10, 4};
  int q1[$] = '{10, 20, 30, 40};

  int pop1, pop2;
  int idx, item, count4;
  int sum, prod, minval, maxval;

  int sort_array[];  // dynamic arrays
  int red_array[];
  
  initial begin
    $display("=== Queue Operations ===");

    q1.push_front(5);
    q1.push_back(50);
    $display("q1 after push_front and push_back: %p", q1);

    pop1 = q1.pop_front();
    pop2 = q1.pop_back();
    $display("q1 after pop_front (%0d) and pop_back (%0d): %p", pop1, pop2, q1);

    q1.insert(2, 25);
    $display("q1 after insert at index 2: %p", q1);

    q1.delete(3);
    $display("q1 after delete at index 3: %p", q1);

    $display("q1 size: %0d", q1.size());

    $display("\n=== Array Ordering Methods ===");

    sort_array = '{9, 5, 2, 7, 1};
    $display("Original: %p", sort_array);

    sort_array.sort();
    $display("Sorted:   %p", sort_array);

    sort_array.reverse();
    $display("Reversed: %p", sort_array);

    sort_array.shuffle();
    $display("Shuffled: %p", sort_array);

    $display("\n=== Array Reduction Methods ===");

    red_array = '{2, 4, 6, 8};

    // Calculate sum
    sum = 0;
    foreach (red_array[i]) sum += red_array[i];

    // Calculate product
    prod = 1;
    foreach (red_array[i]) prod *= red_array[i];

    // Calculate min and max
    minval = red_array[0];
    maxval = red_array[0];
    foreach (red_array[i]) begin
      if (red_array[i] < minval) minval = red_array[i];
      if (red_array[i] > maxval) maxval = red_array[i];
    end

    $display("Sum: %0d, Product: %0d, Min: %0d, Max: %0d", sum, prod, minval, maxval);
  end

endmodule

