
module gradual_counter(clk, rst, count);

  input clk, rst;
  output [2:0] count;

  reg [2:0] temp;
  reg dir; // 1 = up, 0 = down

  assign count = temp;

  always @(posedge clk) begin
    if (rst) begin
      temp <= 3'd0;
      dir <= 1'b1;
    end
    else begin
      if (dir) begin
        if (temp == 3'd7) begin
          dir <= 1'b0;
          temp <= temp - 1;
        end else begin
          temp <= temp + 1;
        end
      end
      else begin
        if (temp == 3'd0) begin
          dir <= 1'b1;
          temp <= temp + 1;
        end else begin
          temp <= temp - 1;
        end
      end
    end
  end

endmodule
