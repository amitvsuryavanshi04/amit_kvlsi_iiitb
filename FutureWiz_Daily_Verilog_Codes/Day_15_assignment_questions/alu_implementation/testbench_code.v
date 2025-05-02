module tb_alu_4bit_mux;

reg  [3:0] A, B;
reg  [2:0] ALU_Sel;
wire [3:0] ALU_Out;
wire CarryOut;

alu_4bit_mux uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut)
);

initial begin
    // Set up the dumpfile and dumpvars
    $dumpfile("alu_4bit_mux_waveform.vcd");  // Name of the VCD file
    $dumpvars(0, tb_alu_4bit_mux);  // Dump all the variables in the testbench

    // Initial values
    A = 4'b0011; B = 4'b0101;
    
    // Apply test cases
    ALU_Sel = 3'b000; #10;  // AND operation
    ALU_Sel = 3'b001; #10;  // OR operation
    ALU_Sel = 3'b010; #10;  // XOR operation
    ALU_Sel = 3'b011; #10;  // ADD operation
    ALU_Sel = 3'b100; #10;  // SUB operation
    ALU_Sel = 3'b101; #10;  // NOT A operation
    ALU_Sel = 3'b110; #10;  // B << 1 operation
    ALU_Sel = 3'b111; #10;  // B >> 1 operation

    $finish;
end

endmodule
