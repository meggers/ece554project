`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:00:31 12/01/2015 
// Design Name: 
// Module Name:    BG_TILE_TABLE 
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
module BG_ATTRIBUTE_TABLE(
	input rclk,
	input wclk,
	input rst,
	
	input [4:0] r_row,
	input [4:0] r_col,
	
	input we,
	input [4:0] w_row,
	input [4:0] w_col,
	
	input [7:0] data_in,
	output reg [7:0] data_out
	
	);
	
	wire [7:0] at_dout;
	wire read_enable;
	assign read_enable = ~we;
	
	background_attribute_table tbl(
	// port A (writing)
	  .clka(wclk), // input clka
	  .wea(we), // input [0 : 0] wea
	  .addra({w_row, w_col}), // input [9 : 0] addra
	  .dina(data_in), // input [7 : 0] dina
	  
	// port B (reading)
		.enb(read_enable),
		.clkb(rclk), // input clkb
		.rstb(rst), // input rstb
		.addrb({r_row, r_col}), // input [9 : 0] addrb
		.doutb(at_dout) // output [7 : 0] doutb
	);
	
	
	always @(*) begin
		data_out = at_dout;
	end
	
endmodule
