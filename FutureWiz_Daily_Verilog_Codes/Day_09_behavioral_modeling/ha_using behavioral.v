module my_ha(input a,b,output reg s,c);
always @(a,b) //(sensitivity list)
begin 
    s = a^b; //procedural assignment (blocking assignement)
    c = a&b;
end
endmodule

