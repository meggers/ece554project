`include "Data_Memory.v"

module MEM_Unit
(
	// INPUTS
	clk, rst, RegWrite_in, MemWrite, 
	MemRead, MemToReg_in, MemSrc,
	DestReg_in, ALU_addr, NON_ALU_addr,
	MemWrite_data, call_in, ret_in,

	// OUTPUTS
	RegWrite_out,
	MemToReg_out,
	DestReg_out,
	ALU_result_out,
	MemRead_data,
	ret_out
);

//INPUTS//////////////////////////////////////////////////////

input clk;
input rst;

input RegWrite_in;
input MemWrite;
input MemRead;
input MemSrc;
input call_in;
input ret_in;

input 		MemToReg_in;	// Memory Read to register 
input [4:0]  	DestReg_in;	// Destination of Memory Read
input [31:0] 	ALU_addr;	// Results of ALU operation
input [31:0] 	NON_ALU_addr;	// Results of ALU operation
input [31:0] 	MemWrite_data;	// Data for Memory Write 

//OUTPUTS/////////////////////////////////////////////////////

output 		RegWrite_out;
output 		MemToReg_out;
output		ret_out;
output [4:0]	DestReg_out;
output [31:0]	ALU_result_out;
output [31:0]	MemRead_data;

//INTERNAL CONTROL////////////////////////////////////////////

reg [31:0] MemAddr;

assign ALU_result_out 	= ALU_addr;
assign DestReg_out 	= DestReg_in;
assign RegWrite_out 	= RegWrite_in;
assign MemToReg_out 	= MemToReg_in;
assign ret_out 		= ret_in;

// MUX: Memory accessing address selector

always @(*) begin

	if (MemSrc | call_in) begin
		MemAddr = NON_ALU_addr;
	end
	else begin
		MemAddr = ALU_addr;
	end
end
		
// Testing memory
Data_Memory data_mem(.clk(clk), .addr(MemAddr[11:0]), .re(MemRead | ret_in),
                     .we(MemWrite | call_in), .wrt_data(MemWrite_data),
                     .rd_data(MemRead_data));

endmodule
