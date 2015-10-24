module ID_Unit(clk, rst, R_I_A_type_rs, R_I_type_rt, R_funct_S_snum, R_type_rd, R_type_shamt
				I_type_imm, J_type_imm, S_type_index, A_type_imm, PC_out);

//INPUTS//////////////////////////////////////////////////////

input clk, rst;

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

// S-type instruction outputs
input [5:0] S_type_index;		// Inst[25:20] - OAM index
input [7:0] S_type_imm;			// Inst[7:0]   - S_ATTR-type, S_TNUM-type immediate field
input [9:0] S_type_xcoor;		// Inst[19:10] - S_COOR-type x-coordinate
input [9:0] S_type_ycoor;		// Inst[9:0]   - S_COOR-type y-coordinate

// A-type instruction outputs
input [20:0] A_type_imm;		// Inst[20:0]  - Immediate field

// General outputs
input [31:0] PC_out;        	// Program counter

//OUTPUTS/////////////////////////////////////////////////////

   
endmodule
