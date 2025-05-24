module test_queue;
  //queue program 
  int q1[$]; //unbounded queue
  int q2[$:5]; //max element stored six bounded queue
  initial begin 
    
    //printing the queue 
    $display("Print the queue1: %p",q1);
    $display("Print the queue2: %p",q2);
    
    q1 = '{1,2,3,4,5,6,10,9};
    q2 = '{1,2,3,4,5,6};
    $display("Print the queue1 after initialize: %p",q1);
    $display("Print the queue2 after initialize: %p",q2);
    q2 = '{1,2,3,4,5,6,10,9};// insertion of beyond limit
    $display("Print the queue2 after going beyond limit, here 10,9 is ignored : %p",q2);
    
    //method to get size 
    $display("The size of q1 = %0d, size of q2 = %0d",q1.size,q2.size); //size method used to print the size of queues 
    
    //insert method action inserting elemnt in particular position 
     
    //insertion of extra element in q1
    q1.insert(3,50); //50 at 3rd index (index,value) 
    $display("The q1 after insertion of 50 is = %p",q1);
    
    //accessing the last index of queue 
    $display("The last element q = %0d",q1[$]);
    
    //deletion of the queues
    q1.delete();
    q2.delete(2);//particular element delete qn.delete(index_value)
    $display("Print the queue1 after deletion: %p",q1);
    $display("Print the queue2 after deletion: %p",q2);
    
    //foreach can't be used in queues for initialization , also associtative arrays 
  end
endmodule
