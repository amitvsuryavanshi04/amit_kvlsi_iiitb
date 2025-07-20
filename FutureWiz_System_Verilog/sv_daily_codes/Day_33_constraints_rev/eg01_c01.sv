//write a constraint to print the even and odd values using the 
//randomize function in system verilog , and then use the pre and post randomize
//callback methods as well to make the code more relible and extra refined
// Code design written below 
//Question 01 	
class A;
  rand int value ;
  rand int data;
  constraint val {value inside {[100:200]}; data inside {[25:150]};}
  constraint val_even {value % 2 == 0;}
  constraint data_odd {data % 2 == 1;}
  
  //pre randomize function , any pre processes or functions can be implemented in this pre randomize function as per syntax below
  function void pre_randomize();
    $display("-----Pre randomize function.-------"); //functionality statements
  endfunction
  
  //function post randomize function
  function void post_randomize();
    $display("--- post randomize function executes when randomization completes.");
     $display("    (Check) Is value even? %0s", (value % 2 == 0) ? "YES" : "NO");
    $display("    (Check) Is data odd?  %0s", (data % 2 != 0) ? "YES" : "NO");
  endfunction
  
  //display function 
  function void display();
    $display("=> Final Values: value = %0d, data = %0d", value, data);
  endfunction

endclass

module test_case_eg01_c01;
  A a;

  initial begin
    a = new();
    repeat(3) begin
      $display("\n--- Randomization Round ---");
      a.randomize(); // This will internally call pre and post hooks
      a.display();
    end
  end

endmodule
