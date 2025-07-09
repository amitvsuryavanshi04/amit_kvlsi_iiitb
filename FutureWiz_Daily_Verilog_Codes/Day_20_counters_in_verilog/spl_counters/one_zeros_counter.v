//code for a special counter which can count no of ones 
//zeros,x and z in a say vector 

module spl_counter1(
  input [15:0] a,
  output reg [4:0] c_one,
  output reg [4:0] c_zero,
  output reg [4:0] c_x,
  output reg [4:0] c_z
);

  integer i;

  always @(a) begin
    c_one = 0;
    c_zero = 0;
    c_x = 0;
    c_z = 0;

    for (i = 0; i < 16; i = i + 1) begin
      casez (a[i])
        1'b1: c_one = c_one + 1;
        1'b0: c_zero = c_zero + 1;
        1'bx: c_x = c_x + 1;
        1'bz: c_z = c_z + 1;
      endcase
    end
  end

endmodule


