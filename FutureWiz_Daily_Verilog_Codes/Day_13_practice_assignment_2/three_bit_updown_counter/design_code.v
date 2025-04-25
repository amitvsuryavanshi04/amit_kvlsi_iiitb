module counter (clk,rst,ctrl,count);
  
  input clk,rst,ctrl;
  
  output [2:0] count;
  
  reg [2:0] temp;
  assign count= temp;
  
  
  always@(posedge clk)
    begin
      if(rst)
        temp<= 3'b000;
      else if(ctrl)
        temp<= temp+1;
      else
        temp<= temp-1;
   
    end
endmodule

