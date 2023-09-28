module SRA(data,s,out);
  input [31:0] data;
  input [4:0] s;
  output [31:0] out;

  
  wire sign;
  assign sign = data[31];
  //assign test = sign;
  
//s0-1
  wire [31:0] wire0;
  mux mux11(data[31],sign,s[0],wire0[31]);
	genvar i;
	generate for (i=30;i>=0;i=i-1) begin: s0_loop
	  mux mux12(data[i],data[i+1],s[0],wire0[i]);
	end
	endgenerate
//s1-2
  wire [31:0] wire1;
  mux mux13(wire0[31],sign,s[1],wire1[31]);
  mux mux14(wire0[30],sign,s[1],wire1[30]);
	//genvar i;
	generate for (i=29;i>=0;i=i-1) begin: s1_loop
	  mux mux15(wire0[i],wire0[i+2],s[1],wire1[i]);
	end
	endgenerate  
//s2-4
  wire [31:0] wire2;
	//genvar i;
	generate for (i=28;i< 32;i=i+1) begin: s2a_loop
	  mux mux16(wire1[i],sign,s[2],wire2[i]);
	end
	endgenerate
	
	//genvar i;
	generate for (i=0;i< 28;i=i+1) begin: s2b_loop
	  mux mux17(wire1[i],wire1[i+4],s[2],wire2[i]);
	end
	endgenerate  
	
//s3-8

  wire [31:0] wire3;

	generate for (i=32-8;i< 32;i=i+1) begin: s3a_loop
	  mux mux18(wire2[i],sign,s[3],wire3[i]);
	end
	endgenerate
	
	generate for (i=0;i< 32-8;i=i+1) begin: s3b_loop
	  mux mux19(wire2[i],wire2[i+8],s[3],wire3[i]);
	end
	endgenerate  

//s4-16

  wire [31:0] wire4;

	generate for (i=32-16;i< 32;i=i+1) begin: s4a_loop
	  mux mux20(wire3[i],sign,s[4],wire4[i]);
	end
	endgenerate
	
	generate for (i=0;i< 32-16;i=i+1) begin: s4b_loop
	  mux mux21(wire3[i],wire3[i+16],s[4],wire4[i]);
	end
	endgenerate  
	
	assign out=wire4;
  
endmodule