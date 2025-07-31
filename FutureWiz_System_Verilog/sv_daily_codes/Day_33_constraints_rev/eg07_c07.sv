//Questions: Generate random ones and zeros using queue with size 15 and remove 1's 
in that output becomes ?

//Solution
class qu1rem;
	rand bit que[$];
	constraint que_size{que.size == 15;}
	constraint que_val{
	foreach(que[i])
		que[i] inside {[0:1]};
	}
	
	function void post_randomize();$display("The initialy que is:%0p ",que);
		$write("The output after remove ones in queue is:");
			foreach(que[i])begin
				if(que[i]==1)
					continue;
				else
					$write("%0b ",que[i]);
				end
	endfunction
endclass

module tb;
	qu1rem rem;
	initial begin
		rem=new();
		rem.randomize();
	end
endmodule
