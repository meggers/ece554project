`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:   
// Design Name: 
// Module Name:    spart 
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
module core(
    input clk,
    input rst,
    input iocs,
    input iorw,
    output rda,
    output tbr,
    input [1:0] ioaddr,
    inout [7:0] databus,
    output txd,
    input rxd
    );
	 
	 reg [15:0] divisionBuffer;
	 reg load_baud;
	 wire [7:0] rx_buffer;
	 wire [7:0] statusReg;
	 wire baud_en;

	 TransmitRecieve TransmitRecieve0 (.clk(clk), .rxd(rxd), .baud_en(baud_en), .iorw(iorw), .rda(rda), .txd(txd), .tbr(tbr), .databus(databus), .rst(rst), .rx_buffer(rx_buffer));
	 
	 BRG BRG0(.clk(clk), .rst(rst), .load(load_baud), .DB_data(divisionBuffer), .enable(baud_en));
	 
	 ///////////////////
	 // Bus Interface //
	 ///////////////////
	 
	 assign statusReg = {6'h00, tbr, rda};
	 
	 assign databus = (iocs == 0) ? 8'h00:
			  (ioaddr == 2'b00 & iorw) ? rx_buffer:
			  (ioaddr == 2'b01 & iorw) ? statusReg: 8'hzz;
							

	//division buffer for loading the baud rate from the processor
	always@(posedge clk) begin
		if(rst) 
			divisionBuffer <= 16'h0000;
		else if(ioaddr == 2'b10) 	
			divisionBuffer <= {divisionBuffer[15:8], databus};
		else if (ioaddr == 2'b11) 
			divisionBuffer <= {databus, divisionBuffer[7:0]};
		else
			divisionBuffer <= divisionBuffer;
	end
	
	//load signal to tell BGR to load new baud rate from division buffer
	always@(posedge clk) begin
		if(rst)
			load_baud <= 1'b0;
		else if(ioaddr == 2'b11) 
			load_baud <= 1'b1;
		else
			load_baud <= 1'b0;
	end

	


endmodule
