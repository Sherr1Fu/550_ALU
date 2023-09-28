# checkpoint2
### Xueyi Fu
### netID: xf52

I build a 32bit adder/subtractor based on a 32bit CSA. Additon/Subtraction is controlled by the last bit of `ctrl_ALUopcode`.  The input of the 32bit CSA is `data_operandA` , `wireB` and the last bit of `ctrl_ALUopcode`. `wireB` is also decided by the last bit of `ctrl_ALUopcode`.     The 32bit CSA is combined by three 16bit RCAs and a 2 to 1 mux.   
   
I used `or` gate to determine `isNotEqual`. If every bit of the result of adder/subtractor is 0 and overflow is also 0, these two operands are equal, which means `isNotEqual` will be high if a '1' exists.    
  
I used `and` gate and `or` gate to determine `isLessThan`. If the most significant bit of adder/subtractor's result is 1 and overflow is 0, or the most significant bit of `data_operandA` is 1 and this bit of `data_operandB` is 0, `isLessThan` will be high.  
  
The operations `and` and `or` are both built by 'generate for'.  `and` gate is used to compute every bit of these two operands in the `and` operation while `or` gate is used in the `or` operation.  
  
I used mux to build SLL and SRA. `ctrl_shiftamt` has 5 bits. So ctrl_shiftamt[0] is set as 1 bit shift,  ctrl_shiftamt[1] is set as 2 bit shift,  ctrl_shiftamt[2] is set as 4 bit shift, and so on. When building SRA, I used a `sign` to record the most significant bit of the operand. And then used it to fill the bits.  
  
Finally, I used a 5 to 1 mux to select which result I wanted to show.
### self-designed module:
`selecter3_5:`  select one from the five inputs as output.  
`CSA_32bit:`  32 bits CSA adder.  
`RCA_16bit:`  16 bits RCA adder.
`RCA:`  4 bits RCA adder.  
`FA:`  1 bit full adder.  
`mux:`  select one from the two inputs as output.  
`SLL:`  logical left-shift.  
`SRA:`  arithmetic right-shift.