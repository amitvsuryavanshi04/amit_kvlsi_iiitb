module t_latch(input clk, rst_n, t, output reg q);
  reg temp;

  always @(clk,rst_n,t) begin
    if (!rst_n)
      temp = 1'b0;
    else if (clk) begin  // latch is transparent when clk is high
      if (t)
        temp = ~temp;
      // else hold
    end
    q = temp;
  end
endmodule
