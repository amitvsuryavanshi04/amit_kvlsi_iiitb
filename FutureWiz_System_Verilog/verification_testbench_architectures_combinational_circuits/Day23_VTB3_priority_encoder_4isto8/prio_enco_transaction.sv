class prio_enco_transaction;
  
  rand bit [3:0]i;
  bit [1:0] d;

  function void display(string name);
    $display("[%s] : I=%b D=%b",name,i,d);    
  endfunction
endclass
