module tlatch(t,clk,rst,q);
    input t,clk,rst;
    output reg q;
    reg q_int; //an internal temp variable just to store the value of t
    // reason to add o/p port can't be bidirectional , hence we use an 
    //extra wire as q_int to store the prev value or say 'q'
    always @(t,clk,rst) begin
        if (!clk)
            if (rst)
                q_int <= 1'b0;
              else if(t)
                q_int <= !q_int;
            else
                q_int <= q_int;
            q <= q_int;

    end
endmodule