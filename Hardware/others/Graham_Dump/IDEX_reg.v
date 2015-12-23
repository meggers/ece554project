`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:06 11/13/2015 
// Design Name: 
// Module Name:    IDEX_reg 
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

module IDEX_reg
(
	// INPUTS
	clk, rst,						// From CPU_control			
	branch_in, call_in, ret_in,		
	MemToReg_in, MemSrc_in,
	load_imm_in, RegWrite_in,
	MemWrite_in, MemRead_in,
	opcode_in, branch_cond_in,

	data_hazard,					// From Hazard Detector
	PC_hazard,
	pop_haz_in,

	DestReg_in,						// From Instruction Decode
	ALU_input_1_in,
	ALU_input_2_in,
	PC_in, MemWrite_data_in,
	Read_Reg_1_en_in,
	Read_Reg_2_en_in,
	reg_read_addr1_in,
	reg_read_addr2_in,
	jreg_in,
	
	clr_ret_hazard,				// From PC_control

	// OUTPUTS
	branch_out, branch_cond_out, call_out,
	ret_out, MemToReg_out, MemSrc_out,
	load_imm_out, RegWrite_out, MemWrite_out,
	MemRead_out, DestReg_out, opcode_out,
	ALU_input_1_out, ALU_input_2_out,
	PC_out, MemWrite_data_out,
	
	Read_Reg_1_en_out,			// Truelove added
	Read_Reg_2_en_out,
	reg_read_addr1_out,
	reg_read_addr2_out,
	pop_haz_out,
	jreg_out
	
);

//INPUTS/////////////////////////////

input				clk, rst,
					branch_in,
					call_in,
					ret_in,
					jreg_in,
					MemToReg_in, MemSrc_in, 
					load_imm_in, RegWrite_in,
					MemWrite_in, MemRead_in;

input				data_hazard, PC_hazard, pop_haz_in;

input [1:0]		branch_cond_in;

input [4:0]		DestReg_in;

input [4:0] 	opcode_in;

input [31:0] 	ALU_input_1_in;
input [31:0] 	ALU_input_2_in;
input [31:0]	PC_in;
input [31:0]	MemWrite_data_in;

input [4:0] 	reg_read_addr1_in;
input [4:0]		reg_read_addr2_in;
input				Read_Reg_1_en_in;
input				Read_Reg_2_en_in;

input				clr_ret_hazard;

//OUTPUTS/////////////////////////////

output reg		branch_out,
					call_out,
					ret_out, 
					jreg_out,
					MemToReg_out, MemSrc_out,
					load_imm_out, RegWrite_out,
					MemWrite_out, MemRead_out;

output reg [1:0]	branch_cond_out;

output reg [4:0]	DestReg_out;

output reg [4:0] 	opcode_out; //<--- MSB is always 1

output reg [31:0] ALU_input_1_out;
output reg [31:0] ALU_input_2_out;
output reg [31:0]	PC_out;
output reg [31:0]	MemWrite_data_out;

output reg [4:0]	reg_read_addr1_out;
output reg [4:0]	reg_read_addr2_out;

output reg			Read_Reg_1_en_out;
output reg			Read_Reg_2_en_out;

output reg			pop_haz_out;

always @(posedge clk) begin

	if (!rst & !data_hazard & !PC_hazard & !pop_haz_in) begin

		MemToReg_out			<= MemToReg_in;
		MemSrc_out				<= MemSrc_in;
		load_imm_out			<= load_imm_in;
		RegWrite_out			<= RegWrite_in;
		MemWrite_out			<= MemWrite_in;
		MemRead_out				<= MemRead_in;
		DestReg_out				<= DestReg_in;

	end

	else begin


		MemToReg_out			<= 1'b0;
		MemSrc_out				<= 1'b0;
		load_imm_out			<= 1'b0;
		RegWrite_out			<= 1'b0;
		MemWrite_out			<= 1'b0;
		MemRead_out				<= 1'b0;
		
		if (PC_hazard)
			DestReg_out			<= 5'bzzzzz;
		else
			DestReg_out			<= DestReg_in;

	end
	
		branch_out				<= branch_in;
		branch_cond_out		<= branch_cond_in;
		call_out					<= call_in;
		ret_out					<= ret_in & ~clr_ret_hazard;
		jreg_out					<= jreg_in;
		opcode_out				<= opcode_in;
		ALU_input_1_out		<= ALU_input_1_in;
		ALU_input_2_out		<= ALU_input_2_in;
		PC_out					<= PC_in;
		MemWrite_data_out 	<= MemWrite_data_in;
		reg_read_addr1_out	<= reg_read_addr1_in;
		reg_read_addr2_out	<= reg_read_addr2_in;
		Read_Reg_1_en_out		<= Read_Reg_1_en_in;
		Read_Reg_2_en_out		<= Read_Reg_2_en_in;
		pop_haz_out				<= pop_haz_in;


end

endmodule