// Code your design here
//Code written by Amit 
//Roll No:- KVLSI2501033
module test;
  wire a;
  reg b;
  integer c;
  real d;
  time e;
  realtime f;
  wire [4]A;
  reg [4]B;
//declaration of datatypes
  initial begin
    $display("The default value of wire is = %0d,default size of wire is = %0d",a,$bits(a));
    $display("The default value of reg is = %0d,default size of reg is = %0d",b,$bits(b));
    $display("The default value of integer is = %0d,default size of integer is = %0d",c,$bits(c));
    $display("The default value of real is = %0f",d);
    $display("The default value of time is = %0d,The defalut size of time is = %0d",e,$bits(e));
    $display("The default value of realtime is = %0f",f);
    $display("The default value of wire is = %0d,default size of wire is = %0d",A,$bits(A));
    $display("The default value of reg is = %0d,default size of reg is = %0d",B,$bits(B));
//displaying the default values of the datatypes and the current sizes ...
  end 
endmodule
