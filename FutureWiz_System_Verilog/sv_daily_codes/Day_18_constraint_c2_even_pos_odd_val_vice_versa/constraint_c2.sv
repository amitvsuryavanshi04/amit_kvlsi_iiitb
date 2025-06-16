// Class Definition
class packet;
  rand int arr[10];

  // Constraint to restrict array elements between 0 and 100
  constraint c1 { foreach (arr[i]) arr[i] inside {[0:100]};}
  constraint c2 {foreach (arr[i]) if ((i+1)%2 == 1) arr[i]%2 == 1; else arr[i]%2 == 0;}
  
  // post_randomize method
  function void post_randomize();
    $display("Arr = %p", arr);
  endfunction
endclass

// Testcase
module tc_c1;
  packet p;

  initial begin
    p = new();
    
    if (p.randomize()) begin
      $display("Randomization successful!");
      p.post_randomize();  // Display array after randomization
    end else begin
      $display("Randomization failed!");
    end
  end
endmodule
