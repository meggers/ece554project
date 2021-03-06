`include "ALU.v"

module EX_Unit
(
	// INPUTS
	opcode, 
	RegWrite_in, MemWrite_in, MemRead_in,
	MemToReg_in, MemSrc_in, DestReg_in,
	ALU_input_1, ALU_input_2, branch_in,
	call_in, ret_in, pop_in, load_imm, I_type_imm,
	MemWrite_data_in,
		
	// OUTPUTS
	RegWrite_out, MemWrite_out, MemRead_out,
	MemToReg_out, MemSrc_out, DestReg_out,
	MemWrite_data_out, ALU_addr, NON_ALU_addr, PC_in,
	pop_out, branch_out, ret_out, N_out,Z_out,V_out,
	ALU_done, call_out
);
//ASSUMTIONS:
//	-All S type instructions will be executed outside of normal CPU pipe
//	{NOT ASSUMING THIS}-PC will have seperate adder for branch instructions

//INPUTS//////////////////////////////////////////////////////

//From Control via IFID register
input [5:0] 		opcode;	// Tells ALU what operation to complete

input			branch_in;	// Branch signal for PC branching AFTER
					// the new PC has been calculated (by ALU)

input			call_in;	// Changes destination register to SP
input			ret_in;

input			pop_in;		// Forwards SP update to register

input			load_imm;	// Selects 0 extended J_type_imm over ALU_out

input			RegWrite_in;	// Passed stright from IDEX to EXMEM
input			MemWrite_in;
input			MemRead_in;
input			MemToReg_in;
input			MemSrc_in;

//From Decode via IFID register
input [4:0]		DestReg_in;		// Destination register of ALU/Memory result
input [15:0] 		I_type_imm;		// Immediate field to be loaded into a register
input [31:0] 		PC_in;			// PC to be written to memory during call
input [31:0] 		ALU_input_1;		// ALU input 1
input [31:0] 		ALU_input_2;		// ALU input 2
input [31:0]		MemWrite_data_in;	// Data to be written to memory

//OUTPUTS/////////////////////////////////////////////////////

output			RegWrite_out;	// Passed straight to EXMEM from IDEX
output			MemWrite_out;
output			MemRead_out;
output			MemToReg_out;
output			MemSrc_out;
output			pop_out;
output			ret_out;
output			call_out;
output			ALU_done;

output [4:0] 		DestReg_out;		// (call | ret) = 0 -> DestReg_in
						//		  1 -> 0x1B (SP register)
output reg 	[31:0] 	ALU_addr;		// Calculated ALU address for memory access
output 		[31:0]	NON_ALU_addr;		// Non-calculated address for memory access
output reg 	[31:0] 	MemWrite_data_out;


output			branch_out;		// Sent to PC_control for branching
output 			N_out, Z_out, V_out;	// Set flags to send to FLAGS register

//INTERNAL CONTROL////////////////////////////////////////////

wire [31:0]		ALU_out;

assign DestReg_out 	= DestReg_in;
assign NON_ALU_addr	= ALU_input_1;
assign RegWrite_out 	= RegWrite_in;
assign MemWrite_out 	= MemWrite_in;
assign MemRead_out 	= MemRead_in;
assign MemToReg_out 	= MemToReg_in;
assign MemSrc_out 	= MemSrc_in;
assign branch_out	= branch_in;
assign pop_out		= pop_in;
assign call_out		= call_in;
assign ret_out		= ret_in;

//ARITHMETIC LOGIC UNIT///////////////////////////////////////

ALU ALU1(.N(N_out), .Z(Z_out), .V(V_out), .ALU_in1(ALU_input_1), .ALU_in2(ALU_input_2), .ALU_out(ALU_out), .opcode(opcode), .ALU_done(ALU_done));


//MUX: If instr. is LI, choose loaded immediate as output. Else, ALU_out is output.
always @(*) begin

	if (load_imm) begin
		ALU_addr = {6'b000000, I_type_imm};
	end
	else begin
		ALU_addr = ALU_out;
	end

end

//MUX: If instr. is call, the MemWrite_data is the PC. Else, data is ALU_input_2.
always @(*) begin
	
	if (call_in) begin
		MemWrite_data_out = PC_in;
	end
	else begin
		MemWrite_data_out = MemWrite_data_in;
	end
end
/*
//MUX: If instr. is call or ret, DestReg_out is the SP. Else, keep the DestReg_in.
always @(call, ret_in, DestReg_in) begin

	if (call | ret_in) begin
		DestReg_out = 5'h1D;
	end
	else begin
		DestReg_out = DestReg_in;
	end
end
*/

endmodule
