module RCA_16bit(dataA,dataB,Cin,Cout,Sum);
  input [15:0] dataA,dataB;
  input Cin;
  output Cout;
  output [15:0] Sum;
  
  wire c1,c2,c3;
  
  RCA rca0(dataA[3:0],dataB[3:0],Cin,c1,Sum[3:0]);
  RCA rca1(dataA[7:4],dataB[7:4],c1,c2,Sum[7:4]);
  RCA rca2(dataA[11:8],dataB[11:8],c2,c3,Sum[11:8]);
  RCA rca3(dataA[15:12],dataB[15:12],c3,Cout,Sum[15:12]);
  
endmodule