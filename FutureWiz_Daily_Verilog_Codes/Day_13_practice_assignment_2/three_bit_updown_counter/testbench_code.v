// Code your testbench here
// or browse Examples
module test;
  
  reg clk,rst,ctrl;
  wire [2:0] count;
  
  counter dut(clk,rst,ctrl,count);
  
  initial begin
    clk= 0;
    rst= 1;
    #13 rst= 0;
    ctrl= 1;
    #50 ctrl=0;
    #20 ctrl= 1;
    #100 $finish;
  end
     
    
    always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
endmodule