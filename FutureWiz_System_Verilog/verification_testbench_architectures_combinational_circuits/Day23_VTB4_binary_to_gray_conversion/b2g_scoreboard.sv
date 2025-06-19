//scoreboard implementaion for binary to gray conversion

class b2g_scoreboard;
  b2g_transaction b2g_tr;
  mailbox mon2scb;
  
  //customized constructor
  function new(mailbox mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  //main task implementation
  task main();
    repeat(10) begin
       bit [3:0] expected;
      mon2scb.get(b2g_tr);
      // Compute expected Gray code using ternary/bitwise operators
     
      expected[3] = b2g_tr.bit_in[3];
      expected[2] = b2g_tr.bit_in[3] ^ b2g_tr.bit_in[2];
      expected[1] = b2g_tr.bit_in[2] ^ b2g_tr.bit_in[1];
      expected[0] = b2g_tr.bit_in[1] ^ b2g_tr.bit_in[0];

      if (b2g_tr.gray_out === expected)
        $display("TEST PASSED");
      else
        $error("TEST FAILED: Expected %b, Got %b", expected, b2g_tr.gray_out);

      b2g_tr.display("SCB_B2G");
    end
  endtask
endclass