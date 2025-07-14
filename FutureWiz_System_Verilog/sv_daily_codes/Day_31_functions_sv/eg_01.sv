//code for simple function with no call by value or ref
module test_fn;
  int a,b,c;
  function int add(int a,b);
    $display("Hi i am inside the function.");
    return a+b;
  endfunction
  
  initial begin 
    a = 10;
    b = 20;
    c = add(10,20); //simple calling of the funtion
    $display("Values with simple call of function. a = %0d, b = %0d and a + b = %0d",a,b,c);
  end
endmodule
