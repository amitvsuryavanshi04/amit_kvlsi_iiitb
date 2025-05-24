module test;
//dynamic array 
 int a[]; //declaration of 1-D DYNAMIC ARRAY
 initial begin 
 $display("Array is = %p",a); //`{} is printed 
 
 a = new[5];
 $display("new array = %p",a); //`{0,0,0,0,0}
 
 a = '{5,10,25,12,15}; //static initialization
 $display("new array = %p",a); //`{same array is printed }
 
 //reallocation of the memory 
 a = new[7](a);
 //printing after reallocation , copied prev values 
 $display("new array = %p",a); //`{5,10,25,12,15,0,0}
 
 a = new[10];//reallocation wit prev values deleted 
 $display("new array = %p",a); //`{0,0,0,0,0,0,0,0,0,0}; all ten locations are zero.
 
 a = '{1,2,3,4,5};
 $display("new array = %p",a); //print reduced array as `{1,2,3,4,5}
//delete 3 and insert another value
 a = {a[0:1],a[3:4]}; //deletion of 3 
$display("new array after deletion of 3 = %p",a);$display("new array = %p",a);

 a = {a[0:1],10,a[3:4]} ; //insertion of 10 in place of 3 
 $display("new array after insertion of 10= %p",a); 
//while insertion and deletion the values " ' " will be not present 
 
 a.delete();
 //the above statement deletes whole entire element not used in fixed array , 
 //separate elements deletion is not possible 
 //prints a blank array
 $display("new array = %p",a); //after deletion blank array `{} is printed 
 end 
 endmodule 