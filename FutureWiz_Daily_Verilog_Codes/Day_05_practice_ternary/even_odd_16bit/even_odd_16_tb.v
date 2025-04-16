//testbench
module tb_even_odd_checker;
  reg [15:0] num;
  wire y;

  even_odd_checker uut (
    .num(num),
    .y(y)
  );

  initial begin
    $monitor("num = %d | y = %b (%s)", num, y, (y ? "ODD" : "EVEN"));

    num = 16'd0;     #10;
    num = 16'd1;     #10;
    num = 16'd2;     #10;
    num = 16'd7;     #10;
    num = 16'd1024;  #10;
    num = 16'd2023;  #10;

    $finish;
  end
endmodule
