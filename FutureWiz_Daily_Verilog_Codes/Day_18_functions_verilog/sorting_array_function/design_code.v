module array_sort_task;
  // Declare array and variables
  integer arr[0:9];
  integer i, j;

  // Task to swap two integers using inout
  task swap;
    inout integer a, b;
    integer temp;
    begin
      temp = a;
      a = b;
      b = temp;
    end
  endtask

  initial begin
    // Initialize the array
    arr[0] = 23; arr[1] = 12; arr[2] = 45; arr[3] = 8;  arr[4] = 15;
    arr[5] = 4;  arr[6] = 19; arr[7] = 31; arr[8] = 1;  arr[9] = 10;

    $display("Original Array:");
    for (i = 0; i < 10; i = i + 1)
      $write("%0d ", arr[i]);
    $display();

    // Bubble sort using swap task
    for (i = 0; i < 9; i = i + 1) begin
      for (j = 0; j < 9 - i; j = j + 1) begin
        if (arr[j] > arr[j + 1])
          swap(arr[j], arr[j + 1]);
      end
    end

    $display("Sorted Array (Ascending):");
    for (i = 0; i < 10; i = i + 1)
      $write("%0d ", arr[i]);
    $display();
  end
endmodule
