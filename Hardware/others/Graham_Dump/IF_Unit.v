`timescale 1ns / 1ps

//`include "Instruction_Memory.v"

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:47:17 11/13/2015 
// Design Name: 
// Module Name:    IF_Unit 
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

module IF_Unit
(	
	// INPUTS
	clk, rst, 								// General Inputs	
	
	data_hazard, PC_hazard,				// Inputs from Hazard_Unit
	keyboard_hazard, pop_haz,	

	PC_control, PC_src,					// Inputs from PC_control

	instruction_in,						// Instruction from memory interface
	
	ld_idr, ld_epc,						// from Trap Handler
	
	branch_to_keyboard_ISR,
	branch_to_gametick_ISR,
	branch_to_stackoverflow_ISR,
	
	idr_data, EPC,

	jreg_noRead,

	stack_overflow_hazard,
	game_tick_hazard,

	// OUTPUTS
	PC_plus_1, PC_curr,	PC_IM,	// PC to IFID, PC to fetch instruction

	keep_flags, instr_en,

	instruction_out						// Intsruction for IFID
);

//INPUTS/////////////////////////////

input				clk, rst;

//From PC_Control
input 			PC_src;
input [15:0]	PC_control;

//From Hazard_Unit
input				PC_hazard;
input				data_hazard;
input				pop_haz;

//From Trap_handler
input 			ld_idr;
input				ld_epc;
input				branch_to_keyboard_ISR;
input				branch_to_stackoverflow_ISR;
input				branch_to_gametick_ISR;
input [7:0]		idr_data;
input [15:0]	EPC;
input				keyboard_hazard;
input				game_tick_hazard;
input				stack_overflow_hazard;
input				jreg_noRead;

input [31:0]	instruction_in;

//OUTPUTS/////////////////////////////

output 					keep_flags;

output reg 	[31:0]	PC_plus_1;
output reg	[15:0]	PC_curr;		// PC to Trap Handler
output		[31:0]	PC_IM;				// PC to Memory Interface

output					instr_en;
output 		[31:0]	instruction_out;

//INTERNAL LOGIC//////////////////////

wire						interrupt_hazard;
reg [15:0]				PC_update;

//Instruction read enabling
assign instr_en 			= !(data_hazard | PC_hazard | pop_haz);

assign cond_jreg 			= (jreg_noRead & !rst);
assign interrupt_hazard = (game_tick_hazard | stack_overflow_hazard | keyboard_hazard);
assign interrupt_branch = (branch_to_keyboard_ISR | branch_to_stackoverflow_ISR | branch_to_gametick_ISR);

//MUX for new PC with interrupt handling
assign PC_IM				=	(branch_to_keyboard_ISR) 			? 32'h0000_03FE: //x3FE is the location of the keyboard ISR
									(branch_to_gametick_ISR) 			? 32'h0000_03FD:
									(branch_to_stackoverflow_ISR) 	? 32'h0000_03FF:
									{20'h00000,PC_curr[11:0]};

//MUX for new instruction with interrupt handling
assign instruction_out	=	(ld_epc) 																			? {16'b001001_11110_00000, EPC[15:0]}:				//load immediate instruction with EPC data being saved into reg 30
									(ld_idr) 																			? {24'b001001_11100_00000_00000000, idr_data}:	//load immediate instruction with keyboard data being saved to idr, reg 28 
									((interrupt_hazard&~interrupt_branch&~ld_idr&~ld_epc)|cond_jreg)	?	32'hFFFF_FFFF:	
									instruction_in;
									
//Introducing new instruction, save the flags ragister value
assign keep_flags = (ld_epc | ld_idr); 

//Adder for calculating next PC///////
always @(negedge clk) begin

	if (!PC_hazard) begin
		PC_plus_1 <= PC_IM + 1;
	end
	else begin
		PC_plus_1 <= PC_plus_1;
	end
end

//PC updating mux/////////////////////
always @(*) begin
	
	if (PC_src) begin
		PC_update = PC_control;
	end
	else begin
		PC_update = PC_plus_1;
	end

end

//Program counter/////////////////////
always @(posedge clk) begin

	if (rst) begin
		PC_curr <= 16'h0000;
	end

	else if (!data_hazard & !pop_haz) begin
		PC_curr <= PC_update;
	end
	
	else begin
		PC_curr <= PC_curr;
	end

end

endmodule