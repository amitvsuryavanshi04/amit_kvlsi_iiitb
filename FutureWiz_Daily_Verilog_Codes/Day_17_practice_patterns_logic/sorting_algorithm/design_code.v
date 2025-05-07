// Code your design here
module array_sort;

  // Declare an integer array with 10 elements
  integer arr[9:0];
  integer i, j, temp;

  initial begin
    // Initialize the array with unsorted values
    arr[0] = 23; arr[1] = 12; arr[2] = 45; arr[3] = 8;  arr[4] = 15;
    arr[5] = 4;  arr[6] = 19; arr[7] = 31; arr[8] = 1;  arr[9] = 10;

    $display("Original Array:");
    for (i = 0; i < 10; i = i + 1)
      $write("%0d ", arr[i]);
    $display();

    // Bubble sort in ascending order
    for (i = 0; i < 9; i = i + 1) begin
      for (j = 0; j < 9 - i; j = j + 1) begin
        if (arr[j] > arr[j + 1]) begin
          temp = arr[j];
          arr[j] = arr[j + 1];
          arr[j + 1] = temp;
        end
      end
    end

    // Display sorted array
    $display("Sorted Array (Ascending):");
    for (i = 0; i < 10; i = i + 1)
      $write("%0d ", arr[i]);
    $display();
  end

endmodule
