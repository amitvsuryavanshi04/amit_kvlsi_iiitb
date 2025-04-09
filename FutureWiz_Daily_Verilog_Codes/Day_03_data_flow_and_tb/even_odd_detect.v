module even_odd_detect(i,yo,ye); //declaring the module
  input [2:0]i; // declaring the input and output variables
  output yo,ye;
  assign y_odd = i[0]; //odd detection 
  assign y_even = ~i[0]; // even detection 
endmodule 
