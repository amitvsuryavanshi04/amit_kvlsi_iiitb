//write a constraint to generate below pattern 010101010....
class cons;
    rand int a[];
    constraint c1{a.size == 10;}
    constraint c2{foreach (a[i])
                            if (i%2 == 0) 
                                a[i] == 0;
                            else
                                a[i] == 1;
                            }
    function void post_randomize();
        $display("Randomized data is %0p",a);
    endfunction
endclass

cons c;
module top;
    initial begin
        c = new();
        assert (c.randomize()); 
        
    end
endmodule

/*

Ouptut:
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Aug  6 05:27 2025
Randomized data is '{0, 1, 0, 1, 0, 1, 0, 1, 0, 1} 
           V C S   S i m u l a t i o n   R e p o r t 
*/

