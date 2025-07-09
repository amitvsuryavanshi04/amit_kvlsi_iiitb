//datatypes example their def size and def values 

module test_datatypes;
  reg r;
  wire w;
  integer i;
  reg [1:0] r_vector;
  wire [1:0] w_vector;
  real rl;
  time t;
  realtime rt;

  // Assign dummy connection to wire to avoid warnings
  //assign w = 1'bz;
  //assign w_vector = 2'bzz;

  initial begin
    $display("------------------------------------------------------------");
    $display("| %-10s | %-10s | %-13s | %-15s |", "Type", "Name", "Default Value", "Default Size");
    $display("------------------------------------------------------------");

    $display("| %-10s | %-10s | %-13b | %-15s |", "reg", "r", r, "1 bit");
    $display("| %-10s | %-10s | %-13b | %-15s |", "wire", "w", w, "1 bit");
    $display("| %-10s | %-10s | %-13d | %-15s |", "integer", "i", i, "32 bits");
    $display("| %-10s | %-10s | %-13b | %-15s |", "reg[1:0]", "r_vector", r_vector, "2 bits");
    $display("| %-10s | %-10s | %-13b | %-15s |", "wire[1:0]", "w_vector", w_vector, "2 bits");
    $display("| %-10s | %-10s | %-13f | %-15s |", "real", "rl", rl, "64 bits");
    $display("| %-10s | %-10s | %-13d | %-15s |", "time", "t", t, "64 bits");
    $display("| %-10s | %-10s | %-13f | %-15s |", "realtime", "rt", rt, "64 bits");

    $display("------------------------------------------------------------");
    $finish;
  end
endmodule
