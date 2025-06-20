// Code your design here
module tff(tff_if vif);
  always_ff @(posedge vif.clk or posedge vif.rst) begin
    if (vif.rst)
      vif.q <= 1'b0;
    else if (vif.t)
      vif.q <= ~vif.q;
  end
endmodule

