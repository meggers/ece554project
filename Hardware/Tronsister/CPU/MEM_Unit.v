`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:23 11/13/2015 
// Design Name: 
// Module Name:    MEM_Unit 
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

module MEM_Unit
(
	// INPUTS
	RegWrite_in, MemWrite, 					// From EXMEM register
	MemRead, MemToReg_in, MemSrc,
	DestReg_in, ALU_addr, NON_ALU_addr,
	MemWrite_data, call_in, ret_in,

	MemRead_data_frm_MemCtrl,				// From memory interface

	// OUTPUTS
	RegWrite_out,								// To MEMWB register
	MemToReg_out,
	DestReg_out,
	ALU_result_out,
	MemRead_data,
	ret_out,

	MemAddr_to_MemCtrl,						// To memory interface
	MemRead_to_MemCtrl,
	MemWrite_to_MemCtrl,
	MemWrite_data_to_MemCtrl
	
);

//INPUTS//////////////////////////////////////////////////////

input 		call_in;
input 		ret_in;

input 		RegWrite_in;		
input 		MemWrite;			// Memory write enable
input 		MemRead;				// Memory read enable
input 		MemSrc;				// NON-ALU/ALU memory address select
input 		MemToReg_in;		// Memory read to register 

input [4:0]  	DestReg_in;		// Destination of Memory Read
input [31:0] 	ALU_addr;		// Results of ALU operation
input [31:0] 	NON_ALU_addr;	// Results of ALU operation
input [31:0] 	MemWrite_data;	// Data for Memory Write 

input [31:0] 	MemRead_data_frm_MemCtrl;

//OUTPUTS/////////////////////////////////////////////////////

output				ret_out;
output 				RegWrite_out;
output 				MemToReg_out;
output [4:0] 		DestReg_out;
output [31:0] 		ALU_result_out;
output [31:0] 		MemRead_data;

output 				MemRead_to_MemCtrl;
output 				MemWrite_to_MemCtrl;
output [31:0] 		MemWrite_data_to_MemCtrl;
output reg [31:0] MemAddr_to_MemCtrl;

//INTERNAL CONTROL////////////////////////////////////////////

assign ALU_result_out 	= ALU_addr;
assign DestReg_out 		= DestReg_in;
assign RegWrite_out 		= RegWrite_in;
assign MemToReg_out 		= MemToReg_in;
assign ret_out 			= ret_in;

// To Memory Interface
assign MemRead_to_MemCtrl 			= (MemRead | ret_in);
assign MemWrite_to_MemCtrl 		= (MemWrite | call_in);
assign MemWrite_data_to_MemCtrl 	= MemWrite_data;

// From Memory Interface
assign MemRead_data	= MemRead_data_frm_MemCtrl;

// MUX: Memory accessing address selector

always @(*) begin

	if (MemSrc | call_in) begin
		MemAddr_to_MemCtrl = NON_ALU_addr;
	end
	else begin
		MemAddr_to_MemCtrl = ALU_addr;//ALU_addr[11:0];
	end
end

endmodule