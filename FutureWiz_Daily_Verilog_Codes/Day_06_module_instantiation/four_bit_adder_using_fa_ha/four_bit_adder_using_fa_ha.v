//hal_adder code
module ha(a,b,s,c);
input a,b;
output s,c;
assign s = a^b;
assign c = a&b;
endmodule

//full_adder_using_half_adder
module full_adder_file(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
wire w1,w2,w3;
ha h1(.a(a),.b(b),.s(w1),.c(w2));
ha h2(.a(w1),.b(cin),.s(sum),.c(w3));
or o1(cout,w3,w2);
endmodule

//four_bit adder (top_module)
module four_bit_adder(a,b,cin,s,cout);
input [3:0]a;
input [3:0]b;
input cin;
output [3:0]s;
output cout;
wire [2:0]c;
full_adder_file fa1(.a(a[0]),.b(b[0]),.cin(cin),.sum(s[0]),.cout(c[0]));
full_adder_file fa2(.a(a[1]),.b(b[1]),.cin(c[0]),.sum(s[1]),.cout(c[1]));
full_adder_file fa3(.a(a[2]),.b(b[2]),.cin(c[1]),.sum(s[2]),.cout(c[2]));
full_adder_file fa4(.a(a[3]),.b(b[3]),.cin(c[2]),.sum(s[3]),.cout(cout));
endmodule
//note: the above modules are to be kept in the separate files and included using 
//`include"filename.v" enclosure