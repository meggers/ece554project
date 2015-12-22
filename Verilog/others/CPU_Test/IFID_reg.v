/* 	
	This module is the IF/ID pipeline register that lies between the instruction
	fetch and instruction decode sections of the pipe. This module is responsible 
	for taking a fetched instruction and separating it into disjoint fields of
	data for instruction decoding and execution.
*/

module IFID_reg
(
	// INPUTS
	clk, data_hazard, PC_hazard, instruction_in, PC_in, 
	
	// OUTPUTS
	PC_out, instruction_out
);

//INPUTS///////////////////////////////////////////////////

input clk, data_hazard, PC_hazard;

input [31:0] instruction_in;   		// Instruction to execute
input [31:0] PC_in;         		// Program counter

//OUTPUTS//////////////////////////////////////////////////

output reg [31:0] PC_out;        	// Program counter
output reg [31:0] instruction_out;	// Current instruction

//INTERNAL CONTROL SIGNALS/////////////////

//NO OPERATION FOR PIPE STALL
wire [5:0] NO_OP = 32'hF0000000;

// Main pipeline register flip flop
always @(posedge clk) begin
    
   // Don't stall the pipe
   if (!data_hazard & !PC_hazard) begin
   
	instruction_out <= instruction_in;
	PC_out 		<= PC_in;

   end
	
   // Stall the pipe
   else begin
	    
	instruction_out <= instruction_out;
	PC_out 		<= PC_out;
	   
   end

end

/* Flop for haulting the pipe appropriately
   during the various types of halts
always @(posedge clk) begin
	    
	if (PC_hazard) begin
	        instruction_out <= NO_OP;
	end
	else if (data_hazard) begin
	        instruction_out <= instruction_out;
	end
	else begin
	        instruction_out <= instruction_in;
	end
end
*/

endmodule
