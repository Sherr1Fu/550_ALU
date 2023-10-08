module SLL(data,s,out);
  input [31:0] data;
  input [4:0] s;
  output [31:0] out;
  
//s0-1
  wire [31:0] wire0;
  assign wire0[0]= s[0]?0:data[0];
 // mux mux0(data[0],0,s[0],wire0[0]);
	genvar i;
	generate for (i=1;i< 32;i=i+1) begin: s0_loop
	  assign wire0[i]=s[0]?data[i-1]:data[i];
	  //mux mux1(data[i],data[i-1],s[0],wire0[i]);
	end
	endgenerate
//s1-2
  wire [31:0] wire1;
  assign wire1[0]=s[1]?0:wire0[0];
  assign wire1[1]=s[1]?0:wire0[1];
  //mux mux2(wire0[0],0,s[1],wire1[0]);
  //mux mux3(wire0[1],0,s[1],wire1[1]);
	//genvar i;
	generate for (i=2;i< 32;i=i+1) begin: s1_loop
	  assign wire1[i]=s[1]?wire0[i-2]:wire0[i];
	  //mux mux4(wire0[i],wire0[i-2],s[1],wire1[i]);
	end
	endgenerate  
//s2-4
  wire [31:0] wire2;
	//genvar i;
	generate for (i=0;i< 4;i=i+1) begin: s2a_loop
	  assign wire2[i]=s[2]?0:wire1[i];
	  //mux mux5(wire1[i],0,s[2],wire2[i]);
	end
	endgenerate
	
	//genvar i;
	generate for (i=4;i< 32;i=i+1) begin: s2b_loop
	  assign wire2[i]=s[2]?wire1[i-4]:wire1[i];
	  //mux mux6(wire1[i],wire1[i-4],s[2],wire2[i]);
	end
	endgenerate  
	
//s3-8

  wire [31:0] wire3;

	generate for (i=0;i< 8;i=i+1) begin: s3a_loop
	  assign wire3[i]=s[3]?0:wire2[i];
	  //mux mux7(wire2[i],0,s[3],wire3[i]);
	end
	endgenerate
	
	generate for (i=8;i< 32;i=i+1) begin: s3b_loop
	  assign wire3[i]=s[3]?wire2[i-8]:wire2[i];
	  //mux mux8(wire2[i],wire2[i-8],s[3],wire3[i]);
	end
	endgenerate  

//s4-16

  wire [31:0] wire4;

	generate for (i=0;i< 16;i=i+1) begin: s4a_loop
	  assign wire4[i]=s[4]?0:wire3[i];
	  //mux mux9(wire3[i],0,s[4],wire4[i]);
	end
	endgenerate
	
	generate for (i=16;i< 32;i=i+1) begin: s4b_loop
	  assign wire4[i]=s[4]?wire3[i-16]:wire3[i];
	  //mux mux10(wire3[i],wire3[i-16],s[4],wire4[i]);
	end
	endgenerate  
	
	assign out=wire4;
  
endmodule