module default_datatype_demo;

  // Declaration of various data types without initialization
  bit        a;
  logic      b;
  byte       c;
  shortint   d;
  int        e;
  longint    f;

  initial begin
    $display("------------------------------------------------------");
    $display("| Data Type | Size (bits) | Default Value            |");
    $display("------------------------------------------------------");
    $display("| bit       | %0d          | %b                       |", $bits(a), a);
    $display("| logic     | %0d          | %b                       |", $bits(b), b);
    $display("| byte      | %0d          | %0d                     |", $bits(c), c);
    $display("| shortint  | %0d         | %0d                  |", $bits(d), d);
    $display("| int       | %0d         | %0d                  |", $bits(e), e);
    $display("| longint   | %0d         | %0d          |", $bits(f), f);
    $display("------------------------------------------------------");
  end

endmodule
