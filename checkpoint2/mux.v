module mux(in1,in2,s,out);
  input in1,in2;
  input s;
  output out;
  
  assign out = s?in2:in1;
  
endmodule