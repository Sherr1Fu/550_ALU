module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;

   /* YOUR CODE HERE */
	
	wire [31:0] w_decode;
	wire [31:0] ra_decode;
	wire [31:0] rb_decode;
	wire [31:0] en;
	wire [31:0] q[31:0];
	wire [31:0] zero;
   assign zero = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
	
	decoder5_32 decoder0(ctrl_writeReg,w_decode);
	decoder5_32 decoder1(ctrl_readRegA,ra_decode);
	decoder5_32 decoder2(ctrl_readRegB,rb_decode);
	
	genvar i;
	generate for (i=0;i<32;i=i+1) begin:enable_loop
	  and(en[i],ctrl_writeEnable,w_decode[i]);
	end
	endgenerate
	
	reg_32bit reg_32bit0(q[0],zero,clock,en[0],ctrl_reset);
	generate for (i=1;i<32;i=i+1) begin:regs_loop
	  reg_32bit reg_32bit0(q[i],data_writeReg,clock,en[i],ctrl_reset);
	end
	endgenerate
	
	generate for (i=0;i<32;i=i+1) begin:readA_loop
	  assign data_readRegA = ra_decode[i] ? q[i] : 32'bz;
	  assign data_readRegB = rb_decode[i] ? q[i] : 32'bz;
	end
	endgenerate
   //assign data_readRegA	=q[2];
	//assign data_readRegB =q[2];
		
	//assign data_readRegA=q[0];
	//reg_32bit reg_32bit0(data_readRegA,data_writeReg,clock,en,clr);
   //reg_32bit reg_32bit(q, d, clk, en, clr);
	//decoder5_32 decoder0(ctrl_writeReg,data_readRegA);
endmodule
