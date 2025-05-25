module test_task;
task display();
	begin 
		$display("It's a task");
	end
endtask
endmodule
//-----------------------------------------------------
// Testbench for test_task module
module tb_test_task;

  // Instantiate the DUT (Device Under Test)
  test_task uut();

  initial begin
    // Call the task from the module using instance name
    uut.display();  // This will print: "It's a task"
    
    $finish;
  end

endmodule
