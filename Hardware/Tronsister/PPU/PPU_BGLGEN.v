`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:26 12/01/2015 
// Design Name: 
// Module Name:    PPU_BGLGEN 
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
module PPU_BGLGEN(
	input clk_100mhz,
	input clk_25mhz,
	input rst,

	input enable,
	
	input [1:0] scalex,
	
	input [1:0] attr,
	input [7:0] line0,
	input [7:0] line1,

	
	output [3:0] pixel_out
);


reg [1:0] color_pal;
reg [15:0] shift_reg0;
reg [15:0] shift_reg1;

reg [2:0] down_count;
reg [1:0] scale_count;


assign pixel_out = {color_pal[1], color_pal[0], shift_reg1[15], shift_reg0[15]};
//assign pixel_out = {color_pal[1], color_pal[0], 2'b11};


always @(posedge clk_25mhz) begin
	
	if(rst)begin
		down_count <= 0;
		scale_count <= 0;
	
		shift_reg0 <= 16'h0000;
		shift_reg1 <= 16'h0000;
		color_pal <= 0;
	end else if(enable)begin
		
		if(scale_count == 0) begin
			scale_count <= scalex;
			down_count <= down_count - 1;
			
			if(down_count == 0)begin
				shift_reg0 <= {shift_reg0[14:7], line0};
				shift_reg1 <= {shift_reg1[14:7], line1};
				color_pal <= attr[1:0];
			end else begin
				shift_reg0 <= {shift_reg0[14:0], 1'b0};
				shift_reg1 <= {shift_reg1[14:0], 1'b0};
				color_pal <= color_pal;
			end
			
		end else begin
			scale_count <= scale_count - 1;
			down_count <= down_count;
			shift_reg0 <= shift_reg0;
			shift_reg1 <= shift_reg1;
			color_pal <= color_pal;
		end
		
	end else begin
		down_count <= 3'd7;
		scale_count <= scalex;

		shift_reg0 <= {line0, 8'd0};
		shift_reg1 <= {line1, 8'd0};
		color_pal <= 0;
	end
	
end



endmodule
