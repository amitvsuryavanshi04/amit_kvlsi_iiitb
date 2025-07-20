//event example - 01 
module event_eg01;
    event a,b,c;
    task trigger_a;
        #10;
        -> a;
        $display("%t: Event 'a' is triggered.",$time);
    endtask

  //case 01 when the delay for the waiting and triggering is in condition such that (trig_time) > (waiting_time) then their is no race condition 
    //their is no race condition and both the tasks will be 
    //executed to display both the statements.
    task waiting;
        #5; 
        @(a); //waiting for the event ;
        $display("%t: Event 'a' is observed.",$time);
    endtask
  
  
  //case 02 when the delay for the waiting and triggering is in condition such that (trig_time) <= (waiting_time) then their is no race condition 
    //their is race condition and both the tasks will not be 
    //executed to display both the statements.
//     task waiting;
         #10; 
         @(a); //waiting for the event ;
         $display("%t: Event 'a' is observed.",$time);
     endtask

  
  //block to call out the tasks in a concurrent block like "fork ..... join"
    initial begin
        fork
            trigger_a;
            waiting;
        join
    end
endmodule
