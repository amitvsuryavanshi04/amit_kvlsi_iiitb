module test_fn_call_by_ref;
  int a,b,c;
  function int add(ref int a,ref int b);// same code but only ref keyword is need to be added 
    a = 50;
    b = 60;
    $display("Hi i am inside the function.");
    $display("Values inside function. a = %0d, b = %0d ",a,b);
    return a+b;
  endfunction
  
  initial begin 
    a = 10;
    b = 20;//10,20 values over written with 50,60 to give sum 110 
    $display("Values outside function. a = %0d, b = %0d ",a,b);
    c = add(a,b); // calling of the funtion by ref will give true values add(10,20 not even allowed )
    $display("Values with call by referenece. a = %0d, b = %0d and a + b = %0d",a,b,c);
  end
endmodule
