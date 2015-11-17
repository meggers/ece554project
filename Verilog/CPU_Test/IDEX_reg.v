module IDEX_reg
(
	// INPUTS
	clk, branch_in,				// From CPU_control
	call_in, ret_in, pop_in, 		
	MemToReg_in, MemSrc_in,
	load_imm_in, RegWrite_in,
	MemWrite_in, MemRead_in,
	opcode_in, branch_cond_in,

	data_hazard, PC_hazard,			// From Hazard Detector

	DestReg_in,				// From Instruction Decode
	ALU_input_1_in, ALU_input_2_in,
	PC_in, MemWrite_data_in,

	// OUTPUTS
	branch_out, branch_cond_out, call_out,
	ret_out, pop_out, MemToReg_out, MemSrc_out,
	load_imm_out, RegWrite_out, MemWrite_out,
	MemRead_out, DestReg_out, opcode_out,
	ALU_input_1_out, ALU_input_2_out,
	PC_out, MemWrite_data_out
);

//INPUTS/////////////////////////////

input			clk, branch_in, call_in,
			ret_in, pop_in, MemToReg_in, 
			MemSrc_in, load_imm_in,
			RegWrite_in, MemWrite_in,
			MemRead_in;

input			data_hazard, PC_hazard;

input [1:0]		branch_cond_in;

input [4:0]		DestReg_in;

input [5:0] 		opcode_in;

input [31:0] 		ALU_input_1_in;
input [31:0] 		ALU_input_2_in;
input [31:0]		PC_in;
input [31:0]		MemWrite_data_in;

//OUTPUTS/////////////////////////////

output reg		branch_out, call_out,
			ret_out, pop_out, 
			MemToReg_out, MemSrc_out,
			load_imm_out, RegWrite_out,
			MemWrite_out, MemRead_out;

output reg [1:0]	branch_cond_out;

output reg [4:0]	DestReg_out;

output reg [5:0] 	opcode_out;

output reg [31:0] 	ALU_input_1_out;
output reg [31:0] 	ALU_input_2_out;
output reg [31:0]	PC_out;
output reg [31:0]	MemWrite_data_out;

// Needed to stop read after write hazards
reg data_hazard_ff;

always @(posedge clk) begin

	if (!data_hazard & !PC_hazard) begin

		branch_out		<= branch_in;
		branch_cond_out		<= branch_cond_in;
		call_out		<= call_in;
		ret_out			<= ret_in;
		pop_out			<= pop_in;
		MemToReg_out		<= MemToReg_in;
		MemSrc_out		<= MemSrc_in;
		load_imm_out		<= load_imm_in;
		RegWrite_out		<= RegWrite_in;
		MemWrite_out		<= MemWrite_in;
		MemRead_out		<= MemRead_in;
		DestReg_out		<= DestReg_in;
		opcode_out		<= opcode_in;
		ALU_input_1_out		<= ALU_input_1_in;
		ALU_input_2_out		<= ALU_input_2_in;
		PC_out			<= PC_in;
		MemWrite_data_out 	<= MemWrite_data_in;

	end

	//else if (PC_hazard

	else begin

		branch_out		<= branch_in;
		branch_cond_out		<= branch_cond_in;
		call_out		<= call_in;
		ret_out			<= ret_in;
		pop_out			<= 1'b0;
		MemToReg_out		<= 1'b0;
		MemSrc_out		<= 1'b0;
		load_imm_out		<= 1'b0;
		RegWrite_out		<= 1'b0;
		MemWrite_out		<= 1'b0;
		MemRead_out		<= 1'b0;
		if (PC_hazard)
			DestReg_out	<= 5'bzzzzz;
		else
			DestReg_out	<= DestReg_in;
		opcode_out		<= opcode_in;
		ALU_input_1_out		<= ALU_input_1_in;
		ALU_input_2_out		<= ALU_input_2_in;
		PC_out			<= PC_in;
		MemWrite_data_out 	<= MemWrite_data_in;

	end


end

/*
always @(posedge clk) begin

	if (clr_branch_hazard) begin
		branch_out	<= 1'b0;
	end
	else begin
		branch_out	<= branch_in;
	end
end
*/

always @(posedge clk) begin

	data_hazard_ff <= data_hazard;
	
end

endmodule
