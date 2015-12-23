`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:   
// Design Name: 
// Module Name:    top_level 
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
module SPART
(
    input clk,         	// 100mhz clock
    input rst,         	// Asynchronous reset, tied to dip switch 0
    input rxd,         	// RS232 Recieve Data
    input [1:0] br_cfg, // Baud Rate Configuration, Tied to dip switches 2 and 3

	 output reg [7:0] data,
	 output txd,
	 input clr_rx,
	 output key_interrupt_pulse
);
	
	wire iocs;
	wire iorw;
	wire rda;
	wire tbr;
	wire [1:0] ioaddr;
	wire [7:0] databus;
	wire rda_pulse;
	reg rda_ff;
	reg key_interrupt;
	reg key_interrupt_ff2;
	
	assign rda_pulse = rda & ~rda_ff;
	
	always@(posedge clk, posedge rst) begin
		if(rst) 
			rda_ff <= 1'b0;
		else
			rda_ff <= rda;
	end
	
	always@(posedge clk, posedge rst)begin
		if(rst)
			data <= 8'h0;
		else if(key_interrupt)
			data <= data;
		else if(rda_pulse)
			data <= databus;
		else
			data <= data;
	end
	
	always@(posedge clk, posedge rst) begin
		if(rst)
			key_interrupt_ff2 <= 1'b0;
		else 
			key_interrupt_ff2 <= key_interrupt;
	end
	
	assign key_interrupt_pulse = key_interrupt & ~key_interrupt_ff2;		
		
	always@(posedge clk, posedge rst) begin
		if(rst)
			key_interrupt <= 1'b0;
		else if(rda_pulse & ~clr_rx) 
			key_interrupt <= 1'b1;
		else if(clr_rx)
			key_interrupt <= 1'b0;
		else
			key_interrupt <= key_interrupt;
	end
	
		
	// Instantiate your SPART here
	core spart0( .clk(clk),
                      .rst(rst),
		      .iocs(iocs),
    	 	      .iorw(iorw),
		      .rda(rda),
		      .tbr(tbr),
		      .ioaddr(ioaddr),
		      .databus(databus),
		      .txd(txd),
		      .rxd(rxd)
					);

	// Instantiate your driver here
	driver driver0( .clk(clk),
	                .rst(rst),
			.br_cfg(br_cfg),
			.iocs(iocs),
			.iorw(iorw),
			.rda(rda),
			.tbr(tbr),
			.ioaddr(ioaddr),
			.databus(databus)
					 );
					 
endmodule
