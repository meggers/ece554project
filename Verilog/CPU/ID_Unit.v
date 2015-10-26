module ID_Unit(clk, rst, R_I_A_type_rs, R_I_type_rt, R_funct_S_snum, R_type_rd, R_type_shamt
				I_type_imm, J_type_imm, S_type_index, A_type_imm, PC_out);

//INPUTS//////////////////////////////////////////////////////

input clk, rst;

input RegWrite;

// Shared instruction type outputs
input [5:0] opcode;				// Inst[31:26] - instruction opcode
input [4:0] R_I_A_type_rs;		// Inst[25:21] - R-type, I-type rs field
input [4:0] R_I_type_rt;		// Inst[15:11] - Register rd
input [5:0] R_funct_S_snum;		// Inst[5:0]   - R-type funct field, S-type rs field

// R-type instruction outputs
input [4:0] R_type_rd;			// Inst[20:16] - Register rd
input [4:0] R_type_shamt;		// Inst[10:6]  - Shift amount

// I-type instruction outputs
input [15:0] I_type_imm;		// Inst[20:0]  - Immediate field

// J-type instruction outputs
input [25:0] J_type_imm;		// Inst[25:0]  - Immediate field

/*
// S-type instruction outputs
input [5:0] S_type_index;		// Inst[25:20] - OAM index
input [7:0] S_type_imm;			// Inst[7:0]   - S_ATTR-type, S_TNUM-type immediate field
input [9:0] S_type_xcoor;		// Inst[19:10] - S_COOR-type x-coordinate
input [9:0] S_type_ycoor;		// Inst[9:0]   - S_COOR-type y-coordinate
*/

// A-type instruction outputs
input [20:0] A_type_imm;		// Inst[20:0]  - Immediate field

// General outputs
input [31:0] PC_out;        	// Program counter

//OUTPUTS/////////////////////////////////////////////////////

output reg [31:0] ALU_input_1;
output reg [31:0] ALU_input_2;

//INTERNAL CONTROL////////////////////////////////////////////
wire [31:0] Read_Bus_1;
wire [31:0] Read_Bus_2;
wire [31:0] sign_ext;
wire [31:0] shamt_32;

wire [31:0] sprite_begin = 32'h0C00;	// Starting location of sprite data?

RegFile_32bit RegFile( .clk(clk), .RegWrite(RegWrite), .Read_Reg_1(), .Read_Reg_2(), .Write_Reg(), .Write_Bus(), .Read_Bus_1(Read_Bus_1), .Read_Bus_2(Read_Bus_2) )

always @(alu_src) begin

	case (alu_src) begin
	
		// ALU operation on two register values
		// Instructions:	ADD, SUB, AND, NAND, XOR
		2'b00 :	begin
		
			ALU_input_1 = Read_Bus_1;
			ALU_input_2 = Read_Bus_2;
		
		end
		
		// ALU operation on register and sign extended immediate field
		// Instructions:	ANDI, ADDI, LW, SW
		2'b01 :	begin
		
			ALU_input_1 = Read_Bus_1;
			ALU_input_2 = sign_ext;
		
		end
		
		// ALU operation on register and shift amount
		// Instructions:	PUSH, POP, CALL, RET, SLL, SRL 
		2'b10 :	begin
		
			ALU_input_1 = Read_Bus_1;
			
			if (/* push, pop, ret, call */) begin
				ALU_input_2 = 32'h0001;
			end
			else begin
				ALU_input_2 = shamt_32;
			end
		end
		
		// ALU operation to compute sprite data memory location
		// Instructions:	SLD
		2'b11 :	begin
		
			ALU_input_1 = sprite_begin;
			ALU_input_2 = {26'h0000, R_funct_S_snum};
		
		end

   
endmodule
