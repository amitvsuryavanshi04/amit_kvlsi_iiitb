// fork..........join example 

module test_fork_join;
  initial begin 
    #1 $display("[%0t], the fork join block begins.", $time);
    
    fork 
      #5 $display("[%0t], The thread1 is executed.", $time);
      
      begin // the two statements belong to thread2
        #2 $display("[%0t], The thread2 1st statement is executed.", $time);
        #4 $display("[%0t], The thread2 2nd statement is executed.", $time);
      end
      //th3
      #10 $display("[%0t], The thread3 is executed.", $time);
    join //end of fork join block
    
    $display("[%0t], The fork join block is exited.", $time);
  end 
endmodule 