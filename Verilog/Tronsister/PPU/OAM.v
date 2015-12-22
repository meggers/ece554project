`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:09 11/03/2015 
// Design Name: 
// Module Name:    OAM 
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
module OAM_v(
	input rclk,
	input wclk,
	input rst,
	
	input [7:0] r_addr,
	input r_enable,
	
	input [5:0] w_addr,
	input [3:0] w_enable,
	
	input [31:0] data_in,

	output [7:0] data_out
);

wire [7:0] data_out_temp;
reg [7:0] data_out_ff;
wire read_enable;

//reg [5:0] OAM_addr;
//reg rst_ff;

// only read when not writing
assign read_enable = ~(w_enable[3] | w_enable[2] | w_enable[1] | w_enable[0]);
	
	/*
always @(posedge wclk) begin

	if (rst & ~rst_ff) begin
		OAM_addr <= 6'h00;
	end
	else if (rst & rst_ff) begin
		OAM_addr <= OAM_addr + 1;
	end
	else begin
		OAM_addr <= OAM_addr;
	end

end


always @(posedge wclk) begin

	if (rst) begin
		rst_ff <= rst;
	end
	else begin
		rst_ff <= rst_ff;
	end

end
*/

	
OAM_RAM oam0(
  .clka(wclk), // input clka
  .wea(w_enable), // input [3 : 0] wea
  .addra(w_addr), // input [5 : 0] addra
  .dina(data_in), // input [31 : 0] dina
  
  .enb(read_enable),
  .clkb(rclk), // input clkb
  .rstb(rst), // input rstb
  .addrb(r_addr), // input [7 : 0] addrb
  .doutb(data_out) // output [7 : 0] doutb
);


//always @(posedge wclk) begin
//	data_out_ff <= data_out_temp;
//end

always @(negedge rclk) begin
//	data_out <= data_out_ff;
	//data_out <= data_out_temp;
end



endmodule