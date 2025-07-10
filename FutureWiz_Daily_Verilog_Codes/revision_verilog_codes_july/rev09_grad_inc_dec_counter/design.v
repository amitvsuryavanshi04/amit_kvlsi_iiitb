//gradual increment and decrement counter 
module counter_gidc(clk,rst,count);
  input clk,rst;
  output reg [2:0] count;
  reg ctrl;
  
  always @(posedge clk or negedge rst)
    begin
      if(!rst)
        begin
        count= 3'b000;
          ctrl= 0;
        end
      else if(!ctrl)
        begin
        count= count+1;
          if(count==3)
            ctrl= 1;
        end
     else
       begin
        count= count-1;
         if(count==0)
            ctrl= 0;
        end
    end
endmodule
