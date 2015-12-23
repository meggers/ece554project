`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:37:50 12/10/2015 
// Design Name: 
// Module Name:    COLOR_PALETTES 
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
module COLOR_PALETTES(
   input clk,
	input foreground,
	input [1:0] palette_num,
	input [1:0] color_num,

	output [5:0] system_color
);

wire [4:0] color_addr;

//wire [5:0] sprite_color;
//wire [5:0] bg_color;

assign color_addr = {~foreground, palette_num, color_num};

color_palette_rom pal (
  .clka(clk), // input clka
  .addra(color_addr), // input [4 : 0] addra
  .douta(system_color) // output [5 : 0] douta
);


//SPRITE_PALETTES sprite_pal(
//	.clk(clk),
//	.palette_num(palette_num),
//	.color_num(color_num),
//
//	.system_color(sprite_color)
//);
//
//BG_PALETTES bg_pal(
//	.clk(clk),
//	.palette_num(color_num == 2'b00 ? 2'b00 : palette_num),
//	.color_num(color_num),
//
//	.system_color(bg_color)
//);
//
//always @(*) begin
//	system_color = (foreground) ? sprite_color : bg_color;
//end





endmodule
