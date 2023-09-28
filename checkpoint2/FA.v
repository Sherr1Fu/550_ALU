module FA(a,b,cin,cout,sum);
  output cout,sum;
  input a,b,cin;
  
  wire s1,c1,c2;
  
  xor(s1,a,b);
  xor(sum,s1,cin);
  
  and(c1,s1,cin);
  and(c2,a,b);
  or(cout,c1,c2);
  
endmodule