`include "prio_enco_environment.sv"

module prio_enco_test(prio_enco_intf inf);
  prio_enco_environment env;
  
  initial begin
    env=new(inf);
    env.run();
  end
endmodule