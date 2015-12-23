`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:43:17 10/06/2015 
// Design Name: 
// Module Name:    PPU 
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
module PPU(
	input clk_100mhz,
	input clk_25mhz,
	input rst,
	input vsync,
	input hsync,

	input [7:0] scanx,
	input [7:0] scany,
	input [1:0] scalex,
	input [1:0] scaley,
	
	input [3:0] oam_we,
	input [5:0] oam_w_addr,
	input [31:0] oam_data_in,
	
	input bg_tile_we,
	input [9:0] bg_tile_w_rowcol,
	input [7:0] bg_tile_data_in,
	
	input bg_attr_we,
	input [9:0] bg_attr_w_rowcol,
	input [7:0] bg_attr_data_in,

	output [23:0] rgb_out
    );


wire sprite_in_range;
wire [7:0] oamb_dout;
wire oam_copy;
wire oamb_clear;
wire [2:0] oamb_addr;
wire [5:0] oam_addr;
wire [1:0] oam_byte_sel;
wire oam_rd_n_oamb_wr;
wire [2:0] sprite_yoffset;
wire [7:0] sprite_tile_num;
wire [7:0] sprite_attr;
wire [7:0] sprite_xpos;
wire scangen_load_sprite;
wire scangen_shift_enable;

wire [7:0] bg_tile_num;
wire [9:0] bg_next_rowcol;
wire [2:0] bg_next_yoffset;
	 



	 
PPU_OAMCTRL ppuctrl(
	.clk_100mhz(clk_25mhz),
	.clk_25mhz(clk_25mhz),
	.rst(rst),

	.hsync(hsync),
	.vsync(vsync),
	.scany(scany),
	.scanx(scanx),
	
	.sprite_in_range(sprite_in_range),
	.oamb_dout(oamb_dout),

	// outputs
	.oam_copy(oam_copy),

	.oamb_clear(oamb_clear),
	.oamb_addr(oamb_addr),
	.oam_addr(oam_addr),
	.oam_byte_sel(oam_byte_sel),
	.oam_rd_n_oamb_wr(oam_rd_n_oamb_wr),
	
	.sprite_yoffset(sprite_yoffset),
	.sprite_tile_num(sprite_tile_num),
	.sprite_attr(sprite_attr),
	.sprite_xpos(sprite_xpos),
	.scangen_load_sprite(scangen_load_sprite),
	.scangen_shift_enable(scangen_shift_enable),

	.bg_next_rowcol(bg_next_rowcol),
	.bg_next_yoffset(bg_next_yoffset)
);

wire [7:0] oam_dout;
wire [7:0] oamb_din;
assign oamb_din = (oamb_clear) ? 8'hFF : oam_dout;

assign sprite_in_range = (
		oam_byte_sel == 0 // byte is a ypos
		&& oam_rd_n_oamb_wr == 1
		&& oam_dout != 8'hFF // non-empty sprite
		&& (scany + 8'h01) - oam_dout < 8 // in range
		&& (scany + 8'h01) >= oam_dout) // in range
	? 1 : 0;
	
	

PPU_OAMB oamb(
	.clk(clk_25mhz),
	.rst(rst),
	
	.we(oam_rd_n_oamb_wr),
	.addr({oamb_addr, oam_byte_sel}),
	.data_in(oamb_din),
	
	.data_out(oamb_dout)
);


OAM_v oam(
	.rclk(clk_25mhz),
	.wclk(clk_100mhz),
	.rst(rst),
	
	.r_addr({oam_addr, oam_byte_sel}),
	.r_enable(~oam_rd_n_oamb_wr),
	
	.w_enable(oam_we),
	.w_addr(oam_w_addr),
	.data_in(oam_data_in),

	.data_out(oam_dout)
);

	 

wire [7:0] sprite_line0;
wire [7:0] sprite_line1;

wire [7:0] bg_line0;
wire [7:0] bg_line1;
wire [7:0] bg_attr;
wire [4:0] pixel_out;


PPU_SCANGEN scangen(
	.clk_100mhz(clk_25mhz),
	.clk_25mhz(clk_25mhz), ////////////////////////////////////////////////////////////
	.rst(rst),

	.shift_enable(scangen_shift_enable),
	.scalex(scalex),
	
	.sprite_load(scangen_load_sprite),
	.sprite_num(oamb_addr),
	.sprite_xpos(sprite_xpos),
	.sprite_attr(sprite_attr),
	.sprite_line0(sprite_line0),
	.sprite_line1(sprite_line1),
	
	.bg_line0(bg_line0),
	.bg_line1(bg_line1),
	.bg_attr(bg_attr[1:0]),

	.pixel_out(pixel_out)
);



SPRITE_PATTERN_TABLE sprite_pt(
	.clk(clk_25mhz),
	
	.tile_num(sprite_tile_num),
	.yoffset(sprite_yoffset),

	.line0(sprite_line0),
	.line1(sprite_line1)
);


BG_PATTERN_TABLE bg_pt(
	.clk(clk_25mhz),
	
	.tile_num(bg_tile_num),
	.yoffset(scany[2:0]),

	.line0(bg_line0),
	.line1(bg_line1)
);


wire [9:0] bg_r_rowcol_adjust;
wire [9:0] bg_curr_rowcol;
assign bg_curr_rowcol = {scany[7:3], scanx[7:3]};
assign bg_r_rowcol_adjust = bg_curr_rowcol + 2;

BG_TILE_TABLE bg_tt(
    .rclk(clk_25mhz),
    .wclk(clk_100mhz),
	 
	 .rst(rst),
	
	.r_row(bg_r_rowcol_adjust[9:5]),
	.r_col(bg_r_rowcol_adjust[4:0]),
	
	.we(bg_tile_we),
	.w_row(bg_tile_w_rowcol[9:5]),
	.w_col(bg_tile_w_rowcol[4:0]),
	
	.data_in(bg_tile_data_in),
	.data_out(bg_tile_num)
);


BG_ATTRIBUTE_TABLE bg_at (
    .rclk(clk_25mhz), 
    .wclk(clk_100mhz),
	 .rst(rst),
	 
    //.r_row(scany[7:3]), 
    //.r_col(scanx[7:3]),
	 
	 .r_row(bg_r_rowcol_adjust[9:5]),
	 .r_col(bg_r_rowcol_adjust[4:0]),
	 
    .we(bg_attr_we), 
    .w_row(bg_attr_w_rowcol[9:5]), 
    .w_col(bg_attr_w_rowcol[4:0]), 
	 
    .data_in(bg_attr_data_in),
    .data_out(bg_attr)
    );




wire [5:0] system_color;

COLOR_PALETTES color_pal(
	.clk(clk_100mhz),
	.foreground(~pixel_out[4]),
	.palette_num(pixel_out[3:2]),
	.color_num(pixel_out[1:0]),

	.system_color(system_color)
);


SYSTEM_PALETTE sys_pal(
	.color(system_color),
	.rgb(rgb_out)
);





endmodule










module t_PPU();

reg clk;
reg clk_25mhz;
reg rst;

wire vsync;
wire hsync;
wire blank, comp_sync;

reg [7:0] scanx;
reg [7:0] scany;
wire [23:0] rgb_out;


wire [9:0] pixel_x;
wire [9:0] pixel_y;


vga_logic  vgal1(clk, rst, blank, comp_sync, hsync, vsync, pixel_x, pixel_y);


localparam oam_we = 0;
localparam [7:0] oam_w_addr = 0;
localparam [7:0] oam_data_in = 0;
localparam [1:0] scalex = 1;

	 
 PPU uut(
	.clk_100mhz(clk),
	.clk_25mhz(clk),
	.rst(rst),
	.vsync(~blank),
	.hsync(~hsync),

	.scanx(pixel_x[7:0]),
	.scany(pixel_y[8:1]),
	.scalex(scalex),
	
	.oam_we(oam_we),
	.oam_w_addr(oam_w_addr),
	.oam_data_in(oam_data_in),

	.rgb_out(rgb_out)
 );

integer x, y, frame;
initial begin
	scanx = 0;
	scany = 0;
	frame = 0;

	clk = 0;
	clk_25mhz = 0;
	rst = 1;
	#10;
	rst = 0;
	#10;

//	for(frame = 0; frame < 2; frame = frame+1)begin
//		x = 0;
//		for(y = 0; y < 256; y = y+1)begin
//			scany = y;
//			for(x = 0; x < 256; x = x+1)begin
//				scanx = x;
//				#10;
//			end
//			
//			hsync = 1;
//			for(x = 0; x < 96; x = x+1)begin
//				#10;
//			end
//			x = 0;
//			hsync = 0;
//			#10;
//		end
//		
//		vsync = 1;
//		#10;
//		vsync = 0;
//		#10;
//	end
	
	
	#10;
	
	#25600;

	$stop;

	

end


always begin #5; clk = ~clk; end

always begin #20; clk_25mhz = ~clk_25mhz; end


always @(posedge vsync) frame = frame + 1;


always @(posedge clk) begin
	//$display("%d", uut.ppuctrl.state);
//	if(uut.scangen_load_sprite && uut.oamb_addr == 0) begin
//		//$display("%t load: %d, yoff: %d, attr: %d, x: %d", $time, uut.oamb_addr, uut.sprite_yoffset, uut.sprite_attr, uut.sprite_xpos);
//		$display("%b", uut.sprite_line0);
//	end
//	if(uut.sprite_in_range && uut.oam_rd_n_oamb_wr) begin
//		//$display("%t range: %d, y: %d", $time, uut.oamb_addr, uut.oam_dout);
//	end

	if(frame == 5 && pixel_y > 10'h0A0 && pixel_y <= 10'h0A8) begin
		if(uut.ppuctrl.state == 5 && ~hsync) begin
			$stop;
		end
	end
	
	if(frame == 100) $stop;

//	if(frame == 1 && scanx < 50)begin
//		if(uut.pixel_out == 0) $write(".");//"%d", uut.scangen_shift_enable);
//		else $write("%h", uut.pixel_out[3:0]);
//	end
//
//	if(vsync == 1) begin
//		$display("");
//		$display("------------------------------------------------------------------");
//	end
//
//	if(hsync == 1) begin
//		$display("");
//	end
//	if(uut.oamb_clear == 1) begin
//		//$display("CLEAR");
//	end

end



endmodule







