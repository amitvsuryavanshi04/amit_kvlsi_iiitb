module single_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input wire clk,
    input wire en,
    input wire we,
    input wire [ADDR_WIDTH-1:0] addr,
    input wire [DATA_WIDTH-1:0] din,
    output reg [DATA_WIDTH-1:0] dout
);

    // RAM array
    reg [DATA_WIDTH-1:0] mem [0:(1 << ADDR_WIDTH)-1];

    // Synchronous read/write
    always @(posedge clk) begin
        if (en) begin
            if (we)
                mem[addr] <= din;       // Write operation
            else
                dout <= mem[addr];      // Read operation
        end
    end

endmodule
