`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:14:32 11/03/2015 
// Design Name: 
// Module Name:    PPU_OAMB 
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

module PPU_OAMB(
	input clk,
	input rst,
	
	input we,
	input [4:0] addr,
	input [7:0] data_in,
	
	output [7:0] data_out
);


OAMB buffa(
  .clka(clk), // input clka
  .rsta(rst), // input rsta
  .ena(1'b1), // input ena
  .wea(we), // input [0 : 0] wea
  .addra(addr), // input [4 : 0] addra
  .dina(data_in), // input [7 : 0] dina
  .douta(data_out) // output [7 : 0] douta
);




endmodule
