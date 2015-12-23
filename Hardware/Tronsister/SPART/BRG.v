`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:37:23 09/08/2015 
// Design Name: 
// Module Name:    BRG 
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
module BRG(

	clk,
	rst,
	load,
	DB_data,
	enable
	
);
	 
	input clk, rst, load;
	input [15:0] DB_data;
	
	output reg enable;

	reg load_ff1;
	reg load_ff2;
	reg [15:0] DivisionBuffer;
	reg [15:0] DownCounter;

	//reg [15:0] baud_9600 = 16'h028C;

	// Double flopped load signal for metastability
	always @ (negedge clk) begin

		load_ff1 <= load;
		load_ff2 <= load_ff1;

	end
	
	// 'State' control FF
	always @ (posedge clk) begin
	
		// If reset is asserted, immediately load the divisor for 9600 baud
		if ( rst ) begin
			DivisionBuffer <= 16'h0000;
			DownCounter <= 16'h0000;
			enable <= 0;
		end
		// Load a new baud rate divisor if prompted to by the processor
		else if ( load_ff2 ) begin
			DivisionBuffer <= DB_data;
			DownCounter <= DB_data;
			enable <= 0;
		end
		// If the down counter has expired (reached zero) set the enable signal and reload the divisor into the down counter
		else if ( ~(|DownCounter) ) begin
			DivisionBuffer <= DivisionBuffer;
			DownCounter <= DivisionBuffer;
			enable <= 1;
		end
		// If no milestones have occured decrement the down counter
		else begin
			DivisionBuffer <= DivisionBuffer;
			DownCounter <= DownCounter - 1;
			enable <= 0;
		end

   	end

endmodule
