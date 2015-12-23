`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:37 11/13/2015 
// Design Name: 
// Module Name:    EX_Unit 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module EX_Unit
(
	// INPUTS
	opcode, 
	RegWrite_in, MemWrite_in, MemRead_in,
	MemToReg_in, MemSrc_in, DestReg_in,
	ALU_input_1, ALU_input_2, branch_in,
	call_in, ret_in, pop_haz_in,
	load_imm, MemWrite_data_in,
	EX_forward_src_in1,
	EX_forward_src_in2,
	MEM_ALUfrwd_data,
	WB_ALUfrwd_data,
	MEM_Memfrwd_data,
	EXMEM_ALU_addr,
		
	// OUTPUTS
	RegWrite_out, MemWrite_out, MemRead_out,
	MemToReg_out, MemSrc_out, DestReg_out,
	MemWrite_data_out, ALU_addr, NON_ALU_addr,
	reg_1_data, PC_in, branch_out, ret_out,
	N_out, Z_out, V_out,
	ALU_done, call_out
);
//ASSUMTIONS:
//	-All S type instructions will be executed outside of normal CPU pipe
//	{NOT ASSUMING THIS}-PC will have seperate adder for branch instructions

//INPUTS//////////////////////////////////////////////////////

//From Control via IFID register
input [4:0] opcode;			// Tells ALU what operation to complete

input			branch_in;		// Branch signal for PC branching AFTER
									// the new PC has been calculated (by ALU)

input			call_in;			// Changes destination register to SP
input			ret_in;

input 		pop_haz_in;

input			load_imm;		// Selects 0 extended J_type_imm over ALU_out

input			RegWrite_in;	// Passed stright from IDEX to EXMEM
input			MemWrite_in;
input			MemRead_in;
input			MemToReg_in;
input			MemSrc_in;

//From Decode via IFID register
input [4:0]		DestReg_in;			// Destination register of ALU/Memory result
input [31:0] 	PC_in;				// PC to be written to memory during call
input [31:0] 	ALU_input_1;		// ALU input 1
input [31:0] 	ALU_input_2;		// ALU input 2
input [31:0]	MemWrite_data_in;	// Data to be written to memory

//FOR DATA FORWARDING
input [1:0] 	EX_forward_src_in1; 
input [1:0]		EX_forward_src_in2;
input [31:0]	MEM_ALUfrwd_data;
input [31:0]	WB_ALUfrwd_data;
input [31:0]	MEM_Memfrwd_data;

input [31:0]	EXMEM_ALU_addr;

//OUTPUTS/////////////////////////////////////////////////////

output			RegWrite_out;	// Passed straight to EXMEM from IDEX
output			MemWrite_out;
output			MemRead_out;
output			MemToReg_out;
output			MemSrc_out;
output			ret_out;
output			call_out;

output			ALU_done;

output [4:0] 			DestReg_out;		// (call | ret) = 0 -> DestReg_in
													//		  1 -> 0x1B (SP register)
output reg 	[31:0] 	ALU_addr;			// Calculated ALU address for memory access
output 		[11:0]	NON_ALU_addr;		// Non-calculated address for memory access
output	 	[31:0] 	MemWrite_data_out;
output		[31:0]	reg_1_data;


output			branch_out;					// Sent to PC_control for branching
output 			N_out, Z_out, V_out;		// Set flags to send to FLAGS register

//INTERNAL CONTROL////////////////////////////////////////////

wire [31:0]		ALU_out;
wire [31:0]		ALU_mux_in1, ALU_mux_in2;

assign reg_1_data		= ALU_mux_in1;
assign NON_ALU_addr	= ALU_mux_in1[11:0];
assign MemWrite_out 	= MemWrite_in;
assign MemRead_out 	= MemRead_in;
assign MemToReg_out 	= MemToReg_in;
assign MemSrc_out 	= MemSrc_in;
assign branch_out		= branch_in;
assign call_out		= call_in;
assign ret_out			= ret_in;

//ALU input for Data Forward//////////////////////////////////

//MUX: ALU_in1
assign ALU_mux_in1 = (EX_forward_src_in1 == 2'b01) ? MEM_ALUfrwd_data:
							(EX_forward_src_in1 == 2'b10) ? WB_ALUfrwd_data:
							(EX_forward_src_in1 == 2'b11) ? MEM_Memfrwd_data:
							ALU_input_1;

//MUX: ALU_in2
assign ALU_mux_in2 = (EX_forward_src_in2 == 2'b01) ? MEM_ALUfrwd_data:
							(EX_forward_src_in2 == 2'b10) ? WB_ALUfrwd_data:
							(EX_forward_src_in2 == 2'b11) ? MEM_Memfrwd_data:
						    ALU_input_2;
							  
assign MemWrite_data_out = (call_in) ? PC_in:
									(EX_forward_src_in2 == 2'b01) ? MEM_ALUfrwd_data:
									(EX_forward_src_in2 == 2'b10) ? WB_ALUfrwd_data:
									(EX_forward_src_in2 == 2'b11) ? MEM_Memfrwd_data:
									MemWrite_data_in;

assign DestReg_out	= (pop_haz_in) ? 5'b11101 : DestReg_in;

assign RegWrite_out	= (pop_haz_in) ? 1'b1 : RegWrite_in;

//ARITHMETIC LOGIC UNIT///////////////////////////////////////

ALU ALU1(.N(N_out), .Z(Z_out), .V(V_out), .ALU_in1(ALU_mux_in1), .ALU_in2(ALU_mux_in2), .ALU_out(ALU_out), .opcode(opcode), .ALU_done(ALU_done));


//MUX: If instr. is LI, choose loaded immediate as output. Else, ALU_out is output.
always @(*) begin

	if (load_imm) begin
		ALU_addr = ALU_input_2; //sign extended imm
	end
	else if(pop_haz_in)begin
		ALU_addr = EXMEM_ALU_addr;
	end
	else begin
		ALU_addr = ALU_out;
	end

end

endmodule