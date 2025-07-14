module test_fn_call_by_value;
  int a,b,c;
  function int add(int a,b);
    a = 50;
    b = 60;
    $display("Hi i am inside the function.");
    $display("Values inside function. a = %0d, b = %0d ",a,b);
    return a+b;
  endfunction
  
  initial begin 
    a = 10;
    b = 20;
    c = add(10,20); // calling of the funtion by value will give false values 
    $display("Values with call by value of function. a = %0d, b = %0d and a + b = %0d",a,b,c);
  end
endmodule 
