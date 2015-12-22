`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:39:44 12/08/2015 
// Design Name: 
// Module Name:    Trap_Handler 
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
module Trap_Handler
(
	// INPUTS
	clk,
	rst,
	data_hazard, 
	control_hazard,
	pop_hazard,
	keyboard_intr,
	game_tick_intr,
	stack_overflow_intr,
	keyboard_data_in,
	IF_PC,
		  
	// OUTPUTS
	keyboard_hazard,
	game_tick_hazard,
	stack_overflow_hazard,
	keyboard_data_out,
	ld_idr,
	ld_epc,
	branch_to_keyboard_ISR,
	branch_to_gametick_ISR,
	branch_to_stackoverflow_ISR,
	EPC
);

input 			clk, rst;
input				data_hazard;
input				control_hazard;
input				pop_hazard;
input				keyboard_intr;
input				game_tick_intr;
input				stack_overflow_intr;
input [7:0]		keyboard_data_in;
input [31:0]	IF_PC;

output reg [7:0]	keyboard_data_out;
output reg [31:0] EPC;
output reg			ld_idr, ld_epc;
output reg			branch_to_keyboard_ISR;
output reg			branch_to_gametick_ISR;
output reg			branch_to_stackoverflow_ISR;
output reg 			keyboard_hazard;
output reg			game_tick_hazard;
output reg			stack_overflow_hazard;

//reg keyboard_data_ff;
reg [1:0]	cnt;
reg [3:0]	state, next_state;
reg			game_tick_intr_ff;
reg			stack_overflow_intr_ff;
reg			keyboard_intr_ff;
reg			clr_game_tick_intr;
reg			clr_stack_overflow_intr;
reg			clr_keyboard_intr;

wire 			hazard;
reg 			save_keyboard_data;
reg 			get_EPC;
reg 			clr_cnt;

localparam IDLE 									= 4'b0000;
localparam HOLD_KEYBOARD_INTERRUPT			= 4'b0001;
localparam HOLD_GAMETICK_INTERRUPT			= 4'b0010;
localparam HOLD_STACKOVERFLOW_INTERRUPT	= 4'b0011;
localparam EX_KEYBOARD_INTERRUPT 			= 4'b0100;
localparam EX_GAMETICK_INTERRUPT 			= 4'b0101;
localparam EX_STACKOVERFLOW_INTERRUPT		= 4'b0111;

assign hazard = (control_hazard | pop_hazard | data_hazard);

//state flop
always@(posedge clk, posedge rst) begin
	if(rst)
		state <= IDLE;
	else
		state <= next_state;
end

//data flop
always@(posedge clk, posedge rst) begin
	if(rst)
		keyboard_data_out <= 8'h00;
	else if(keyboard_intr)
		keyboard_data_out <= keyboard_data_in;
	else
		keyboard_data_out <= keyboard_data_out;
end

//epc flop START HERE!!!!!!!!!!!!!!
always@(posedge clk, posedge rst) begin
	if(rst)
		EPC <= 32'h00000000;
	else if(get_EPC)
		EPC <= IF_PC;
end

//cnt flop to count how two ticks for handling keyboard hazard operations
always@(posedge clk, posedge rst) begin
	if(rst) 
		cnt <= 2'b00;
	else if(clr_cnt)
		cnt <= 2'b00;
	else 
		cnt <= cnt + 1; 
end


//INTERRUPT FLIP FLOPS
//used to hold interrupts and allow for multiple interrupts to happen at the same
//time and all to be handled

//KEYBOARD
always@(posedge clk, posedge rst) begin
	if(rst) 
		keyboard_intr_ff <= 1'b0;
	else if(keyboard_intr)
		keyboard_intr_ff <= 1'b1;
	else if(clr_keyboard_intr)
		keyboard_intr_ff <= 1'b0;
	else
		keyboard_intr_ff <= keyboard_intr_ff;
end

//STACK OVERFLOW
always@(posedge clk, posedge rst) begin
	if(rst) 
		stack_overflow_intr_ff <= 1'b0;
	else if(stack_overflow_intr)
		stack_overflow_intr_ff <= 1'b1;
	else if(clr_stack_overflow_intr)
		stack_overflow_intr_ff <= 1'b0;
	else
		stack_overflow_intr_ff <= stack_overflow_intr_ff;
end

//GAME TICK 
always@(posedge clk, posedge rst) begin
	if(rst) 
		game_tick_intr_ff <= 1'b0;
	else if(game_tick_intr)
		game_tick_intr_ff <= 1'b1;
	else if(clr_game_tick_intr)
		game_tick_intr_ff <= 1'b0;
	else
		game_tick_intr_ff <= game_tick_intr_ff;
end

always@(*) begin	

keyboard_hazard					= 1'b1;		//hazard in all states but IDLE
game_tick_hazard					= 1'b1;
stack_overflow_hazard			= 1'b1;
save_keyboard_data				= 1'b0;
clr_cnt								= 1'b0;
get_EPC								= 1'b0;
ld_idr								= 1'b0;
ld_epc								= 1'b0;
branch_to_keyboard_ISR			= 1'b0;
branch_to_gametick_ISR			= 1'b0;
branch_to_stackoverflow_ISR	= 1'b0;
clr_game_tick_intr				= 1'b0;
clr_keyboard_intr					= 1'b0;
clr_stack_overflow_intr			= 1'b0;

case(state)
	IDLE:begin
		keyboard_hazard = 1'b0;
		game_tick_hazard = 1'b0;
		stack_overflow_hazard = 1'b0;
		/////KEYBOARD///////
		if(keyboard_intr & hazard) begin		//If there is a hazard in pipe, need to wait till hazard clears to proceed
			save_keyboard_data = 1'b1;
			next_state = HOLD_KEYBOARD_INTERRUPT;	
			keyboard_hazard = 1'b1;
		end
		else if(keyboard_intr & ~hazard) begin
			save_keyboard_data = 1'b1;
			get_EPC = 1'b1;
			next_state = EX_KEYBOARD_INTERRUPT;
			keyboard_hazard = 1'b1;
			clr_cnt = 1'b1;
			//ld_idr = 1'b1;
		end
		/////GAMETICK///////
		else if(game_tick_intr & hazard) begin
			game_tick_hazard = 1'b1;
			next_state = HOLD_GAMETICK_INTERRUPT;			
		end
		else if(game_tick_intr & ~hazard) begin
			get_EPC = 1'b1;
			game_tick_hazard = 1'b1;
			next_state = EX_GAMETICK_INTERRUPT;	
			clr_cnt = 1'b1;		
		end
		//////STACKOVERFLOW////////// ---NOT WORKING CURRENTLY
		else if(stack_overflow_intr & hazard) begin
			stack_overflow_hazard = 1'b1;
			next_state = HOLD_STACKOVERFLOW_INTERRUPT;			
		end
		else if(stack_overflow_intr & ~hazard) begin
			get_EPC = 1'b1;
			stack_overflow_hazard = 1'b1;
			next_state = EX_STACKOVERFLOW_INTERRUPT;	
			clr_cnt = 1'b1;		
		end
		else begin
			next_state = IDLE;
		end		
	end

	HOLD_KEYBOARD_INTERRUPT: begin
		get_EPC = 1'b1;
		game_tick_hazard = 1'b0;
		stack_overflow_hazard = 1'b0;
		if(hazard) begin
			next_state = HOLD_KEYBOARD_INTERRUPT;
		end
		else begin
			next_state = EX_KEYBOARD_INTERRUPT;
			clr_cnt = 1'b1;
			//ld_idr = 1'b1;
		end
	end

	EX_KEYBOARD_INTERRUPT: begin
		game_tick_hazard = 1'b0;
		stack_overflow_hazard = 1'b0;
		if(cnt[1]) begin			//if count is 2, done (during count = 0 idr is loaded with data from interrupt, 
			branch_to_keyboard_ISR = 1'b1;  //during count = 1 epc is writen with pc value, and hazard handling is done when count is 2, branch to isr)
			next_state = IDLE;
			clr_keyboard_intr = 1'b1;
		end
		else begin
			ld_idr = ~cnt[0]; 		//first cycle load idr 
			ld_epc = cnt[0];		//second cycle load epc
			next_state = EX_KEYBOARD_INTERRUPT;
		end
	end
	
	HOLD_GAMETICK_INTERRUPT: begin
		keyboard_hazard = 1'b0;
		stack_overflow_hazard = 1'b0;
		get_EPC = 1'b1;		
		if(hazard) begin
			next_state = HOLD_GAMETICK_INTERRUPT;
		end
		else begin
			next_state = EX_GAMETICK_INTERRUPT;
			clr_cnt = 1'b1;
		end
	end

	EX_GAMETICK_INTERRUPT: begin
		stack_overflow_hazard = 1'b0;
		keyboard_hazard = 1'b0;
		if(cnt[0]) begin
			branch_to_gametick_ISR = 1'b1;
			next_state = IDLE;
			clr_game_tick_intr = 1'b1;
		end
		else begin
			ld_epc = ~cnt[0];
			next_state = EX_GAMETICK_INTERRUPT;
		end
	end

	HOLD_STACKOVERFLOW_INTERRUPT: begin
		keyboard_hazard = 1'b0;
		game_tick_hazard = 1'b0;
		get_EPC = 1'b1;
		if(hazard)begin
			next_state = HOLD_STACKOVERFLOW_INTERRUPT;
		end
		else begin
			next_state = EX_STACKOVERFLOW_INTERRUPT;
			clr_cnt = 1'b1;
		end
	end

	EX_STACKOVERFLOW_INTERRUPT: begin
		keyboard_hazard = 1'b0;
		game_tick_hazard = 1'b0;
		if(cnt[0]) begin
			branch_to_stackoverflow_ISR = 1'b1;
			next_state = IDLE;	
			clr_stack_overflow_intr = 1'b1;
		end
		else begin
			next_state = EX_STACKOVERFLOW_INTERRUPT;
			ld_epc = ~cnt[0];
		end
	end

endcase
end

endmodule 
