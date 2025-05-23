module test;
  int a[0:9]; //declaration of one dimension unpacked array 
  // 
  initial begin
    foreach (a[i]) 
      a[i] = i+1; // initialization using foreach loop
	  //or declaration can be made using 
	  // a = '{1,2,3,4,5,6,7,8,9,10}; 
	  // a[0] = 1;
	  //a[1] = 2; listing method 
    $display("The array a is =%p",a); //to print the values at a time 
  end
  
  //or printing in fashion 
  // $display("The element a[%d] = %d",i,a[i]); this line is foreach loop 
endmodule