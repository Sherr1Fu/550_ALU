module selecter3_5(opcode,out,in0,in1,in2,in3,in4,in5);
  input [2:0] opcode;
  input [31:0] in0,in1,in2,in3,in4,in5;
  output [31:0] out;
  wire [5:0] w;
  
  assign out = opcode[2]?(opcode[1]?in5:(opcode[0]?in4:in3)):(opcode[1]?(opcode[0]?in2:in1):in0);
  
endmodule
