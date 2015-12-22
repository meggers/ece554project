`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    driver 
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
module driver(
    input clk,
    input rst,
    input [1:0] br_cfg,
    output reg iocs,
    output reg iorw,
    input rda,
    input tbr,
    output reg [1:0] ioaddr,
    inout [7:0] databus
    );

//IOCS = I/O chip select. Set to one to activate the SPART
//IOR/Wbar ? When 1, the reading from SPART to the PROCESSOR, when 0 reading from the PROCESSOR to the SPART
//RDA ? Receive data available => data can be read by the processor from the SPART. 
//TBR ? Transmit buffer ready => data can be sent from the processor to the SPART
//IOADDR ? I/O address of register to read or write
//DATABUS ? Data to be sent or received
//SPART is fully synchronous with the clock ? all transfers occur on a positive clock edge.  
//The received data on RxD is asynchronous. The transmit via TxD is also asynchronous. 

 	//typedef enum logic[1:0] {LOAD_BAUD, IDLE, TRANSMIT} state_t;
	//state_t state, nxt_state;
	localparam LOAD_BAUD = 2'b00;
	localparam IDLE = 2'b01;
	localparam TRANSMIT = 2'b10;

//reg [15:0] baud_4800 = 16'h0516;
//reg [15:0] baud_9600 = 16'h028B;
//reg [15:0] baud_19200 = 16'h0145;
//reg [15:0] baud_38400 = 16'h00A3;
reg [1:0] state, nxt_state;

reg boot_complete;

reg [7:0] data;
wire [15:0] baud_rate;

assign databus = (iorw == 0) ? data : 8'hzz;

always @ (posedge clk) begin

	if (rst) begin
		state <= LOAD_BAUD;
		boot_complete <= 0;
	end
	else begin
		state <= nxt_state;
		boot_complete <= 1;
	end
end

assign 	baud_rate = (br_cfg == 2'b00) ? 16'h0516:
		    (br_cfg == 2'b01) ? 16'h028B:
	  	    (br_cfg == 2'b10) ? 16'h0145:
		    (br_cfg == 2'b11) ? 16'h00A3: 
		    16'h028B; // Default to 9600 baud

always@(*) begin
	data = data;
	case(state) 
		
		// State for reseting the SPART baud rate
		LOAD_BAUD: begin

		 	iorw = 0;
			iocs = 1;

			// boot_complete flag is cleared upon reset and controls
			// the order in which the new baud rate's bytes are sent
			// to the Baud Rate Generator via databus
			if (!boot_complete) begin

				ioaddr = 2'b10; 		// Division Buffer (Low byte)
				data = baud_rate[7:0];
				nxt_state = LOAD_BAUD;

			end
			else begin

				ioaddr = 2'b11;			// Division Buffer (High Byte)
				data = baud_rate[15:8];
				nxt_state = IDLE;

			end
		end

		// State for listening to rda and tbr interrupt signals
		IDLE: begin
			
			iorw = 1;
			ioaddr = 2'b00;

			if (rda & tbr) begin

				// Data is ready for transfer, save it into
				// the data register and switch states
				nxt_state = TRANSMIT;
				data = databus;

			end

			else begin

				// No data is ready yet, so wait
				nxt_state = IDLE;
				data = data;
			

			end

		end

		// State for transmitting the data received via
		// databus back to the SPART
		TRANSMIT: begin

			// Tell the SPART that the Transmit Buffer
			// data is coming on databus
			iorw = 0;
			ioaddr = 2'b00;			

			// Set databus to the data received from 
			// Receive Buffer and transition back to 
			// the IDLE listening state
			data = data;
			nxt_state = IDLE;

		end
	endcase
end

endmodule
