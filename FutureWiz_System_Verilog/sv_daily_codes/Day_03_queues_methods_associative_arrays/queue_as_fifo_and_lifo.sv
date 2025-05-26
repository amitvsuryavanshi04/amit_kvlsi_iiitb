module queue_fifo_lifo;

  int fifo_q[$];  // FIFO queue
  int lifo_q[$];  // LIFO queue
  int data[4] = '{10, 20, 30, 40};  // Static array of values to push

  // FIFO: push_front + pop_back
  task automatic fifo_demo();
    int val;
    $display("\n=== FIFO (First-In-First-Out) ===");
    for (int i = 0; i < $size(data); i++) begin
      fifo_q.push_front(data[i]);
      $display("Pushed %0d at front -> FIFO Queue: %p", data[i], fifo_q);
    end
    while (fifo_q.size() > 0) begin
      val = fifo_q.pop_back();
      $display("Popped %0d from back -> FIFO Queue: %p", val, fifo_q);
    end
  endtask

  // LIFO: push_back + pop_back
  task automatic lifo_demo();
    int val;
    $display("\n=== LIFO (Last-In-First-Out) ===");
    for (int i = 0; i < $size(data); i++) begin
      lifo_q.push_back(data[i]);
      $display("Pushed %0d at back -> LIFO Queue: %p", data[i], lifo_q);
    end
    while (lifo_q.size() > 0) begin
      val = lifo_q.pop_back();
      $display("Popped %0d from back -> LIFO Queue: %p", val, lifo_q);
    end
  endtask

  initial begin
    fifo_demo();
    lifo_demo();
  end

endmodule
