//memory based code 
 
module mem1;
//create a memory with 8 bit address line and 8 bit data line 
//approach  total bytes 2^8 = 256, and 8 bit address so declaration goes like this  
	reg [7:0]a[255:0]; //declaring the memory register
	initial begin 
	$display("The size of the memory is %0d",$size(a));
	end
endmodule
