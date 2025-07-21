//question 04 write a constraints for the calculation of a factorial of a number 
class question04_fact;
  randc int unsigned num;
  randc int unsigned value;
  //constraint num value 
  constraint num_value{num inside {[1:20]};}
  constraint value_func{value == fun(num);};
  function automatic int fun(int num);
    if (num == 0)
      return 1;
    else 
      return num*fun(num - 1);
  endfunction
  
  //post randomize
  function void post_randomize();
    $display("The factorial of given num = %0d is value = %0d.",num,value);
  endfunction
endclass

///testcase for the question 04
module test_case_constraint_question04;
  question04_fact q04_fact;
  initial begin 
    repeat(25) begin
    q04_fact = new();
    q04_fact.randomize();
  end
  end
endmodule 
