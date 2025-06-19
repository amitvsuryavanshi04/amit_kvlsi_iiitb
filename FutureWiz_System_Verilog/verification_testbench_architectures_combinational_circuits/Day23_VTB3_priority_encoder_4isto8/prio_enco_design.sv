// Code your design here
module prio_enco( input [3:0]i, output reg [1:0]d);
  always@(i)
    begin
      casex(i)
        4'b0001:d=2'b00;
        4'b001x:d=2'b01;
        4'b01xx:d=2'b10;
        4'b1xxx:d=2'b11;
        default:d=2'b00;
      endcase
    end
endmodule