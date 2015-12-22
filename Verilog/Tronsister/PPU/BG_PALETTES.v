`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:16:36 11/03/2015 
// Design Name: 
// Module Name:    SPRITE_PALETTES 
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
module BG_PALETTES(
	input clk,
	input [1:0] palette_num,
	input [1:0] color_num,

	output reg [5:0] system_color
);

always @( * ) begin
	case (palette_num)
	
		0: begin
			case(color_num)
				0: system_color = 6'b000000;
				1: system_color = 6'b000011;
				2: system_color = 6'b001100;
				3: system_color = 6'b110000;
			endcase
		end
		
		1: begin
			case(color_num)
				0: system_color = 6'b000000;
				1: system_color = 6'b111100;
				2: system_color = 6'b110011;
				3: system_color = 6'b001111;
			endcase
		end
		
		2: begin
			case(color_num)
				0: system_color = 6'b000000;
				1: system_color = 6'b110000;
				2: system_color = 6'b000011;
				3: system_color = 6'b001100;
			endcase
		end
		
		3: begin
			case(color_num)
				0: system_color = 6'b000000;
				1: system_color = 6'b110000;
				2: system_color = 6'b110000;
				3: system_color = 6'b110000;
			endcase
		end
	
	
	endcase

	
end



endmodule
