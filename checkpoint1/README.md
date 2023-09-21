# addsub-base
## Xueyi Fu
## netID: xf52

I build a 32bit adder/subtractor based on a 32bit CSA. Additon/Subtraction is controlled by the last bit of `ctrl_ALUopcode`.     
The input of the 32bit CSA is `data_operandA` , `wireB` and the last bit of `ctrl_ALUopcode`. `wireB` is also decided by the last bit of `ctrl_ALUopcode`.     
The 32bit CSA is combined by three 16bit RCAs and a 2 to 1 mux.