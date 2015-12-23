`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:18:26 11/03/2015 
// Design Name: 
// Module Name:    SYSTEM_PALETTE 
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
module SYSTEM_PALETTE(
	input [5:0] color,
	output [23:0] rgb
);


wire [1:0] r_in;
wire [1:0] g_in;
wire [1:0] b_in;

assign r_in = color[5:4];
assign g_in = color[3:2];
assign b_in = color[1:0];

wire [7:0] r_out;
wire [7:0] g_out;
wire [7:0] b_out;

assign r_out = (r_in == 2'b00) ? 8'h00
				: (r_in == 2'b01) ? 8'h55
				: (r_in == 2'b10) ? 8'hAA
				: 8'hFF;
assign g_out = (g_in == 2'b00) ? 8'h00
				: (g_in == 2'b01) ? 8'h55
				: (g_in == 2'b10) ? 8'hAA
				: 8'hFF;
assign b_out = (b_in == 2'b00) ? 8'h00
				: (b_in == 2'b01) ? 8'h55
				: (b_in == 2'b10) ? 8'hAA
				: 8'hFF;

assign rgb = {r_out, b_out, g_out};


endmodule
