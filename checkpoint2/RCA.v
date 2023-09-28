module RCA(a,b,cin,cout,sum);
  
  output [3:0] sum;
  output cout;
  input [3:0] a;
  input [3:0] b;
  input cin;
  
  wire c1,c2,c3;
  
  FA fa0(a[0],b[0],cin,c1,sum[0]);
  FA fa1(a[1],b[1],c1,c2,sum[1]);
  FA fa2(a[2],b[2],c2,c3,sum[2]);
  FA fa3(a[3],b[3],c3,cout,sum[3]);

endmodule