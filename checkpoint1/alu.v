module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	
	//addition & subtraction
	wire [31:0] wireB;
	wire cout;
	wire [31:0] inverse_B;
	
	genvar i;
	generate for (i=0;i< 32;i=i+1) begin: not_loop
	  not(inverse_B[i],data_operandB[i]);
	end
	endgenerate
	
	assign wireB = ctrl_ALUopcode[0]?inverse_B:data_operandB;
	CSA_32bit csa0_32(data_operandA,wireB,ctrl_ALUopcode[0],overflow,cout,data_result);

endmodule
