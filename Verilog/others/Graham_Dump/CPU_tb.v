`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:17 11/17/2015 
// Design Name: 
// Module Name:    Tronsistor_CPU_tb 
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

module CPU_tb();

reg clk_in,rst_in;

wire clk_out;
wire rst_out;

wire [31:0] data_out;
wire [31:0] MemAddr;
wire [11:0] NON_ALU;

wire [9:0]  	S_type_index;
wire [15:0] 	S_type_value;
wire 				PPU_en;

//////////////////////
// Instantiate CPU //
////////////////////
CPU iCPU
(
	.clk_100mhz(clk_in),
	.rst_in(rst_in),
	.clk(clk_out),
	.rst(rst_out),
	.data_out(data_out),
	.MemAddr(MemAddr),
	.NON_ALU(NON_ALU),
	
	.S_type_index(S_type_index),
	.S_type_value(S_type_value),
	.PPU_en(PPU_en)
);

initial begin
	clk_in = 1;
	rst_in = 1;
	
repeat(2)@(posedge clk_in);

	rst_in = 0;

end

//INIT CLOCK
initial begin
  forever #10 clk_in = ~clk_in; 
end

endmodule
