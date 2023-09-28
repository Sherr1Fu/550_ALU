module decoder3_8(opcode,out);
  input [2:0] opcode;
  output [5:0] out;
  wire [5:0] w;
  //out0
  and(w[0],~opcode[0],~opcode[1]);
  and(out[0],w[0],~opcode[2]);
  //out1
  and(w[1],opcode[0],~opcode[1]);
  and(out[1],w[1],~opcode[2]);
  //out2
  and(w[2],~opcode[0],opcode[1]);
  and(out[2],w[2],~opcode[2]);
  //out3
  and(w[3],opcode[0],opcode[1]);
  and(out[3],w[3],~opcode[2]);
  //out4
  and(w[4],~opcode[0],~opcode[1]);
  and(out[4],w[4],opcode[2]);
  //out5
  and(w[5],opcode[0],~opcode[1]);
  and(out[5],w[5],opcode[2]);
  
endmodule
