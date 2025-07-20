//event example - 02 assign a event into another event b
module event_eg02;
    event a,b,c;
    task trigger_a;
        #10;
        -> a;
        $display("%t: Event 'a' is triggered.",$time);
    endtask
  
  //task to assign the a event into another event b using a task 
  	task trigger_b;
      b = a; //assigning the event b into a 
    endtask 

    task waiting;
        #5; 
      	@(b); //waiting for the event ;
      $display("%t: Event 'b' is observed.",$time);
    endtask

    initial begin
        fork
            trigger_a;
          trigger_b;// this task has to be called out in the fashion to
          //assign the event b into a 
            waiting;
        join
    end
endmodule

