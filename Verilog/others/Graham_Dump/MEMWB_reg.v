`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:57:56 11/13/2015 
// Design Name: 
// Module Name:    MEMWB_reg 
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

module MEMWB_reg
(
	// INPUTS
	clk, rst, RegWrite_in, MemToReg_in,
	DestReg_in, ALU_result_in, MemRead_data_in,

	// OUTPUTS
	RegWrite_out, MemToReg_out, DestReg_out,
	ALU_result_out, MemRead_data_out
);

//INPUTS/////////////////////////////////////////////////////

input 			clk;
input				rst;
input 			RegWrite_in;
input 			MemToReg_in;
input [4:0]		DestReg_in;
input [31:0] 	ALU_result_in;
input [31:0] 	MemRead_data_in;

//OUTPUTS////////////////////////////////////////////////////

output reg 				RegWrite_out;
output reg 				MemToReg_out;
output reg [4:0]		DestReg_out;
output reg [31:0] 	ALU_result_out;
output reg [31:0] 	MemRead_data_out;

always @(posedge clk) begin

	if (rst) begin
	
		RegWrite_out		<= 1'b0;
		MemToReg_out		<= 1'b0;
		
	end
	else begin
	
		RegWrite_out		<= RegWrite_in;
		MemToReg_out		<= MemToReg_in;
		
	end
	
		DestReg_out			<= DestReg_in;
		ALU_result_out		<= ALU_result_in;
		MemRead_data_out	<= MemRead_data_in;

end

endmodule
