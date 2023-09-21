module CSA_32bit(dataA,dataB,Cin,Ovf,Cout,Sum);
  input [31:0] dataA,dataB;
  input Cin;
  output Ovf,Cout;
  output [31:0] Sum;
  
  wire [15:0] sum1,sum0;
  wire cout1,cout0,select;
  wire inverse_dataA31,inverse_dataB31,inverse_sum31,and1,and2;
  
  RCA_16bit rca0_16(dataA[31:16],dataB[31:16],1,cout1,sum1);
  RCA_16bit rca1_16(dataA[31:16],dataB[31:16],0,cout0,sum0);
  RCA_16bit rca2_16(dataA[15:0],dataB[15:0],Cin,select,Sum[15:0]);
  
  assign Sum[31:16]=select?sum1:sum0;
  assign Cout=select?cout1:cout0;
  
  not(inverse_dataA31,dataA[31]);
  not(inverse_dataB31,dataB[31]);
  not(inverse_sum31,Sum[31]);
  and(and1,dataA[31],dataB[31],inverse_sum31);
  and(and2,inverse_dataA31,inverse_dataB31,Sum[31]);
  or(Ovf,and1,and2);
  //assign Ovf= dataA[31]&dataB[31]&~Sum[31]|~dataA[31]&~dataB[31]&Sum[31];
endmodule