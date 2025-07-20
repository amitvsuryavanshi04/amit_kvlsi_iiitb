//Question 03: Their is an 8 bit vector bit[7:0] data_in which takes some
//random variables value. write a constraint such that everytime it's randomized total number
//of bits toggled in data_in vector.


class cons_traint_question2;
    rand bit[7:0]data_in;
    rand bit[7:0]prev_data;

    function void pre_randomize();
        prev_data = data_in; //the generated data is put into prev data
    endfunction

  constraint c1{data_in!=prev_data;}
  constraint c2{$countones(data_in^prev_data) == 5;}

    function void display();
        $display("data_in = %0b and prev_data = %0b",data_in,prev_data);
        //displays the values of data_in and prev_data
    endfunction
endclass

//testcase for question 02

module test_case_constraint_question2;
    cons_traint_question2 cnt;
        initial begin 
            cnt = new();
            cnt.randomize();
            cnt.display();
        end
endmodule
