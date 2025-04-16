module mux21_design(i,s,y);
    input [1:0]i;
    input s;
    output y;
    assign y = (s) ? i[1] : i[0];
endmodule