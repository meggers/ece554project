`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:03 12/13/2015 
// Design Name: 
// Module Name:    MEM_tb 
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
module MEM_tb();

	reg clk, rst;

	reg [31:0] instr_addr; // values x000 - x3FF
	reg [31:0] data_addr;	 // values x400 - xFFF

	reg rd_instr_en, rd_data_en;

	reg wr_instr_en, wr_data_en;	// Write instruction should never be high

	reg [31:0] wrt_instr, wrt_data;
	
	// Memory output
	wire [31:0] MEM_instr;
	wire [31:0] MEM_data;
	
	//////////////////////////////////////////////////////////////////////
	
reg [31:0] PC_plus_1, PC_curr;
	
	//Adder for calculating next PC///////
always @(negedge clk) begin
		PC_plus_1 <= PC_curr + 1;
end


//Program counter/////////////////////
always @(posedge clk) begin

	if (rst) begin
		PC_curr <= 32'h00000000;
	end
	else begin
		PC_curr <= PC_plus_1;
	end

end

PlzHlp Main_Memory
(

	.clka(!clk), .clkb(!clk),
	
	// Instruction Memory
	.addra(PC_curr), .ena(1'b1),
	.dina(32'h00000000), .douta(MEM_instr),
	.wea(4'h0000),

	// Data Memory	
	.addrb(PC_curr), .enb(1'b0),
	.dinb(32'h00000000), .doutb(MEM_data),
	.web(4'h0000)

);

always @ (PC_curr) begin

	$display("PC_curr: %h Data: %h", PC_curr, MEM_instr);

end

always @(PC_curr[13]) begin
	$stop;
end

initial begin

	clk = 1;
	rst = 1;
	
	repeat(20)@(posedge clk);

	rst = 0;

end

//INIT CLOCK
initial begin
  forever #10 clk = ~clk; 
end

endmodule
