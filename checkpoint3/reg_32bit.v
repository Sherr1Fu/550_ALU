module reg_32bit (q, d, clk, en, clr);

   input clk, clr,en;
   input [31:0] d;
   output [31:0] q;

   /* YOUR CODE HERE */
   genvar i;
	generate for (i=0;i<32;i=i+1) begin:reg_loop
	  dffe_ref dffe0(q[i],d[i],clk,en,clr);
	end
	endgenerate
endmodule