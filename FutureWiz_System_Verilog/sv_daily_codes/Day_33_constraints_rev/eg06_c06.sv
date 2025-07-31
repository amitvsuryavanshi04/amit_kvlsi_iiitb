//Question: Write a constraint to Randomly Generate 4kb aligned address

class cnstr;
	rand int unsigned addr;
	constraint c1_addr{addr%4096==0;}
	
	function void display();
		$display("The addr = %0d",addr);
	endfunction
endclass

module tb;
	cnstr cn;
	initial begin
		cn = new();
		cn.randomize();
		cn.display();
	end
endmodule
