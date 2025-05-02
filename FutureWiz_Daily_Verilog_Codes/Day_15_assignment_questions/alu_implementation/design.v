module alu_4bit_mux (
    input  [3:0] A,
    input  [3:0] B,
    input  [2:0] ALU_Sel,
    output [3:0] ALU_Out,
    output CarryOut
);

wire [3:0] and_out, or_out, xor_out, add_out, sub_out, not_a, shl_b, shr_b;
wire add_carry, sub_carry;

// Individual operations
assign and_out   = A & B;
assign or_out    = A | B;
assign xor_out   = A ^ B;
assign {add_carry, add_out} = A + B;
assign {sub_carry, sub_out} = A - B;
assign not_a     = ~A;
assign shl_b     = B << 1;
assign shr_b     = B >> 1;

// 8-to-1 MUX for ALU_Out
assign ALU_Out = (ALU_Sel == 3'b000) ? and_out :
                 (ALU_Sel == 3'b001) ? or_out  :
                 (ALU_Sel == 3'b010) ? xor_out :
                 (ALU_Sel == 3'b011) ? add_out :
                 (ALU_Sel == 3'b100) ? sub_out :
                 (ALU_Sel == 3'b101) ? not_a   :
                 (ALU_Sel == 3'b110) ? shl_b   :
                 (ALU_Sel == 3'b111) ? shr_b   :
                 4'b0000;

// 8-to-1 MUX for CarryOut
assign CarryOut = (ALU_Sel == 3'b011) ? add_carry :
                  (ALU_Sel == 3'b100) ? sub_carry : 
                  1'b0;

endmodule
