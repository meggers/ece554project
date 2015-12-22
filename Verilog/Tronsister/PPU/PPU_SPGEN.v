`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:43 11/03/2015 
// Design Name: 
// Module Name:    PPU_SPGEN 
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
module PPU_SPGEN(
	input clk_100mhz,
	input clk_25mhz,
	input rst,

	input enable,
	
	input [1:0] scalex,
	
	input load,
	input [7:0] xpos,
	input [7:0] attr,
	input [7:0] line0,
	input [7:0] line1,


	output [3:0] pixel_out

);


reg [7:0] down_count;
reg [1:0] scale_count;
reg [7:0] shift_reg0;
reg [7:0] shift_reg1;
reg [7:0] attr_buffer;

wire [1:0] color_palette;
wire flipv;
wire fliph;

assign color_palette	= attr_buffer[1:0];
assign flipv			= attr_buffer[7];
assign fliph			= attr_buffer[6];

wire [1:0] pixel_color;
assign pixel_color = (~enable) ? 2'b00 : (down_count == 0) ? {shift_reg1[7], shift_reg0[7]} : 2'b00;

assign pixel_out = {color_palette, pixel_color};




always @(posedge clk_25mhz) begin

	if(rst) begin
		down_count <= 8'h00;
		attr_buffer <= 8'h00;
		shift_reg0 <= 	8'h00;
		shift_reg1 <= 	8'h00;
		scale_count <= 0;
		
	end else if(load) begin
		
		scale_count <= scalex;
		
		if (xpos == 8'hFF) begin
			down_count <= 8'h00;
			shift_reg0 <= 8'h00;
			shift_reg1 <= 8'h00;
		end else begin
			down_count <= xpos;
			attr_buffer <= attr;
			
			if (fliph) begin
				shift_reg0 <= 	{line0[0], line0[1], line0[2], line0[3], line0[4], line0[5], line0[6], line0[7]};
				shift_reg1 <= 	{line1[0], line1[1], line1[2], line1[3], line1[4], line1[5], line1[6], line1[7]};
			end else begin
				shift_reg0 <= 	line0;
				shift_reg1 <= 	line1;
			end
			
		end
	
		
	end else if(enable) begin
		attr_buffer <= attr_buffer;
		
		if(shift_reg0 == 0 && shift_reg1 == 0) begin
			down_count <= 8'h00;
			attr_buffer <= 8'h00;
			shift_reg0 <= 	8'h00;
			shift_reg1 <= 	8'h00;
			scale_count <= scalex;
			
		end else if(scale_count == 0) begin
			scale_count <= scalex;
			
			if(down_count == 0) begin
				
				shift_reg0 <= 	{shift_reg0[6:0], 1'b0};
				shift_reg1 <= 	{shift_reg1[6:0], 1'b0};
				
				if(shift_reg0 == 0 && shift_reg1 == 0) begin
					down_count <= 0;
				end else begin
					down_count <= 0;
				end
				
				
			end else begin
				down_count <= down_count - 1;
				shift_reg0 <= 	shift_reg0;
				shift_reg1 <= 	shift_reg1;
			end
		end else begin
			scale_count <= scale_count - 1;
			down_count <= down_count;
			shift_reg0 <= 	shift_reg0;
			shift_reg1 <= 	shift_reg1;
		end
		
		
		
	end else begin
		scale_count <= scalex;
		down_count <= down_count;
		attr_buffer <= attr_buffer;
		shift_reg0 <= 	shift_reg0;
		shift_reg1 <= 	shift_reg1;
	end
					
end




endmodule


module t_PPU_SPGEN();

reg clk;
reg rst;

reg enable;
reg load;
reg [7:0] xpos;
reg [7:0] attr;
reg [7:0] line0;
reg [7:0] line1;

wire [3:0] pixel_out;


PPU_SPGEN spgen(
	clk,
	rst,

	enable,
	load,
	xpos,
	attr,
	line0,
	line1,

	pixel_out
);


initial begin
	enable = 0;
	load = 0;

	xpos = 8'd5;
	attr = 8'b00000000;
	line0 = 8'b00001111;
	line1 = 8'b10101010;

	clk = 0;
	rst = 1;
	#10;
	rst = 0;
	load = 1;
	#10;
	load = 0;
	#30;
	enable = 1;
	#1000;

	$stop;

	

end


always begin #5; clk = ~clk; end

always @(posedge clk) begin
	if(enable == 1) $write("%d", pixel_out);
	
end



endmodule
