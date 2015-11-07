`include "Data_Memory.v"

module MEM_Unit
(
	// INPUTS
	clk, rst, RegWrite_in, MemWrite, 
	MemRead, MemToReg_in, MemSrc,
	DestReg_in, MemAcc_addr, MemWrite_data,

	// OUTPUTS
	RegWrite_out,
	MemToReg_out,
	DestReg_out,
	ALU_result_out,
	MemRead_data
);

//INPUTS//////////////////////////////////////////////////////

input clk;
input rst;

input RegWrite_in;
input MemWrite;
input MemRead;
input MemSrc;

input 		MemToReg_in;	// Memory Read to register 
input [4:0]  	DestReg_in;	// Destination of Memory Read
input [31:0] 	MemAcc_addr;	// Results of ALU operation
input [31:0] 	MemWrite_data;	// Data for Memory Write 

//OUTPUTS/////////////////////////////////////////////////////

output RegWrite_out;
output MemToReg_out;
output [4:0] DestReg_out;
output [31:0] ALU_result_out;
output [31:0] MemRead_data;

//INTERNAL CONTROL////////////////////////////////////////////

reg [31:0] MemAddr;

assign ALU_result_out = MemAcc_addr;
assign DestReg_out = DestReg_in;
assign RegWrite_out = RegWrite_in;

// MUX: Memory accessing address selector

always @(MemAcc_addr, MemWrite_data, MemSrc) begin

	if (MemSrc) begin
		MemAddr = MemWrite_data;
	end
	else begin
		MemAddr = MemAcc_addr;
	end
end
		
// Testing memory
Data_Memory data_mem(.clk(clk), .addr(MemAddr), .re(MemRead),
                     .we(MemWrite), .wrt_data(MemWrite_data),
                     .rd_data(MemRead_data));

endmodule
