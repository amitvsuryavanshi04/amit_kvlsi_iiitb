//Assignment submission from 
//Name: Amit 
//KVLSI RoLl No: KVLSI2501033


//Q1 Write a verilog code for calculating factorial of a number using 
//function 
module tb;
reg [63:0]fact_num;
	function automatic reg[63:0] fact(input reg [31:0]n );
	begin
		if(n>1)
			fact = fact(n-1)*n;
		else
			fact = 1;
	end
	endfunction

initial begin
	facto = fact(4);
	$display("%0d",facto);
end
endmodule



//Q2 Write a function to check even and odd number with low circuitary 
module even_odd_function_check;
  reg [7:0] num;
  reg result;

  // Function to check if number is even
  function is_even;
    input [7:0] val;
    begin
      if (val[0] == 0)
        is_even = 1;  // Even
      else
        is_even = 0;  // Odd
    end
  endfunction

  initial begin
    num = 8'd42;  // Change number here

    result = is_even(num);

    if (result)
      $display("Number %0d is Even", num);
    else
      $display("Number %0d is Odd", num);
  end
endmodule


//Q3 write a function to check whether a number is prime or not ?
module prime_check_functional;
  integer num;

  // Function to check if a number is prime
  function is_prime;
    input integer n;
    integer j;
    begin
      if (n < 2)
        is_prime = 0;
      else begin
        is_prime = 1;  // Assume prime
        for (j = 2; j <= n / 2; j = j + 1) begin
          if (n % j == 0) begin
            is_prime = 0;
            j = n;  // Force loop exit
          end
        end
      end
    end
  endfunction

  initial begin
    num = 29;  // Change number to test here

    if (is_prime(num))
      $display("Number %0d is Prime", num);
    else
      $display("Number %0d is Not Prime", num);
  end
endmodule



//Q4 Write a verilog code for the mathematical statement with low cost 
//circuitary : y = 32*n+10.

//design code 
module low_cost_circuit_y (n,y);
    input  [7:0]n;   
    output [12:0]y;    

// Output wide enough to hold result (up to 32*255 + 10 = 8170)

    assign y = (n << 5) + 10;

endmodule

//testbench code 
`timescale 1ns / 1ps

module tb_low_cost_circuit_y;

    // Testbench signals
    reg  [7:0] n;
    wire [12:0] y;

    // Instantiate the design under test (DUT)
    low_cost_circuit_y dut (.n(n),.y(y));

    // Test sequence
    initial begin
        // Monitor the changes
        $display("Time\t n\t y");
        $monitor("%0t\t %d\t %d", $time, n, y);

        // Apply test vectors
        n = 8'd0;   #10;
        n = 8'd1;   #10;
        n = 8'd5;   #10;
        n = 8'd10;  #10;
        n = 8'd25;  #10;
        n = 8'd50;  #10;
        n = 8'd100; #10;
        n = 8'd255; #10;

        // Finish simulation
        $finish;
    end

endmodule


///Q5 write a frequency divider by 5 circuit 
//code
module test_five;
	reg clk_in=0;
	reg clk_out=0;
	integer count=0;
		always@(posedge clk_in or negedge clk_in)begin
			count = count+1;
			if(count==5)begin
				clk_out = ~clk_out;
				count=0;
			end
		end
		
		always #5 clk_in=~clk_in;
		initial begin
			$dumpfile("wave.vcd");
			$dumpvars(0,test_five);
			#100 $finish;
		end
endmodule


//Q6 Write a task to generate a clock 
//code 
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
    generate_clk();      // Call/invoke the task
    $finish;
  end

endmodule 

//Q7 write a function for the task which perfrms shifting by 2 position
//in right direction when ctrl is '1' and shifting by left when the ctrl
// is '0' function should perform only one thing at a time 
 
module shift_control;

    // Function definition
    function [7:0] shift_by_2;
        input [7:0] data;
        input ctrl;
        begin
            if (ctrl)
                shift_by_2 = data >> 2; // Right shift by 2
            else
                shift_by_2 = data << 2; // Left shift by 2
        end
    endfunction

    // Test logic
    reg [7:0] input_data;
    reg ctrl;
    wire [7:0] result;

    assign result = shift_by_2(input_data, ctrl);

    initial begin
        $display("Time\tctrl\tinput_data\tresult");
        input_data = 8'b10101010; ctrl = 1'b0; #10;  // Left shift
        $display("%0t\t%b\t%b\t%b", $time, ctrl, input_data, result);

        input_data = 8'b10101010; ctrl = 1'b1; #10;  // Right shift
        $display("%0t\t%b\t%b\t%b", $time, ctrl, input_data, result);

        $finish;
    end

endmodule

///Q8 Write a verilog code wwhich can perform reset as synchronous as 
// well as asynchronous , depends on the flag conditionas follow
// flag = 0 async rst, flag = 1 sync rst so function should contain 
// flag dependent argument 
module reset_control (clk,rst,flag,d,q);
    input clk,rst,flag,d;      // 0 = async reset, 1 = sync reset
    output reg  q;

    always @(posedge clk or (flag == 0 && rst)) begin
        if (flag == 0 && rst)         // Asynchronous reset
            q <= 0;
        else if (flag == 1 && rst)    // Synchronous reset
            q <= 0;
        else
            q <= d;
    end

endmodule


//Q9 Write a verilog code for the generation of 10 unique random value 
// generation between 0 to 100 
module test_nine;
	integer a[0:9];
	integer i,j,temp;
	
	initial begin
		i=0;
			while(i!=10)
				begin
					temp={$random}%101;
					begin : loop
							for(j=0;j<i;j=j+1)
						begin
						if(a[j]==temp)
						disable loop;
						end
					a[i]=temp;
					i=i+1;
					end
				end
		for(i=0; i<10; i=i+1)
		$display("a[%0d] = %0d",i,a[i]);
	end
endmodule






