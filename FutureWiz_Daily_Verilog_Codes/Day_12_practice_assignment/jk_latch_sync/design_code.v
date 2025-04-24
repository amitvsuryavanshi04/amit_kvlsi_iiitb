// Code your design here
module jk_latch_sync_reset (
    input j, k, clk, reset,
    output reg q
);
    always @(posedge clk) begin
        if (reset)
            q <= 0;
        else if (j == 0 && k == 0)
            q <= q;
        else if (j == 0 && k == 1)
            q <= 0;
        else if (j == 1 && k == 0)
            q <= 1;
        else if (j == 1 && k == 1)
            q <= ~q;
    end
endmodule
