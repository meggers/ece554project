`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:43 11/03/2015 
// Design Name: 
// Module Name:    SPRITE_PATTERN_TABLE 
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

module SPRITE_PATTERN_TABLE(
	input clk,
	
	input [7:0] tile_num,
	input [2:0] yoffset,

	output reg [7:0] line0,
	output reg [7:0] line1
//	output [7:0] line0,
//	output [7:0] line1
);


reg [10:0] pt_addr;
wire [15:0] pt_dout;



pattern_table tbl(
	.clka(clk),
	.addra({tile_num, yoffset}),
	.douta(pt_dout)
);

//assign line0 = pt_dout[7:0];
//assign line1 = pt_dout[15:8];

always @(negedge clk) begin
//	pt_addr <= {tile_num, yoffset};
	//pt_addr = 11'd1;
	
	line0 <= pt_dout[7:0];
	line1 <= pt_dout[15:8];
end


endmodule
