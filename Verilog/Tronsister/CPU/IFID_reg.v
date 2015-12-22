`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:49:36 11/13/2015 
// Design Name: 
// Module Name:    IFID_reg 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 	This module is the IF/ID pipeline register that lies between the instruction
//						fetch and instruction decode sections of the pipe. This module is responsible 
//						for taking a fetched instruction and separating it into disjoint fields of
//						data for instruction decoding and execution.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module IFID_reg
(
	// INPUTS
	clk, rst, keep_flags_in,
	data_hazard, PC_hazard, pop_haz,
	instruction_in, PC_in, 
	
	// OUTPUTS
	PC_out, instruction_out,
	pop_haz_out, keep_flags_out
);

//INPUTS///////////////////////////////////////////////////

input clk, rst, data_hazard, PC_hazard, pop_haz, keep_flags_in;

input [31:0] instruction_in;   		// Instruction to execute
input [31:0] PC_in;         			// Program counter

//OUTPUTS//////////////////////////////////////////////////

output reg [31:0] PC_out;        	// Program counter
output reg [31:0] instruction_out;	// Current instruction
output reg	  		pop_haz_out;
output reg 			keep_flags_out;

//INTERNAL CONTROL SIGNALS/////////////////

// Main pipeline register flip flop
always @(posedge clk) begin
    
	if (rst) begin
		instruction_out	<= 32'hFC000000;
		PC_out 				<= 32'h00000000;
		pop_haz_out			<= 1'b0;
		keep_flags_out		<= 1'b0;

	end
	
   // Don't stall the pipe
   else if (!data_hazard & !PC_hazard & !pop_haz) begin
   
		instruction_out 	<= instruction_in;
		PC_out 				<= PC_in;
		pop_haz_out			<= pop_haz;
		keep_flags_out		<= keep_flags_in;
		
   end
	
   // Stall the pipe
   else begin
	    
		instruction_out	<= instruction_out;
		PC_out 				<= PC_out;
		pop_haz_out			<= pop_haz;
		keep_flags_out		<= keep_flags_in;
		
   end
	
end

endmodule