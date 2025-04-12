// Code your design here
module mux41_gate(i,s,y);
  input [3:0]i;
  input [1:0]s;
  output y;

  //data flow execution
  assign y = (i[0]&(~s[1])&(~s[0]))|(i[1]&(~s[1])&s[0])|(i[2]&(s[1])&(~s[0]))|(i[3]&(s[1])&s[0]);
endmodule
