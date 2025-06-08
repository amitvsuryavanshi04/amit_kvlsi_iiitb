module fs_df (input A,B,Bin, output Diff,Bout);
  assign Diff  = A ^ B ^ Bin;
  assign Bout  = (~A & (B | Bin)) | (B & Bin);
endmodule

module fs_beh (input A,B,Bin, output reg Diff,Bout);
  always @* begin
    Diff = A ^ B ^ Bin;
    Bout = (~A & (B | Bin)) | (B & Bin);
  end
endmodule

// reuse structural half-subtractor
module hs_cell (input A,B, output D,Borrow); // tiny local cell
  wire nA;
  not (nA,A);
  xor (D, A, B);
  and (Borrow, nA, B);
endmodule

module fs_str (input A,B,Bin, output Diff,Bout);
  wire d1, b1, b2;
  hs_cell hs1 (.A(A), .B(B),   .D(d1), .Borrow(b1)); // A-B
  hs_cell hs2 (.A(d1),.B(Bin), .D(Diff), .Borrow(b2)); // (A-B)-Bin
  or (Bout, b1, b2);
endmodule

//-----testbench code -----selfchecking//
module fs_tb;
  reg A,B,Bin;
  wire D_df,B_df,D_beh,B_beh,D_str,B_str;
  integer pass,total,i;

  fs_df  u1 (.A(A),.B(B),.Bin(Bin),.Diff(D_df), .Bout(B_df));
  fs_beh u2 (.A(A),.B(B),.Bin(Bin),.Diff(D_beh),.Bout(B_beh));
  fs_str u3 (.A(A),.B(B),.Bin(Bin),.Diff(D_str),.Bout(B_str));

  initial begin
    pass=0; total=0;
    $display("\nA B Bin | Diff Bout | Result");
    $display("--------------------------------");
    for(i=0;i<8;i=i+1) begin
      {A,B,Bin}=i[2:0];  #1;
      total=total+1;
      if(D_df==D_beh && D_df==D_str && B_df==B_beh && B_df==B_str)
        pass=pass+1;
      $display("%b %b  %b  |  %b    %b  |  %s",
               A,B,Bin,D_df,B_df,
               (D_df==D_beh && D_df==D_str && B_df==B_beh && B_df==B_str)?"PASS":"FAIL");
    end
    $display("--------------------------------");
    $display("PASSED %0d / %0d\n",pass,total); $finish;
  end
endmodule

