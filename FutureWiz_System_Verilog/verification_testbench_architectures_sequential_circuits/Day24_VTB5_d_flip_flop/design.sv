// Code your design here
module dff_dut(dff_intf vif);
  
  always@(posedge vif.clk)// use interface variables in design itself
    begin
      if(vif.rst==1'b1)
        vif.dout <= 1'b0;
      else
        vif.dout <= vif.din;
    end
endmodule

// interface definition in the testbench itself
interface dff_intf;
logic clk,rst;
logic din;
logic dout;
  
endinterface