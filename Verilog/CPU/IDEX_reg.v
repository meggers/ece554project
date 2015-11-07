module IDEX_reg
(
	// INPUTS
	clk, branch_in,
	call_in, ret_in, pop_in, 		// From CPU_control
	MemToReg_in, MemSrc_in,
	load_imm_in, RegWrite_in,
	MemWrite_in, MemRead_in,
	opcode_in,

	DestReg_in, I_type_imm_in,		// From Instruction Decode
	ALU_input_1_in, ALU_input_2_in,
	PC_in,

	// OUTPUTS
	branch_out, call_out, ret_out,
	pop_out, MemToReg_out, MemSrc_out,
	load_imm_out, RegWrite_out,
	MemWrite_out, MemRead_out,
	DestReg_out, opcode_out,
	I_type_imm_out, ALU_input_1_out,
	ALU_input_2_out, PC_out
);

//INPUTS/////////////////////////////

input			clk, branch_in, call_in,
			ret_in, pop_in, MemToReg_in, 
			MemSrc_in, load_imm_in,
			RegWrite_in, MemWrite_in,
			MemRead_in;

input [4:0]		DestReg_in;

input [5:0] 		opcode_in;

input [15:0]		I_type_imm_in;

input [31:0] 		ALU_input_1_in;
input [31:0] 		ALU_input_2_in;
input [31:0]		PC_in;

//OUTPUTS/////////////////////////////

output reg		branch_out, call_out,
			ret_out, pop_out, 
			MemToReg_out, MemSrc_out,
			load_imm_out, RegWrite_out,
			MemWrite_out, MemRead_out;

output reg [4:0]	DestReg_out;

output reg [5:0] 	opcode_out;

output reg [15:0]	I_type_imm_out;

output reg [31:0] 	ALU_input_1_out;
output reg [31:0] 	ALU_input_2_out;
output reg [31:0]	PC_out;

always @(posedge clk) begin

	branch_out	<= branch_in;
	call_out	<= call_in;
	ret_out		<= ret_in;
	pop_out		<= pop_in;
	MemToReg_out	<= MemToReg_in;
	MemSrc_out	<= MemSrc_in;
	load_imm_out	<= load_imm_in;
	RegWrite_out	<= RegWrite_in;
	MemWrite_out	<= MemWrite_in;
	MemRead_out	<= MemRead_in;
	DestReg_out	<= DestReg_in;
	opcode_out	<= opcode_in;
	I_type_imm_out	<= I_type_imm_in;
	ALU_input_1_out	<= ALU_input_1_in;
	ALU_input_2_out	<= ALU_input_2_in;
	PC_out		<= PC_in;

end

endmodule
