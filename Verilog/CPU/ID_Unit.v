module ID_Unit
(
	clk, rst, 	
		
	// INPUTS
	call, ret, branch, push_pop, pop,		// From CPU_control
	reg_2_sel, sign_ext_sel, alu_src,	

	RegWrite, RegWrite_Reg, RegWrite_Data,		// From WB_Unit

	R_I_A_type_rd, R_I_type_rs, R_type_rt,		// From IFID Register
	R_type_shamt, I_type_imm_in, J_type_imm,
	A_type_imm, PC_in,

	// OUTPUTS
	DestReg, I_type_imm_out, 
	ALU_input_1, ALU_input_2, PC_out,
	Read_Reg_1_out, Read_Reg_2_out
);

//INPUTS//////////////////////////////////////////////////////

input 		clk, rst;

// From Control_Logic
input 		call, ret, branch, push_pop, 
		pop, reg_2_sel, sign_ext_sel;

input [1:0] 	alu_src;		// Mux select signal for choosing the ALU inputs

// From Write Back pipe section
input 		RegWrite;
input [4:0]	RegWrite_Reg;		// Register to write data to
input [31:0] 	RegWrite_Data;		// Data to write to a register

// Shared instruction type outputs
input [4:0] 	R_I_A_type_rd;		// Inst[25:21] - R-type, I-type, A-type rd field
input [4:0] 	R_I_type_rs;		// Inst[15:11] - R-type, I-type rt field

// R-type instruction outputs
input [4:0] 	R_type_rt;		// Inst[20:16] - Register rt
input [4:0] 	R_type_shamt;		// Inst[10:6]  - Shift amount

// I-type instruction outputs
input [15:0] 	I_type_imm_in;		// Inst[20:0]  - Immediate field

// J-type instruction outputs
input [25:0] 	J_type_imm;		// Inst[25:0]  - Immediate field

// A-type instruction outputs
input [20:0] 	A_type_imm;		// Inst[20:0]  - Immediate field

// General outputs
input [31:0] 	PC_in;        		// Program counter

//OUTPUTS/////////////////////////////////////////////////////

output [4:0]		DestReg;	// Register to write data

output reg [4:0]	Read_Reg_1_out;	// RegFile first read port
output reg [4:0]	Read_Reg_2_out;	// RegFile second read port

output [15:0]		I_type_imm_out;	// J-type immediate field for LI instruction

output [31:0]		PC_out;		// Output PC+1 of current instruction
output reg [31:0] 	ALU_input_1;	// First input of the ALU
output reg [31:0] 	ALU_input_2;	// Second input of the ALU

//INTERNAL CONTROL////////////////////////////////////////////

//reg [4:0]	Read_Reg_1;		// RegFile first read port
//reg [4:0]	Read_Reg_2;		// RegFile second read port

wire [31:0] 	Read_Bus_1;		// RegFile first output data port
wire [31:0] 	Read_Bus_2;		// RegFile second output data port
reg [31:0] 	sign_ext;		// Output of the sign extension unit

wire 		SP_update;		// Signal for selecting SP register in RegFile

wire		RegWrite_en;		// Signal for writing to the Regfile (dataforwarding stuff)

assign SP_update 	= (call | ret | push_pop);

assign RegFile_we 	= (RegWrite | pop);

assign DestReg 		= R_I_A_type_rd;

assign I_type_imm_out	= I_type_imm_in;

assign PC_out		= PC_in;

//assign Read_Reg_1_out	= Read_Reg_1;
//assign Read_Reg_2_out	= Read_Reg_2;

//REGISTER FILE///////////////////////////////////////////////

RegFile_32bit RegFile( 	.clk(clk), .RegWrite(RegFile_we), .Read_Reg_1(Read_Reg_1_out),
			.Read_Reg_2(Read_Reg_2_out), .Write_Reg(RegWrite_Reg),
			.Write_Bus(RegWrite_Data), .Read_Bus_1(Read_Bus_1),
			.Read_Bus_2(Read_Bus_2) );

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

	// CALL, RET, PUSH, POP use stack pointer
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
 		sign_ext = {{16{I_type_imm_in[15]}}, I_type_imm_in};
	end

end

endmodule
