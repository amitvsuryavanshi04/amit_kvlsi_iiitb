///question 05 generate the pattern 001002003004
class question05_pattern;
  randc int pat[12];
  constraint c1{ foreach (pat[i])
    if(i % 3 == 2)
      pat[i] == (i/3) + 1;
    else 
      pat[i] == 0;
               }
  
  //mehod for diaplaying the pattern
  function void display();
    $display("The required pattern is as per given.");
    foreach (pat[i]) begin 
      $write("%0d",pat[i]);
    end
  endfunction
endclass

//testcase 
module test_case_question05_pattern;
  question05_pattern q05_pat;
  initial begin 
    q05_pat = new();
    q05_pat.randomize();
    q05_pat.display();
  end
endmodule
