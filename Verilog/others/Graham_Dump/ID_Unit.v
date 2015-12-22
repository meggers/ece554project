`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:50:58 11/13/2015 
// Design Name: 
// Module Name:    ID_Unit 
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

module ID_Unit
(
	clk, rst, data_hazard,
		
	// INPUTS
	call, ret, branch, push, jreg,				// From CPU_control
	pop, reg_2_sel, sign_ext_sel,
	alu_src, Read_Reg_1_en, Read_Reg_2_en,

	RegWrite_in,										// From WB_Unit
	RegWrite_Reg_in,	
	RegWrite_Data_in,

	instruction_in, PC_in,							// From IFID register

	ID_forward_src_in1, ID_forward_src_in2,	// From Data_Forward
	
	// OUTPUTS
	opcode,												// To CPU_control

	DestReg, J_type_imm_out, 						// To IDEX register
	ALU_input1_mux_out, ALU_input2_mux_out,
	PC_out,
	Read_Reg_1_out, Read_Reg_2_out,
	Read_Reg_1_en_haz, Read_Reg_2_en_haz,
	MemWrite_data, intr_return,

	S_type_index, S_type_value						// To OAM_control
);

//INPUTS////////////////////////////////////////////////////////////////////////////////////

input 			clk, rst, data_hazard;

// From Control_Logic
input 			call, ret, branch, push, jreg,
					pop, reg_2_sel, sign_ext_sel,
					Read_Reg_1_en, Read_Reg_2_en;

input [1:0] 	alu_src;				// Select signal for choosing the ALU inputs

// From Write Back pipe section
input 			RegWrite_in;
input [4:0]		RegWrite_Reg_in;	// Register to write data to
input [31:0] 	RegWrite_Data_in;	// Data to write to a register

// From IFID register
input [31:0]	instruction_in;	// Current instruction
input [31:0] 	PC_in;        		// Program counter

// From Data Forward Unit
input 			ID_forward_src_in1;
input 			ID_forward_src_in2;

//OUTPUTS////////////////////////////////////////////////////////////////////////////////////

// To CPU_control
output 		[5:0] 	opcode;					// Inst[31:26] - instruction opcode

// To IDEX register
output reg	[4:0]		DestReg;					// Register to write data

output reg	[4:0]		Read_Reg_1_out;		// RegFile first read port
output reg	[4:0]		Read_Reg_2_out;		// RegFile second read port

output		[25:0] 	J_type_imm_out;		// J-type immediate field for PC control

output 		[31:0] 	PC_out;					// Output PC+1 of current instruction
output		[31:0] 	ALU_input1_mux_out;	// First input of the ALU
output		[31:0] 	ALU_input2_mux_out;	// Second input of the ALU
output		[31:0] 	MemWrite_data;			// Data read from register to write to memory

output 					Read_Reg_1_en_haz;
output 					Read_Reg_2_en_haz;

output					intr_return;			// Interrupt has been handled

// To OAM_control
output 		[9:0]		S_type_index;	/* Read_Bus_1[9:0] 	- [9:0] BG index
																			- [5:0] OAM index			*/
																		
output 		[31:0]	S_type_value;	/* Read_Bus_2		 	- [31:23]	x-coor
																			- [23:16]	tile number		
																			- [15:8]		attributes 
																			- [7:0]		y-coor		*/

//INTERNAL CONTROL////////////////////////////////////////////////////////////////////////////

// Shared instruction type outputs
wire	[4:0] 	R_I_A_type_rd;	// Inst[25:21] - R-type, I-type, A-type rd field
wire	[4:0] 	R_I_type_rs;	// Inst[15:11] - R-type, I-type rt field

// R-type instruction outputs
wire	[4:0] 	R_type_rt;		// Inst[20:16] - Register rt
wire	[4:0] 	R_type_shamt;	// Inst[10:6]  - Shift amount

// I-type instruction outputs
wire	[15:0] 	I_type_imm;		// Inst[20:0]  - Immediate field

// J-type instruction outputs
wire	[25:0] 	J_type_imm;		// Inst[25:0]  - Immediate field

// A-type instruction outputs
wire	[20:0] 	A_type_imm;		// Inst[20:0]  - Immediate field

// From Write Back pipe section
reg 				RegWrite;
reg	[4:0]		RegWrite_Reg;	// Register to write data to
reg	[31:0] 	RegWrite_Data;	// Data to write to a register

// General internal signals
wire	[31:0] 	Read_Bus_1;		// RegFile first output data port
wire	[31:0] 	Read_Bus_2;		// RegFile second output data port
reg 	[31:0] 	sign_ext;		// Output of the sign extension unit

wire 				SP_update;		// Signal for selecting SP register in RegFile

// RegFile outputs
reg 	[31:0] 	ALU_input_1;	
reg 	[31:0] 	ALU_input_2;

//General output assigns//////////////////////////////////

assign SP_update 				= (call | ret | push | pop);

assign PC_out					= PC_in;

assign J_type_imm_out 		= J_type_imm;

assign Read_Reg_1_en_haz 	= (Read_Reg_1_en & (~data_hazard));

assign Read_Reg_2_en_haz 	= (Read_Reg_2_en & (~data_hazard));

// Set to one if reading EPC register
assign intr_return 			=	1'b1 ? (jreg & (Read_Reg_1_out == 5'h1E)):
										1'b0;

//Instruction field decoder////////////////////////////////
																			//
assign opcode 			= instruction_in[31:26];				//
assign R_I_A_type_rd = instruction_in[25:21];				//
assign R_I_type_rs 	= instruction_in[20:16];				//
																			//
assign R_type_rt 		= instruction_in[15:11];				//
assign R_type_shamt 	= instruction_in[10:6];					//
																			//
assign I_type_imm 	= instruction_in[15:0];					//
																			//
assign J_type_imm 	= instruction_in[25:0];					//
																			//
assign S_type_index 	= Read_Bus_1[9:0];						//
assign S_type_value 	= Read_Bus_2;								//
																			//
assign A_type_imm 	= instruction_in[20:0];					//
																			//
///////////////////////////////////////////////////////////

//REGISTER FILE///////////////////////////////////////////////

RegFile_32bit RegFile
( 	
	.clk(clk), .RegWrite(RegWrite),
	.Read_Reg_1(Read_Reg_1_out),
	.Read_Reg_2(Read_Reg_2_out),
	.Read_Reg_1_en(Read_Reg_1_en_haz),
	.Read_Reg_2_en(Read_Reg_2_en_haz),
	.Write_Reg(RegWrite_Reg),
	.Write_Bus(RegWrite_Data),
	.Read_Bus_1(Read_Bus_1),
	.Read_Bus_2(Read_Bus_2)
);

//ALU input mux///////////////////////////////////////////////

always @(*) begin

	case (alu_src)
	
		// ALU operation on two register values
		// Instructions:	ADD, SUB, AND, NAND, XOR
		2'b00 :	begin
		
			ALU_input_1 = Read_Bus_1;
			ALU_input_2 = Read_Bus_2;
		
		end
		
		// ALU operation on register and sign extended immediate field
		// Instructions:	ANDI, ADDI, LW, SW, BRANCH
		2'b01 :	begin
		
			if (branch) begin
				ALU_input_1 = PC_in;
			end
			else begin
				ALU_input_1 = Read_Bus_1;
			end

			ALU_input_2 = sign_ext;
		
		end
		
		// ALU operation on register and shift amount
		// Instructions:	PUSH, POP, CALL, RET, SLL, SRL 
		2'b10 :	begin
		
			ALU_input_1 = Read_Bus_1;
			
			if (SP_update) begin
				ALU_input_2 = 32'h0001;
			end
			else begin
				ALU_input_2 = {26'h0000000, R_type_shamt};
			end
		end
		
		// ALU operation to compute sprite data memory location
		// Instructions:	SLD
		2'b11 :	begin
		
			ALU_input_1 = 32'h00000000;
			ALU_input_2 = 32'h00000000;
		
		end

	endcase
end

assign ALU_input1_mux_out 	= (ID_forward_src_in1 == 1'b1) ? RegWrite_Data_in: ALU_input_1;
assign ALU_input2_mux_out 	= ((ID_forward_src_in2 == 1'b1)&&(~SP_update)) ? RegWrite_Data_in: ALU_input_2;
assign MemWrite_data	  		= (ID_forward_src_in2 == 1'b1) ? RegWrite_Data_in: Read_Bus_2;

//Read_Reg_1 selector mux//////////////////////////////////////

always @(*) begin

	// CALL, RET, PUSH, POP use stack pointer
	if (SP_update) begin
		Read_Reg_1_out = 5'b11101;
	end
	else begin
		Read_Reg_1_out = R_I_type_rs;
	end

end

//Read_Reg_2 selector mux//////////////////////////////////////

always @(*) begin

	if (reg_2_sel) begin
		Read_Reg_2_out = R_type_rt;
	end
	else begin
		Read_Reg_2_out = R_I_A_type_rd;
	end

end
   
//Sign extension unit//////////////////////////////////////////////

always @(*) begin
    
	// Use of J-type immediate field
	if (sign_ext_sel) begin
		sign_ext = {{6{J_type_imm[25]}}, J_type_imm};
	end
    
	// Use of I-type immediate field
	else begin
 		sign_ext = {{16{I_type_imm[15]}}, I_type_imm};
	end

end

//Destination register selector////////////////////////////////////

always @(*) begin
    
	// PUSH sets destination register as SP
	if (call | ret | push) begin
		DestReg = 5'h1D;
	end
    
	// Use default
	else begin
 		DestReg = R_I_A_type_rd;
	end

end

//Register Write control MUX/////////////////////////////////////////////////

always @(*) begin
    
	// Reset stack pointer
	if (rst) begin
        
		RegWrite  		= 1'b1;       		// Write to SP
		RegWrite_Reg  	= 5'b11101;  		// SP register
		RegWrite_Data 	= 32'h00000FFF; 	// Reset SP
        
	end

	else begin
        
		RegWrite  		= RegWrite_in;
		RegWrite_Reg  	= RegWrite_Reg_in;
		RegWrite_Data 	= RegWrite_Data_in;
        
	end
    
end

endmodule