module up_counter_3bit (
    input wire clk,           // Clock input
    input wire reset_n,       // Asynchronous active-low reset
    output reg [2:0] count    // 3-bit counter output
);

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            count <= 3'b000;           // Reset to 0 when reset_n is low
        else
            count <= count + 1'b1;     // Increment counter
    end

endmodule
