module alu(data_operandA, data_operandB, ctrl_ALUopcode, ctrl_shiftamt, data_result, isNotEqual, isLessThan, overflow);

   input [31:0] data_operandA, data_operandB;
   input [4:0] ctrl_ALUopcode, ctrl_shiftamt;

   output [31:0] data_result;
   output isNotEqual, isLessThan, overflow;

   // YOUR CODE HERE //
	wire [31:0] addsub_result,and_result,or_result,SLL_result,SRA_result,empty_result;
	
	//wire [5:0] select;
	//decoder3_8 selecter(ctrl_ALUopcode[2:0],select);
	
	//addition(00000) & subtraction(00001) overflow
	wire [31:0] wireB;
	wire cout;
	wire [31:0] inverse_B;
	
	genvar i;
	generate for (i=0;i< 32;i=i+1) begin: not_loop
	  not(inverse_B[i],data_operandB[i]);
	end
	endgenerate
	
	assign wireB = ctrl_ALUopcode[0]?inverse_B:data_operandB;
	CSA_32bit csa0_32(data_operandA,wireB,ctrl_ALUopcode[0],overflow,cout,addsub_result);
   
	//isNotEqual
	wire [30:0] notequal;
	genvar j;
	or(notequal[0],addsub_result[0],addsub_result[1]);
	generate for (j=0;j< 30;j=j+1) begin: notequal_loop
	  or(notequal[j+1],addsub_result[j+2],notequal[j]);
	end
	endgenerate
	or (isNotEqual,notequal[30],overflow);
	
	//isLessThan
	wire [1:0] less;
	and (less[0],~overflow,addsub_result[31]);
	and (less[1],data_operandA[31],~data_operandB[31]);
	or (isLessThan,less[0],less[1]);
	//assign isNotEqual = notequal[30];
	
	//and(00010)
	genvar k;
	generate for (k=0;k< 32;k=k+1) begin: and_loop
	  and(and_result[k],data_operandA[k], data_operandB[k]);
	end
	endgenerate
	//or(00011)
	genvar l;
	generate for (l=0;l< 32;l=l+1) begin: or_loop
	  or(or_result[l],data_operandA[l], data_operandB[l]);
	end
	endgenerate	
	
	//32bit SLL(00100) ctrl_shiftamt
	SLL sll(data_operandA,ctrl_shiftamt,SLL_result);
	//32bit SRA(00101) ctrl_shiftamt
	SRA sra(data_operandA,ctrl_shiftamt,SRA_result);
	//output
	selecter3_5 selecter(ctrl_ALUopcode[2:0],data_result,addsub_result,and_result,or_result,SLL_result,SRA_result,empty_result);
endmodule
