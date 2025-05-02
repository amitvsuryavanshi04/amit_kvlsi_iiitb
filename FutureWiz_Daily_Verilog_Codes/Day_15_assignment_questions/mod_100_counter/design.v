module mod100_counter(
    input clk,         // Clock input
    input rst,         // Reset input
    output reg [6:0] count // 7-bit counter to hold values from 0 to 99
);

    // Counter logic
    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 7'b0000000; // Reset the counter to 0
        else if (count == 99)
            count <= 7'b0000000; // Wrap around to 0 when count reaches 100
        else
            count <= count + 1; // Increment the counter
    end

endmodule
