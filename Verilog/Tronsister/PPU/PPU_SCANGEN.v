`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:12:04 11/03/2015 
// Design Name: 
// Module Name:    PPU_SCANGEN 
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
module PPU_SCANGEN(
	input clk_100mhz,
	input clk_25mhz,
	input rst,

	input shift_enable,
	input [1:0] scalex,
	
	input sprite_load,
	input [2:0] sprite_num,
	input [7:0] sprite_xpos,
	input [7:0] sprite_attr,
	input [7:0] sprite_line0,
	input [7:0] sprite_line1,
	
	input [7:0] bg_line0,
	input [7:0] bg_line1,
	input [1:0] bg_attr,

	output [4:0] pixel_out
);


wire [3:0] sprite_pixel_0;
wire [3:0] sprite_pixel_1;
wire [3:0] sprite_pixel_2;
wire [3:0] sprite_pixel_3;
wire [3:0] sprite_pixel_4;
wire [3:0] sprite_pixel_5;
wire [3:0] sprite_pixel_6;
wire [3:0] sprite_pixel_7;
wire [3:0] bg_pixel;

reg [9:0] curr_x;
reg [7:0] curr_y;


always @(posedge clk_25mhz) begin
	if(rst) begin
		curr_x <= {scalex, 8'd255};
		curr_y <= 0;
	end else if(shift_enable)begin
		if(curr_x == 0)begin
			curr_x <= 0;
		end else begin
			curr_x <= curr_x - 1;
		end
		
	end else begin
		curr_x <= {scalex, 8'd255};
	end
end



assign pixel_out = 	 (curr_x == 0) ? {5'b01111}
							:(sprite_pixel_0[1:0] != 2'b00) ? {1'b0, sprite_pixel_0}
							:(sprite_pixel_1[1:0] != 2'b00) ? {1'b0, sprite_pixel_1}
							:(sprite_pixel_2[1:0] != 2'b00) ? {1'b0, sprite_pixel_2}
							:(sprite_pixel_3[1:0] != 2'b00) ? {1'b0, sprite_pixel_3}
							:(sprite_pixel_4[1:0] != 2'b00) ? {1'b0, sprite_pixel_4}
							:(sprite_pixel_5[1:0] != 2'b00) ? {1'b0, sprite_pixel_5}
							:(sprite_pixel_6[1:0] != 2'b00) ? {1'b0, sprite_pixel_6}
							:(sprite_pixel_7[1:0] != 2'b00) ? {1'b0, sprite_pixel_7}
							: {1'b1, bg_pixel};

PPU_SPGEN spgen0(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),
	.enable(shift_enable),
	.scalex(scalex),
	.load((sprite_load == 1 && sprite_num == 3'd0)? 1'b1 : 1'b0),
	.xpos(sprite_xpos),
	.attr(sprite_attr),
	.line0(sprite_line0),
	.line1(sprite_line1),
	.pixel_out(sprite_pixel_0)
);
			
			
PPU_SPGEN spgen1(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),
	.enable(shift_enable),
	.scalex(scalex),
	.load((sprite_load == 1 && sprite_num == 3'd1)? 1'b1 : 1'b0),
	.xpos(sprite_xpos),
	.attr(sprite_attr),
	.line0(sprite_line0),
	.line1(sprite_line1),
	.pixel_out(sprite_pixel_1)
);


PPU_SPGEN spgen2(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),
	.enable(shift_enable),
	.scalex(scalex),
	.load((sprite_load == 1 && sprite_num == 3'd2)? 1'b1 : 1'b0),
	.xpos(sprite_xpos),
	.attr(sprite_attr),
	.line0(sprite_line0),
	.line1(sprite_line1),
	.pixel_out(sprite_pixel_2)
);


PPU_SPGEN spgen3(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),
	.enable(shift_enable),
	.scalex(scalex),
	.load((sprite_load == 1 && sprite_num == 3'd3)? 1'b1 : 1'b0),
	.xpos(sprite_xpos),
	.attr(sprite_attr),
	.line0(sprite_line0),
	.line1(sprite_line1),
	.pixel_out(sprite_pixel_3)
);

PPU_SPGEN spgen4(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),
	.enable(shift_enable),
	.scalex(scalex),
	.load((sprite_load == 1 && sprite_num == 3'd4)? 1'b1 : 1'b0),
	.xpos(sprite_xpos),
	.attr(sprite_attr),
	.line0(sprite_line0),
	.line1(sprite_line1),
	.pixel_out(sprite_pixel_4)
);


PPU_SPGEN spgen5(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),
	.enable(shift_enable),
	.scalex(scalex),
	.load((sprite_load == 1 && sprite_num == 3'd5)? 1'b1 : 1'b0),
	.xpos(sprite_xpos),
	.attr(sprite_attr),
	.line0(sprite_line0),
	.line1(sprite_line1),
	.pixel_out(sprite_pixel_5)
);


PPU_SPGEN spgen6(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),
	.enable(shift_enable),
	.scalex(scalex),
	.load((sprite_load == 1 && sprite_num == 3'd6)? 1'b1 : 1'b0),
	.xpos(sprite_xpos),
	.attr(sprite_attr),
	.line0(sprite_line0),
	.line1(sprite_line1),
	.pixel_out(sprite_pixel_6)
);


PPU_SPGEN spgen7(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),
	.enable(shift_enable),
	.scalex(scalex),
	.load((sprite_load == 1 && sprite_num == 3'd7)? 1'b1 : 1'b0),
	.xpos(sprite_xpos),
	.attr(sprite_attr),
	.line0(sprite_line0),
	.line1(sprite_line1),
	.pixel_out(sprite_pixel_7)
);



PPU_BGLGEN bglg(
	.clk_100mhz(clk_100mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),

	.enable(shift_enable),
	
	.scalex(scalex),
	.attr(bg_attr),
	.line0(bg_line0),
	.line1(bg_line1),

	
	.pixel_out(bg_pixel)
);






endmodule









module t_PPU_SCANGEN();

reg clk;
reg rst;

reg enable;

reg load;
reg [2:0] spnum;
reg [7:0] xpos;
reg [7:0] attr;
reg [7:0] line0;
reg [7:0] line1;

reg [7:0] bg_line0;
reg [7:0] bg_line1;
reg [1:0] bg_attr;

wire [4:0] pixel_out;


PPU_SCANGEN scangen(
	clk,
	rst,

	enable,
	load,
	spnum,
	xpos,
	attr,
	line0,
	line1,

	bg_line0,
	bg_line1,
	bg_attr,

	pixel_out
);

integer i;
initial begin
	enable = 0;
	load = 0;
	spnum = 0;

	xpos = 8'd20;
	attr = 8'b00000000;
	line0 = 8'b11111111;
	line1 = 8'b00000000;

	clk = 0;
	rst = 1;
	#10;
	rst = 0;

	for(i = 0; i < 8; i = i+1)begin
		spnum = i;
		load = 1;
		xpos = i*9;
		#10;
	end
	load = 0;
	#10;
	enable = 1;
	#25600;

	$stop;

	

end


always begin #5; clk = ~clk; end

always @(posedge clk) begin
	if(enable == 1)begin
		if(pixel_out == 0) $write(".");
		else $write("%d", pixel_out);
	end
end



endmodule


