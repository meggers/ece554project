`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:20 11/14/2015 
// Design Name: 
// Module Name:    Memory_Interface 
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

module Memory_Interface
(
	// INPUTS
	clk, 
	instr_addr, data_addr,
	rd_instr_en, rd_data_en,
	wr_instr_en, wr_data_en,
	wrt_instr, wrt_data,

	// OUTPUTS
	data, instr
);
	input clk;

	input [31:0] instr_addr; // values x000 - x3FF
	input [31:0] data_addr;	 // values x400 - xFFF

	input rd_instr_en, rd_data_en;

	input wr_instr_en, wr_data_en;	// Write instruction should never be high

	input [31:0] wrt_instr, wrt_data;
	output reg [31:0] data, instr;
	
	// Memory output
	wire [31:0] MEM_instr;
	wire [31:0] MEM_data;
	
	wire ena;
	wire enb;
	
	assign ena = (instr_addr < 32'h00000400) ? rd_instr_en : 1'b0;
	assign enb = (data_addr > 32'h00000400) ? (wr_data_en | rd_data_en) : 1'b0;
	

Tron Memory
(

	.clka(!clk), .clkb(!clk),
	
	// Instruction Memory
	.addra({instr_addr[29:0], instr_addr[31:30]}), .ena(ena),
	.dina(wrt_instr), .douta(MEM_instr),
	.wea({wr_instr_en,wr_instr_en,wr_instr_en,wr_instr_en}),

	// Data Memory	
	.addrb({data_addr[29:0], data_addr[31:30]}), .enb(enb),
	.dinb(wrt_data), .doutb(MEM_data),
	.web({wr_data_en,wr_data_en,wr_data_en,wr_data_en})

);

/*

Main_Memory Memory
(

	.clka(!clk), .clkb(!clk),
	
	// Instruction Memory
	.addra({instr_addr[29:0], instr_addr[31:30]}), .ena(ena),
	.dina(wrt_instr), .douta(MEM_instr),
	.wea({wr_instr_en,wr_instr_en,wr_instr_en,wr_instr_en}),

	// Data Memory	
	.addrb({data_addr[29:0], data_addr[31:30]}), .enb(enb),
	.dinb(wrt_data), .doutb(MEM_data),
	.web({wr_data_en,wr_data_en,wr_data_en,wr_data_en})

);

Etch Main_Memory
(

	.clka(!clk), .clkb(!clk),
	
	// Instruction Memory
	.addra({instr_addr[29:0], instr_addr[31:30]}), .ena(ena),
	.dina(wrt_instr), .douta(MEM_instr),
	.wea({wr_instr_en,wr_instr_en,wr_instr_en,wr_instr_en}),

	// Data Memory	
	.addrb({data_addr[29:0], data_addr[31:30]}), .enb(enb),
	.dinb(wrt_data), .doutb(MEM_data),
	.web({wr_data_en,wr_data_en,wr_data_en,wr_data_en})

);
*/

// Instruction mux
always @(*) begin

	if (rd_instr_en) begin
		instr = MEM_instr;
	end
	else begin
		instr = 32'hzzzzzzzz;
	end
	
end

// Data mux
always @(*) begin

	//if (wr_data_en | rd_data_en) begin
		data = MEM_data;
	//end
	//else begin
		//data = 32'hzzzzzzzz;
	//end
	
end

endmodule
