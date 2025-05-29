// =======================
// I2C Master Module
// =======================
module i2c_master (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [6:0] slave_address,
    input wire rw,           // 1 = Read, 0 = Write
    input wire [7:0] data_in,
    output reg sda,
    output reg scl,
    output reg done,
    output reg [2:0] state    // <-- Made 'state' visible to testbench
);

    reg [3:0] count;
    reg [7:0] shift_reg;
    reg ack;

    parameter IDLE       = 3'b000,
              START      = 3'b001,
              ADDR       = 3'b010,
              RW_BIT     = 3'b011,
              ACK_BIT    = 3'b100,
              DATA_TRANS = 3'b101,
              STOP       = 3'b110;

    // Clock divider for SCL
    reg scl_enable = 0;
    always @(posedge clk or posedge rst) begin
        if (rst) scl_enable <= 0;
        else scl_enable <= ~scl_enable;
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            state <= IDLE;
            scl <= 1;
            sda <= 1;
            done <= 0;
            count <= 0;
        end else if (scl_enable) begin
            case (state)
                IDLE: begin
                    scl <= 1;
                    sda <= 1;
                    done <= 0;
                    if (enable) state <= START;
                end

                START: begin
                    sda <= 0;
                    scl <= 1;
                    state <= ADDR;
                    shift_reg <= {slave_address, rw};
                    count <= 7;
                end

                ADDR: begin
                    scl <= 0;
                    sda <= shift_reg[count];
                    scl <= 1;
                    if (count == 0)
                        state <= RW_BIT;
                    else
                        count <= count - 1;
                end

                RW_BIT: begin
                    scl <= 0;
                    sda <= rw;
                    scl <= 1;
                    state <= ACK_BIT;
                end

                ACK_BIT: begin
                    scl <= 0;
                    sda <= 1'bz;
                    scl <= 1;
                    ack <= sda; // Simulated ack read
                    if (ack == 0)
                        state <= DATA_TRANS;
                    else
                        state <= STOP;
                end

                DATA_TRANS: begin
                    scl <= 0;
                    sda <= data_in[7 - count];
                    scl <= 1;
                    if (count == 7) begin
                        count <= 0;
                        state <= STOP;
                    end else begin
                        count <= count + 1;
                    end
                end

                STOP: begin
                    scl <= 1;
                    sda <= 0;
                    sda <= 1;
                    done <= 1;
                    if (!enable)
                        state <= IDLE;
                    else
                        state <= START;
                end

                default: state <= IDLE;
            endcase
        end
    end
endmodule

