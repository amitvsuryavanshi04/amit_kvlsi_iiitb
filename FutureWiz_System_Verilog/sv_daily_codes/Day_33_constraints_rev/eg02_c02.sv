// Code your testbench here
// or browse Examples
//Question 02 
//write a constrain to print a patter as follow 001100110011.. etc.,
class seq_req;
    rand bit data[15:0];

    constraint cntr{foreach (data[i]) 
                        if(i % 4==0 || i % 4 == 1)
                            data[i] == 1;
                        else
                            data[i] == 0;
                            }
    function void display();
        $display("The pattern given as per the question:");
        foreach(data[i]) begin
            $write("%0b",data[i]);
        end
    endfunction

endclass

//testcase 
module test_case_constraint_00110011;
seq_req seq;
    initial begin 
        seq = new();
        seq.randomize();
        seq.display();
    end
endmodule


class cons_traint;
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
