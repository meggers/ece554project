`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:10:53 11/03/2015 
// Design Name: 
// Module Name:    PPUCTRL 
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
module PPU_OAMCTRL(
	input clk_100mhz,
	input clk_25mhz,
	input rst,

	input hsync,
	input vsync,
	input [7:0] scany,
	input [7:0] scanx,
	
	input sprite_in_range,
	input [7:0] oamb_dout,

	output oam_copy,

	output oamb_clear,
	output reg [2:0] oamb_addr,
	output reg [5:0] oam_addr,
	output reg [1:0] oam_byte_sel,
	output reg oam_rd_n_oamb_wr,
	
	output reg [2:0] sprite_yoffset,
	output reg [7:0] sprite_tile_num,
	output reg [7:0] sprite_attr,
	output reg [7:0] sprite_xpos,
	output scangen_load_sprite,
	output scangen_shift_enable,

	output [9:0] bg_next_rowcol,
	output [2:0] bg_next_yoffset

);

localparam STATE_WAIT_FOR_VSYNC	= 0;
localparam STATE_OAM_COPY		= 1;
localparam STATE_CLEAR_OAMB		= 2;
localparam STATE_CHECK_SPRITE	= 3;
localparam STATE_LOAD_SPRITE	= 4;
localparam STATE_WAIT_FOR_HSYNC = 5;
localparam STATE_SETUP_SCANGEN	= 6;
localparam STATE_LOAD_SCANGEN	= 7;

// state registers
reg [2:0] state;
reg [2:0] next_state;
reg toggle;
reg [7:0] current_y;


wire [9:0] rowcol;
assign rowcol = {scany[7:3], scanx[7:3]};
assign bg_next_rowcol = rowcol + 1;

assign bg_next_yoffset = scany[2:0] + 1;


assign oam_copy = (state == STATE_OAM_COPY) ? 1 : 0;
assign oamb_clear = (state == STATE_CLEAR_OAMB) ? 1 : 0;
assign scangen_load_sprite = (state == STATE_LOAD_SCANGEN) ? 1 : 0;
assign scangen_shift_enable = (state != STATE_LOAD_SCANGEN && state != STATE_SETUP_SCANGEN && ~hsync && ~vsync) ? 1 : 0;



////////////////////////////////////////////////////////////////////////////////
//    Synchronous State Changing
////////////////////////////////////////////////////////////////////////////////
always @(posedge clk_100mhz) begin
	if (rst) state <= STATE_WAIT_FOR_VSYNC;
	else state <= next_state;
end


////////////////////////////////////////////////////////////////////////////////
//    State Transition Logic
////////////////////////////////////////////////////////////////////////////////
always @( * ) begin

	next_state = state;
	
	case (state)
		STATE_WAIT_FOR_VSYNC: begin
			if (vsync) next_state = STATE_OAM_COPY;
		end
		
		STATE_OAM_COPY: begin
			next_state = STATE_CLEAR_OAMB;
		end
		
		STATE_CLEAR_OAMB: begin
			if(oam_rd_n_oamb_wr && oamb_addr == 7 && oam_byte_sel == 3) next_state = STATE_CHECK_SPRITE;
		end
		
		STATE_CHECK_SPRITE: begin
			if(oam_rd_n_oamb_wr) begin
				if (sprite_in_range) next_state = STATE_LOAD_SPRITE;
				else if(oam_addr == 63) next_state = STATE_WAIT_FOR_HSYNC;
			end else if(oam_addr == 63) begin
				next_state = STATE_WAIT_FOR_HSYNC;
			end
		end
		
		STATE_LOAD_SPRITE: begin
			if(oam_rd_n_oamb_wr && oam_byte_sel == 3) begin
				if (oamb_addr == 7) next_state = STATE_WAIT_FOR_HSYNC;
				else next_state = STATE_CHECK_SPRITE;
			end
		end
		
		STATE_WAIT_FOR_HSYNC: begin
			if (hsync) next_state = STATE_SETUP_SCANGEN;
		end
		
		STATE_SETUP_SCANGEN: begin
			if (oam_byte_sel == 3 && toggle == 1) next_state = STATE_LOAD_SCANGEN;
		end
		
		STATE_LOAD_SCANGEN: begin
			if(toggle) begin
			
				if(oamb_addr == 7) begin
					if (current_y == 255) next_state = STATE_WAIT_FOR_VSYNC;
					else next_state = STATE_CLEAR_OAMB;
				end else begin
					next_state = STATE_SETUP_SCANGEN;
				end
				
			end
				
		end
		
	endcase
	
end





always @(posedge clk_100mhz) begin
	
	if(rst) begin
		oamb_addr <= 0;
		oam_addr <= 0;
		oam_byte_sel <= 0;
		oam_rd_n_oamb_wr <= 1;

		sprite_yoffset <= 0;
		sprite_tile_num <= 0;
		sprite_attr <= 0;
		sprite_xpos <= 0;
		toggle <= 0;
		current_y <= 0;
		
	end else begin

		case(state)

			STATE_WAIT_FOR_VSYNC: begin

				// sort of like a reset
				oamb_addr <= 0;
				oam_addr <= 0;
				oam_byte_sel <= 0;
				oam_rd_n_oamb_wr <= 1;
		
				sprite_yoffset <= 0;
				sprite_tile_num <= 0;
				sprite_attr <= 0;
				sprite_xpos <= 0;
				current_y <= scany;
			end

			STATE_OAM_COPY: begin
				current_y <= scany;
			end

			STATE_CLEAR_OAMB: begin
				oamb_addr		<=	(oam_rd_n_oamb_wr == 0)? oamb_addr
									:(oam_byte_sel == 3 && oamb_addr == 7)? 0
									:(oam_byte_sel == 3)? oamb_addr + 1
									:oamb_addr;

				oam_byte_sel	<=	(oam_rd_n_oamb_wr == 0)? oam_byte_sel
									:(oam_byte_sel == 3)? 0
									:oam_byte_sel + 1;

				oam_rd_n_oamb_wr <= ~oam_rd_n_oamb_wr;
				current_y <= scany;
			end

			STATE_CHECK_SPRITE: begin
			
				oam_addr		<= (sprite_in_range == 1 && oam_rd_n_oamb_wr == 1) ? oam_addr : (oam_rd_n_oamb_wr == 1) ? oam_addr + 1 : oam_addr;
				oam_byte_sel	<= (sprite_in_range == 1 && oam_rd_n_oamb_wr == 1) ? 1 : 0;

				oam_rd_n_oamb_wr <= ~oam_rd_n_oamb_wr;
				current_y <= current_y;
			end

			STATE_LOAD_SPRITE: begin
			
				if(oam_rd_n_oamb_wr) begin
					if(oam_byte_sel == 3) begin
						oam_addr <= oam_addr + 1;
						oamb_addr <= oamb_addr + 1;
					end else begin
						oam_addr <= oam_addr;
						oamb_addr <= oamb_addr;
					end
					
					oam_byte_sel <= oam_byte_sel + 1;
					
					
				end else begin
					oam_addr <= oam_addr;
					oamb_addr <= oamb_addr;
					oam_byte_sel <= oam_byte_sel;
				end
				
				current_y <= current_y;
				
				oam_rd_n_oamb_wr <= ~oam_rd_n_oamb_wr;
			end

			STATE_WAIT_FOR_HSYNC: begin
				
				oamb_addr <= 0;
				oam_addr <= 0;
				oam_byte_sel <= 0;
				oam_rd_n_oamb_wr <= 0;
				toggle <= 0;
				
				sprite_yoffset		<= 0;
				sprite_tile_num	<= 0;
				sprite_attr			<= 0;
				sprite_xpos			<= 0;
				
				current_y <= current_y;
			end

			STATE_SETUP_SCANGEN: begin
				oam_rd_n_oamb_wr <= 0;
				
				if(toggle == 0) begin
					// wait
				end else begin
				
					if(oam_byte_sel == 0) begin
						sprite_yoffset		<= (current_y + 1) - oamb_dout;
					end else if(oam_byte_sel == 1) begin
						sprite_tile_num	<= oamb_dout[7:0];
					end else if(oam_byte_sel == 2) begin
						sprite_attr	<= oamb_dout[7:0];
					end else if(oam_byte_sel == 3) begin
						sprite_xpos	<= oamb_dout[7:0];
					end
					
					oam_byte_sel <= oam_byte_sel + 1;
					
				end
				
				toggle <= ~toggle;
				current_y <= current_y;
				
			end

			STATE_LOAD_SCANGEN: begin
			
				if (toggle) begin
					oamb_addr <= oamb_addr + 1;
					oam_byte_sel <= 0;
				end
				
				toggle <= ~toggle;
				current_y <= current_y;
			end
		
		endcase
	end



end


endmodule