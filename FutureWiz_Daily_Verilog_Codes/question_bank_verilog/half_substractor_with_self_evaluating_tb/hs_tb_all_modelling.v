module hs_df (input A, B, output Diff, Borrow);
  assign Diff   = A ^ B;         // difference
  assign Borrow = (~A) & B;      // borrow-out
endmodule
module hs_beh (input A, B, output reg Diff, Borrow);
  always @* begin
    Diff   = A ^ B;
    Borrow = (~A) & B;
  end
endmodule
module hs_str (input A, B, output Diff, Borrow);
  wire nA;
  not (nA, A);
  xor (Diff, A, B);
  and (Borrow, nA, B);
endmodule
//--------------testbench code 
module hs_tb;
  reg A,B;
  wire D_df,B_df,D_beh,B_beh,D_str,B_str;
  integer pass,total,i;

  hs_df  u1 (.A(A),.B(B),.Diff(D_df), .Borrow(B_df));
  hs_beh u2 (.A(A),.B(B),.Diff(D_beh),.Borrow(B_beh));
  hs_str u3 (.A(A),.B(B),.Diff(D_str),.Borrow(B_str));

  initial begin
    pass=0; total=0;
    $display("\nA B | Diff Borrow | Exp?  ");          // header
    $display("-----------------------------");
    for(i=0;i<4;i=i+1) begin
      {A,B}=i[1:0];  #1;
      total=total+1;
      if((D_df==D_beh)&&(D_df==D_str)&&(B_df==B_beh)&&(B_df==B_str))
        pass=pass+1;
      $display("%b %b |  %b     %b  |  %s",
               A,B,D_df,B_df,
               (D_df==D_beh)&&(D_df==D_str)&&(B_df==B_beh)&&(B_df==B_str)?"PASS":"FAIL");
    end
    $display("-----------------------------");
    $display("PASSED %0d / %0d\n",pass,total); $finish;
  end
endmodule

