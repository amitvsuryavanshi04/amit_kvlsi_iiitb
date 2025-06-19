// Code your testbench here
// or browse Examples
`include "prio_enco_test.sv"
`include "prio_enco_interface.sv"

module top;
  
  
  prio_enco dut (.i(inf.i),.d(inf.d));
  
  prio_enco_intf inf();
  
  prio_enco_test tb (inf);
  
  initial begin 
    $dumpfile("Dump.vcd");
    $dumpvars(0,top);
  end
endmodule