module test_2d_dyn_array;
int a[][];
 	initial begin 
		$display("The array is = %p",a);
	a = new[3];
	foreach (a[i])
	a[i] = new[3];
	foreach(a[i,j])
	//$display("The array is = %p",a);
	$display("The array is a[%0d][%0d] = %0d",i,j,a[i][j]);
end
endmodule

