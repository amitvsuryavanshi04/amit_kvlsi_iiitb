module fa_task(a,b,cin,sum,carry);
input a,b,cin;
output sum,carry;
	task fa(input a,b,cin,output sum,carry);
		begin
			sum = a^b^cin;
			carry = (a&b)|(b&cin)|(cin&a);
		end
	endtask
	
	always@(a,b,cin)
		begin
			fa(a,b,cin,sum,carry);
		end
endmodule
//--------------------------testbench code-----------------------
module tb_fa_task;

  // Declare testbench signals
  reg a, b, cin;
  wire sum, carry;

  // Instantiate the DUT (Device Under Test)
  fa_task uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
  );

  // Apply all input combinations
  initial begin
    $display("A B Cin | Sum Carry");
    $display("-------------------");
    for (int i = 0; i < 8; i = i + 1) begin
      {a, b, cin} = i[2:0];
      #1; // Wait for a time unit to update outputs
      $display("Sim time = %0t %b %b  %b  |  %0b    %0b",$time(), a, b, cin, sum, carry);
    end
    $finish;
  end

endmodule
