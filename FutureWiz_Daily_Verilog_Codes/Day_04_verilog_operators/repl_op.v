module replication_operator;
  reg [1:0] a = 2'b10;
  reg [5:0] result;

  initial begin
    result = {3{a}};
    $display("The operation using {{}}: {3{%b}} = %b", a, result);
  end
endmodule
