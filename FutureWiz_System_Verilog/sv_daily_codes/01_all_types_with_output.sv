//---------------------------different fork ........ join, join_any,join_none config and their codes 

//------------------------in the modules below the outputs are commented at the last 
module fork_test1;
initial begin
    for (int j = 0;j<3 ; j++ ) begin
        #1;
        fork
            $display(j);
        join_none
    end
end
endmodule :fork_test1
//output is 1,2,3 in new lines 
module fork_test2;
initial begin
    for (int j = 0;j<3 ; j++ ) begin
        //no delay
        fork
            $display(j);
        join_none
    end
end
endmodule :fork_test2
//output is 3,3, 3 in new lines 

module fork_test3;
initial begin
    for (int j = 0;j<3 ; j++ ) begin
        //no delay
        fork
            $display(j);
        join //if join and no delay 
    end
end
endmodule :fork_test3
//output is 0,1,2 in new lines 


module fork_test4;
initial begin
    for (int j = 0;j<3 ; j++ ) begin
        #1; 
        fork
            $display(j);
        join //if join and delay given 
    end
end
endmodule :fork_test4
//output is 0,1,2 in new lines 

module fork_test5;
initial begin
    for (int j = 0;j<3 ; j++ ) begin
        #1; 
        fork
            $display(j);
        join_any //if join_any and delay given 
    end
end
endmodule :fork_test5
//output is 0,1,2 in new lines 
module fork_test6;
initial begin
    for (int j = 0;j<3 ; j++ ) begin
        //no delay
        fork
            $display(j);
        join //if join and delay given 
    end
end
endmodule :fork_test6

//output is 0,1,2 