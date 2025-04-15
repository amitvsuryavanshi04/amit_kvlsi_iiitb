module pali_detect_ter(i,y);
    input [2:0]i;
    output y;
    assign y = (i[0] === i[1]) ? 1'b1:1'b0; //use === case equality for 
    //comparing the x and z case as well 
endmodule