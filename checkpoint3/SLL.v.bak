module SLL(data,s,out);
  input [31:0] data;
  input [4:0] s;
  output [31:0] out;
  
//s0-1
  wire [31:0] wire0;
  mux mux0(data[0],0,s[0],wire0[0]);
	genvar i;
	generate for (i=1;i< 32;i=i+1) begin: s0_loop
	  mux mux1(data[i],data[i-1],s[0],wire0[i]);
	end
	endgenerate
//s1-2
  wire [31:0] wire1;
  mux mux2(wire0[0],0,s[1],wire1[0]);
  mux mux3(wire0[1],0,s[1],wire1[1]);
	//genvar i;
	generate for (i=2;i< 32;i=i+1) begin: s1_loop
	  mux mux4(wire0[i],wire0[i-2],s[1],wire1[i]);
	end
	endgenerate  
//s2-4
  wire [31:0] wire2;
	//genvar i;
	generate for (i=0;i< 4;i=i+1) begin: s2a_loop
	  mux mux5(wire1[i],0,s[2],wire2[i]);
	end
	endgenerate
	
	//genvar i;
	generate for (i=4;i< 32;i=i+1) begin: s2b_loop
	  mux mux6(wire1[i],wire1[i-4],s[2],wire2[i]);
	end
	endgenerate  
	
//s3-8

  wire [31:0] wire3;

	generate for (i=0;i< 8;i=i+1) begin: s3a_loop
	  mux mux7(wire2[i],0,s[3],wire3[i]);
	end
	endgenerate
	
	generate for (i=8;i< 32;i=i+1) begin: s3b_loop
	  mux mux8(wire2[i],wire2[i-8],s[3],wire3[i]);
	end
	endgenerate  

//s4-16

  wire [31:0] wire4;

	generate for (i=0;i< 16;i=i+1) begin: s4a_loop
	  mux mux9(wire3[i],0,s[4],wire4[i]);
	end
	endgenerate
	
	generate for (i=16;i< 32;i=i+1) begin: s4b_loop
	  mux mux10(wire3[i],wire3[i-16],s[4],wire4[i]);
	end
	endgenerate  
	
	assign out=wire4;
  
endmodule