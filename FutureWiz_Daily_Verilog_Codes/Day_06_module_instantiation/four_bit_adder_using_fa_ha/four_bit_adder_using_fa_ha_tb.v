module four_bit_adder_testbench;
  reg [3:0] a, b;
  reg cin;
  wire [3:0] s;
  wire cout;
  // Instantiate the 4-bit adder
  four_bit_adder fba1 (.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
  integer i;
  reg [8:0] tv; // 9-bit vector: {a[3:0], b[3:0], cin}
  initial begin
    $display("Time\t a\t b\t cin\t | s\t cout");
    $display("------------------------------------------------");
    for (i = 0; i < 512; i = i + 1) begin // 2^9 = 512 combinations
      tv = i;
      {a, b, cin} = tv;
      #5; // Small delay
      $display("%0t\t %b\t %b\t  %b\t | %b\t %b", $time, a, b, cin, s, cout);
    end
  end
endmodule

