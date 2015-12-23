`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:13:56 02/10/2014 
// Design Name: 
// Module Name:    vgamult 
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
module Tronsistor32(
	clk_100mhz, rst, br_cfg, keyboard_serial_in, keyboard_serial_out,
	
	GPIO_LED_0, GPIO_LED_1, GPIO_LED_2, GPIO_LED_3, GPIO_LED_4, GPIO_LED_5, GPIO_LED_6, GPIO_LED_7,
	
	hsync, vsync, blank, clk, clk_n, D, dvi_rst, scl_tri, sda_tri,
	
	data_out, MemAddr, NON_ALU
);

    input clk_100mhz;
    input rst;
	 
	 input keyboard_serial_in;
	 output keyboard_serial_out;
	 input [1:0] br_cfg;
	 
	 output GPIO_LED_0;
	 output GPIO_LED_1;
	 output GPIO_LED_2;
	 output GPIO_LED_3;
	 output GPIO_LED_4;
	 output GPIO_LED_5;
	 output GPIO_LED_6;
	 output GPIO_LED_7;
	 
	 output hsync;
    output vsync;
	 output blank;
	 output dvi_rst;
	 
	 output [11:0] D;
	 
	 output clk;
	 output clk_n;
	 
	 inout scl_tri, sda_tri;
	 
	 output [31:0] data_out;
	 output [31:0] MemAddr;
	 output [31:0] NON_ALU;
	 
	 wire [9:0] pixel_x;
	 wire [9:0] pixel_y;
	 wire [23:0] pixel_gbrg;
	 
	 wire clkin_ibufg_out;
	 wire clk_100mhz_buf;
	 wire locked_dcm;
	 
	 wire clk_25mhz;
	 wire clkn_25mhz;
	 wire comp_sync;

	 assign clk = clk_25mhz;
	 assign clk_n = ~clk_25mhz;
		
	 wire sda_tri;
	 wire scl_tri;
	 wire sda;
	 wire scl;
	 
	 //DVI Interface
	 assign dvi_rst = ~(rst|~locked_dcm);
	 assign D = (clk)? pixel_gbrg[23:12] : pixel_gbrg[11:0];
	 //assign D = (clk)? 12'hAAA : 12'hAAA;

	 assign sda_tri = (sda)? 1'bz: 1'b0;
	 assign scl_tri = (scl)? 1'bz: 1'b0;
	 
	 // CPU/PPU Interface signals
	 wire 			PPU_en;
	 wire [5:0]		S_opcode;
	 wire [9:0]		S_type_index;
	 wire [31:0]	S_type_value;
	 
	 wire [3:0]		oam_we;
	 wire [5:0] 	oam_w_addr;
	 wire [31:0] 	oam_data_in;
	 
	 reg [3:0]		oam_we_ff;
	 reg [5:0] 		oam_w_addr_ff;
	 reg [31:0] 	oam_data_in_ff;
	 
	 wire 			bgt_we;
	 wire 			bga_we;
	 wire [9:0]		bg_w_addr;
	 wire [7:0]		bg_data_in;
	 
	 wire [1:0]		EX_forward_src_in1;
	 wire [1:0]		EX_forward_src_in2;
	
	 wire [31:0]	MEM_ALUfrwd_data;
	 wire	[31:0]	WB_ALUfrwd_data;
	 wire	[31:0]	MEM_Memfrwd_data;
	 
	 // SPART -> CPU signals

	 wire [1:0] br_cfg;
	 wire clear_keyboard_data;

	 wire [7:0] keyboard_data;
	 wire display_data;

	 wire keyboard_intr;
	 
	 wire game_tick_intr;
	 reg vsync_ff;
	 reg rst_ff;
	 

	 reg [7:0] display_ff;
	 reg handled_1;
	 reg handled_2;
	 
	 always @ (negedge clk_100mhz_buf) begin
	 
		if (rst|~locked_dcm)
			display_ff <= 8'h00;
		else if (|oam_we)
			display_ff <= oam_w_addr;
		else
			display_ff <= display_ff;
	 
	 end
	 
	 always @ (negedge clk_100mhz_buf) begin
	 
		if (rst|~locked_dcm)
			handled_1 <= 1'b0;
		else if (game_tick_intr)
			handled_1 <= ~handled_1;
		else
			handled_1 <= handled_1;
	 
	 end
	
	 always @ (negedge clk_100mhz_buf) begin
	 
		if (rst|~locked_dcm)
			handled_2 <= 1'b0;
		else if (keyboard_intr)
			handled_2 <= ~handled_2;
		else
			handled_2 <= handled_2;
	 
	 end
	 /*
	 assign GPIO_LED_0 = PPU_en;//data_out[0];
	 assign GPIO_LED_1 = &oam_we;//data_out[1];
	 assign GPIO_LED_2 = 1'b0;//vsync;//data_out[2];
	 assign GPIO_LED_3 = 1'b0;//hsync;//data_out[3];
	 assign GPIO_LED_4 = 1'b0;//blank;//data_out[4];
	 assign GPIO_LED_5 = keyboard_intr;//data_out[5];
	 assign GPIO_LED_6 = 1'b0;//clk_100mhz_buf;//data_out[6];
	 assign GPIO_LED_7 = 1'b0;//!clk_100mhz_buf;//data_out[7];
	 */
	 assign GPIO_LED_0 = handled_1;
	 assign GPIO_LED_1 = handled_2;
	 assign GPIO_LED_2 = display_ff[5];
	 assign GPIO_LED_3 = display_ff[4];
	 assign GPIO_LED_4 = display_ff[3];
	 assign GPIO_LED_5 = display_ff[2];
	 assign GPIO_LED_6 = display_ff[1];
	 assign GPIO_LED_7 = display_ff[0];
	 
	 
// Interface from VGA to DVI
dvi_ifc dvi
(
	.Clk(clk_25mhz),					// Clock input
	.Reset_n(dvi_rst),				// Reset input
	.SDA(sda),							// I2C data
	.SCL(scl),							// I2C clock
	.Done(done),						// I2C configuration done
	.IIC_xfer_done(iic_tx_done),	// IIC configuration done
	.init_IIC_xfer(1'b0)				// IIC configuration request
);
	
	
// Clock generator
vga_clk vga_clk_gen
(
	clk_100mhz,
	rst,
	clk_25mhz,
	clkin_ibufg_out,
	clk_100mhz_buf,
	locked_dcm
);
	
// VGA Logic
vga_logic  vga_logistics
(
	clk_25mhz,
	rst|~locked_dcm,
	blank,
	comp_sync,
	hsync,
	vsync,
	pixel_x,
	pixel_y
);
	 
// scales the display in the x direction
localparam [1:0] scalex = 2'h1;

SPART SPART
(
	// INPUTS
	.clk(clk_100mhz_buf),
	//.clk(clkin_ibufg_out),
	.rst(rst|~locked_dcm),

	.rxd(keyboard_serial_in),
	.txd(keyboard_serial_out),
	.br_cfg(br_cfg),
	.clr_rx(clear_keyboard_data),

	// OUTPUTS
	.data(keyboard_data),
	.key_interrupt_pulse(keyboard_intr)
);

assign game_tick_intr = ((hsync & ~vsync_ff)&~(rst|~locked_dcm|rst_ff));

always@(posedge clk_100mhz_buf) begin
	if(rst|~locked_dcm)
		vsync_ff <= 1'b0;
	else
		vsync_ff <= hsync;
end

//for gametick interrupt so it doesnt generate a game tick right after rst
always@(posedge clk_100mhz_buf) 
		rst_ff <= (rst|~locked_dcm);
		
	 
CPU CPU
(
	// INPUTS
	.clk(clk_100mhz_buf),
	//.clk(clkin_ibufg_out),
	.rst(rst|~locked_dcm),
	.keyboard_intr(keyboard_intr),
	.keyboard_data(keyboard_data),
	.game_tick_intr(game_tick_intr),
	.stack_overflow_intr(0),
	
	// OUTPUTS
	//.data_out(data_out),
	//.MemAddr(MemAddr),
	//.NON_ALU(NON_ALU),
	.S_type_index(S_type_index),
	.S_type_value(S_type_value),								// REGENERATE THE MAIN MEMORY
	.PPU_en(PPU_en),
	.opcode(S_opcode),
	
	.interrupt_return(clear_keyboard_data),
	
	.EX_forward_src_in1(EX_forward_src_in1),
	.EX_forward_src_in2(EX_forward_src_in2),
	
	.MEM_ALUfrwd_data(MEM_ALUfrwd_data),
	.WB_ALUfrwd_data(WB_ALUfrwd_data),
	.MEM_Memfrwd_data(MEM_Memfrwd_data)
);


CPU_PPU_Interface Interface
(
	.clk(clk_100mhz_buf),
	//.clk(clkin_ibufg_out),
	.rst(rst|~locked_dcm),

	//INPUTS
	.enable(PPU_en),
	.opcode(S_opcode[3:0]),
	
	.S_type_index(S_type_index),
	.S_type_value(S_type_value),
	
	.EX_forward_src_in1(EX_forward_src_in1),
	.EX_forward_src_in2(EX_forward_src_in2),
	
	.MEM_ALUfrwd_data(MEM_ALUfrwd_data),
	.WB_ALUfrwd_data(WB_ALUfrwd_data),
	.MEM_Memfrwd_data(MEM_Memfrwd_data),
	
	//OUTPUTS
	.BGTTWrite(bgt_we),
	.BGATWrite(bga_we),
	.BGWrite_addr(bg_w_addr),
	.BGWrite_data(bg_data_in),
	
	.OAMWrite(oam_we),
	.OAMWrite_addr(oam_w_addr),
	.OAMWrite_data(oam_data_in)
	
);

/*
always @(negedge clk_100mhz_buf) begin
	oam_we_ff <= oam_we;
	oam_w_addr_ff <= oam_w_addr;
	oam_data_in_ff <= oam_data_in;
end
*/

	 
PPU PPU
(
		
		.clk_100mhz(clk_100mhz_buf),
		//.clk_100mhz(clkin_ibufg_out),
		.clk_25mhz(clk_25mhz),
		.rst(rst|~locked_dcm),
		.vsync(~blank),
		.hsync(~hsync),

		.scanx(pixel_x[8:1]),
		.scany(pixel_y[8:1]),
		.scalex(scalex),
		
//*
		.oam_we(oam_we),
		.oam_w_addr(oam_w_addr),
		.oam_data_in(oam_data_in),
		
		.bg_tile_we(bgt_we),
		.bg_tile_w_rowcol(bg_w_addr),
		.bg_tile_data_in(bg_data_in),
		
		.bg_attr_we(bga_we),
		.bg_attr_w_rowcol(bg_w_addr),
		.bg_attr_data_in(bg_data_in),
/*/
		.oam_we(4'd0),
		.oam_w_addr(6'd0),
		.oam_data_in(32'd0),
		
		.bg_tile_we(1'b0),
		.bg_tile_w_rowcol(10'd0),
		.bg_tile_data_in(8'd0),
		
		.bg_attr_we(1'b0),
		.bg_attr_w_rowcol(10'd0),
		.bg_attr_data_in(8'd0),
//*/

		.rgb_out(pixel_gbrg)
	
);


 
endmodule
