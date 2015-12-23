`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:20:47 09/11/2015 
// Design Name: 
// Module Name:    TransmitRecieve 
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
module TransmitRecieve(clk,
							  rxd,
							  baud_en,
							  iorw,
							  rda,
							  txd,
							  tbr, 
							  databus,
							  rst,
							  rx_buffer);
	 input clk;
	 input rxd;
	 input baud_en;
	 input iorw;
	 input [7:0] databus;
	 input rst;
	 output reg rda;
	 output reg txd;
	 output tbr;
	 output reg [7:0] rx_buffer;		  
	
	 reg clr_rx, clr_rx_ff;
	 reg [7:0] tx_buffer;
	 reg shift_rx, shift_tx;
	 reg [4:0] cnt_rx, cnt_tx;
	 wire [4:0] nxt_cnt_rx, nxt_cnt_tx;
	 reg set_rda;
	 reg iorw_prev;
	 wire new_read_cmd, new_transmit_cmd;
	 reg [7:0] statusReg;
	 reg [4:0] baud_cnt_rx, baud_cnt_tx;
	 wire baud_en;
	 reg clr_baud_rx, clr_baud_tx;
	 wire tx_done;
	 reg send_start_bit;
	 reg set_txd;
	 wire set_recieve_done;
	 reg recieve_done;
	 reg clr_recieve_done;
	 wire set_recieve_done_pulse;
	 reg set_recieve_done_ff;
	 
	 //State signals for recieveing
	 reg [1:0] state_rx, nxt_state_rx;
	 localparam IDLE_RX = 2'h0;
	 localparam START = 2'h1;
	 localparam RX = 2'h2;
	 localparam WAIT_RX = 2'h3;


	 //State signals for transmitting
	 reg state_tx, nxt_state_tx;
	 localparam IDLE_TX = 1'h0;
	 localparam TX = 1'h1;

	 
	 //////////////////////////////////
	 // New Command Pulse Generators //
	 //////////////////////////////////
	 
	 always@(posedge clk)
		if(rst)
			iorw_prev <= 1'b0;
		else 
			iorw_prev <= iorw;
	
	 //pulse that signifies a new read
	 assign new_read_cmd = ~iorw_prev & iorw;
	 //pulse for a new transmit
	 assign new_transmit_cmd = iorw_prev & ~iorw;
	 
	 //tbr is set when a transmit is complete and cleared on new transmit command
	 assign tbr = (rst) ? 1'b1:
		      (new_transmit_cmd) ? 1'b0:
		      (tx_done) 	 ? 1'b1: tbr;
	
	//////////////////////
	// Recieve controls //
	//////////////////////
	
	//cnt_rx keeps track of bits recieved
	assign nxt_cnt_rx = cnt_rx + 1;
	
	//signal to indicate full byte has been recieved
	assign set_recieve_done = (cnt_rx == 4'h8) ? 1'b1 : 1'b0;

	always@(posedge clk) 
		set_recieve_done_ff <= set_recieve_done;

	//pulse used to set the recieve_done signal
	assign set_recieve_done_pulse = set_recieve_done & ~set_recieve_done_ff;
	
	//recieve done is used to move rx state machine from rx state to 
	//end state when a full byte has been recieved
	always@(posedge clk) begin
		if(rst)
			recieve_done <= 1'b0;
		else if(new_read_cmd || clr_recieve_done)
			recieve_done <= 1'b0;
		else if(set_recieve_done_pulse)
			recieve_done <= 1'b1;
		else
			recieve_done <= recieve_done;
	end
			
	
	//rx_buffer holds the recieved bits
	//counter to determine when full byte is recieved
	always@(posedge clk) begin
		if(rst) begin
			rx_buffer <= 8'h00;
			cnt_rx <= 4'h0;
		end
		else if(clr_rx_ff) begin
			rx_buffer <= 8'h00;
			cnt_rx <= 4'h0;
		end
		else if(shift_rx) begin 
			rx_buffer <= {rxd, rx_buffer[7:1]};
			cnt_rx <= nxt_cnt_rx;
		end
		else begin
			rx_buffer <= rx_buffer;
			cnt_rx <= cnt_rx;
		end
	end
	
	//baud counter for rx
	always@(posedge clk)
		if(rst)
			baud_cnt_rx <= 5'h00;
		else if (clr_baud_rx) 
			baud_cnt_rx <= 5'h00;
		else if(~iorw)
			baud_cnt_rx <=5'h00;	
		else if(baud_en)
			baud_cnt_rx <= baud_cnt_rx +1;
		else 
			baud_cnt_rx <= baud_cnt_rx;
	
	
	//rx fsm state reg
	always@(posedge clk) begin
		if(rst)
			state_rx <= IDLE_RX;
		else
			state_rx <= nxt_state_rx;
	end
	
	
	//flip flop for rda signal, clears rda when iorw changes from 0(write) to 1(read),
	//set rda when cnt_rx = 8, full byte has been recieved from rxd line
	always@(posedge clk) begin
		if(rst)
			rda <= 1'b0;
		else if(new_read_cmd)
			rda <= 1'b0;
		else if(set_rda)
			rda <= 1'b1;
		else 
			rda <= rda;
	end

	reg rxd_ff_1, rxd_ff_2;

	always@(posedge clk) begin
		if(rst) begin
			rxd_ff_1 <= 1'b0;
			rxd_ff_2 <= 1'b0;
		end
		else  begin
			rxd_ff_1 <= rxd;
			rxd_ff_2 <= rxd_ff_1;
		end
	end
	
	always@(*) begin
	clr_rx = 1'b0;
	shift_rx = 1'b0;
	clr_baud_rx = 1'b0;
	set_rda = 1'b0;
	clr_rx_ff = 1'b0;
	clr_recieve_done = 1'b0;
	
	case(state_rx) 
		IDLE_RX: begin
			//move to START state when start bit recieve on rxd(rxd = 0)
			if(~rxd & ~rxd_ff_1 & ~rxd_ff_2) begin 
				nxt_state_rx = START; 
				clr_rx_ff = 1'b1;
				clr_baud_rx = 1'b1;
				clr_recieve_done = 1'b1;
			end
			else begin
				nxt_state_rx = IDLE_RX;
			end
		end
		//start state is used to avoid sampling the start bit
		//only sample the rxd line for storage after 24 baud_en signals
		//24 is used since 16 is the length of the start bit, and 8 would 
		//give a sample in the middle of the first bit
		START: begin
			if(baud_cnt_rx == 5'h18) begin
				shift_rx = 1'b1;
				nxt_state_rx = RX;
				clr_baud_rx = 1'b1;
			end
			else begin
				nxt_state_rx = START;
			end
		end
		//state where bits [7:1] are sampled. Sample every 16 baud en
		RX: begin
			if(baud_cnt_rx == 5'h10 & ~recieve_done) begin
				shift_rx = 1'b1;
				clr_baud_rx = 1'b1;
				nxt_state_rx = RX;
			end
			//leave this state when 8 total bits have been recieved
			else if(recieve_done) begin
				nxt_state_rx = WAIT_RX;
				clr_baud_rx = 1'b1;
			end
			else begin
				nxt_state_rx = RX;
			end
		end
		//This state is used to hold off setting RDA until after the 
		//final bit is done sending. The final bit is sampled in the 
		//middle of its time being sent so this state waits 8 baud_en
		//signals to set rda
		WAIT_RX: begin
		 	if(baud_cnt_rx == 5'hA) begin
				nxt_state_rx = IDLE_RX;
				set_rda = 1'b1;
				//clr_rx_ff = 1'b1;
				
			end
			else
				nxt_state_rx = WAIT_RX;
		end
	endcase
	end
	
	
	
	
	///////////////////////
	// TRANSMIT CONTROLS //
	///////////////////////
	assign nxt_cnt_tx = cnt_tx + 1;
	
	//counter for bits sent over txd line
	always@(posedge clk) begin
		if(rst) 
			cnt_tx <= 5'h00;
		else if(set_txd)
			cnt_tx <=5'h00;		
		else if(shift_tx) 
			cnt_tx <= nxt_cnt_tx;
		else 
			cnt_tx <= cnt_tx;
	end
	
	//signal to indicate full byte has been recieved
	assign tx_done = (cnt_tx == 4'h9) ? 1'b1 : 1'b0;
	

   //flip flop to hold txd line
	always@(posedge clk) begin
		if(rst) 
			txd <= 1'b1;
		else if(send_start_bit)
			txd <= 1'b0;		
		else if(shift_tx) 
			txd <= tx_buffer[0];
		else if(set_txd)
			txd <= 1'b1;
		else
			txd <= txd;
	end
	
	//buffer to hold byte for transmitting. Buffer fills 
	//from databus line when new trasmit cmd is sent (iorw goes from 1 to 0)
	always@(posedge clk) begin
		if(rst) 
			tx_buffer <= 8'h00;
		else if(new_transmit_cmd)
			tx_buffer <= databus;
		else if (shift_tx) 
			tx_buffer <= {1'b0, tx_buffer[7:1]};
		else 
			tx_buffer <= tx_buffer;
	end

	//counter for baud_en signals used for tx
	always@(posedge clk) begin
		if(rst) 
			baud_cnt_tx <= 5'h00;
		else if (clr_baud_tx) 
			baud_cnt_tx <= 5'h00;
		else if(baud_en)
			baud_cnt_tx <= baud_cnt_tx +1;
		else 
			baud_cnt_tx <= baud_cnt_tx;
	end

	
	
	//tx fsm state reg
	always@(posedge clk) begin
		if(rst)
			state_tx <= IDLE_TX;
		else
			state_tx <= nxt_state_tx;
	end
	
	
	//FSM for transmitting
	always@(*)begin
	shift_tx = 1'b0;
	clr_baud_tx = 1'b0;
	send_start_bit = 1'b0;
	set_txd = 1'b0;
 
	case(state_tx)
		//Start transmitting in tx state when new transmit command(iorw = 0)
		IDLE_TX: begin
			//First bit to send is a start bit(tx = 0)
			if(~iorw) begin
				nxt_state_tx = TX;
				clr_baud_tx = 1'b1;
				send_start_bit = 1'b1;
			end
			else begin
				nxt_state_tx = IDLE_TX;
				set_txd = 1'b1;
			end
		end
		//Send a new bit every 16 baud_en signals, continue until full byte 
		//has been sent
		TX: begin
			if(baud_cnt_tx == 5'h10 & ~tx_done) begin
				nxt_state_tx = TX;
				shift_tx = 1'b1;
				clr_baud_tx = 1'b1;
			end
			else if (tbr) begin
				nxt_state_tx = IDLE_TX;
				set_txd = 1'b1;
			end
			else begin
				nxt_state_tx = TX;
			end
		end
	endcase
	end


endmodule
