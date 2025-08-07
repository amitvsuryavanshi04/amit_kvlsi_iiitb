//quesiton:
//constraint to generate below pattern 5 -10 15 -20 25 -30


//solution:
class cons;
    rand int a[];
  constraint csize{a.size == 6;}
    constraint cdata{foreach (a[i])
                            if (i%2 == 0) 
                                a[i] == (i*5) + 5;
                             else
                                a[i] == -5*(i+1);
                            }
    function void post_randomize();
        $display("Required patter is %0p",a);
    endfunction
endclass
cons c;
module test ();
    initial begin
        c = new();
        assert(c.randomize());
    end
endmodule

/*
output:
Contains Synopsys proprietary information.
Compiler version U-2023.03-SP2_Full64; Runtime version U-2023.03-SP2_Full64;  Aug  6 05:33 2025
Required patter is '{5, -10, 15, -20, 25, -30} 
*/