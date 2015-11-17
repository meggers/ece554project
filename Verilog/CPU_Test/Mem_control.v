module Mem_control
(
	// INPUTS
	clk, rst, 
	instr_addr, data_addr,
	rd_instr_en, rd_data_en,
	wr_instr_en, wr_data_en,
	wrt_instr, wrt_data,

	// OUTPUTS
	data, instr
);
	input clk;
	input rst;

	input [11:0] instr_addr; // values x000 - x3FF
	input [11:0] data_addr;	 // values x400 - xFFF

	input rd_instr_en, rd_data_en;

	input wr_instr_en, wr_data_en;	// Write instruction should never be high

	input [31:0] wrt_instr, wrt_data;
	output [31:0] data, instr;

	
Memory Main_Memory
(
	.clk(clk), 

	// Instruction Memory
	.instr_addr(instr_addr), .re1(rd_instr_en),
	.we1(wr_instr_en), .wrt_data1(wrt_instr),
	.rd_data1(instr),

	// Data Memory	
	.data_addr(data_addr), .re2(rd_data_en),
	.we2(wr_data_en), .wrt_data2(wrt_data),
	.rd_data2(data)
);
	

endmodule
