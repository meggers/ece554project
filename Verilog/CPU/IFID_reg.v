/* 	
	This module is the IF/ID pipeline register that lies between the instruction
	fetch and instruction decode sections of the pipe. This module is responsible 
	for taking a fetched instruction and separating it into disjoint fields of
	data for instruction decoding and execution.
*/

module IFID_reg(clk, data_hazard, PC_hazard, instruction_in, PC_in, 
			opcode, R_I_A_type_rs, R_I_type_rt, R_funct_S_snum, R_type_rd,
			R_type_shamt, I_type_imm, J_type_imm, S_type_index,
			S_type_imm, S_type_xcoor, S_type_ycoor, A_type_reg, 
			A_type_imm, PC_out);

//INPUTS///////////////////////////////////

input clk, data_hazard, PC_hazard;

input [31:0] instruction_in;   		// Instruction to execute
input [31:0] PC_in;         		// Program counter

//OUTPUTS//////////////////////////////////

// Shared instruction type outputs
output reg [5:0] opcode;			// Inst[31:26] - instruction opcode
output reg [4:0] R_I_A_type_rs;		// Inst[25:21] - R-type, I-type rs field
output reg [4:0] R_I_type_rt;		// Inst[15:11] - Register rd
output reg [5:0] R_funct_S_snum;	// Inst[5:0]   - R-type funct field, S-type rs field

// R-type instruction outputs
output reg [4:0] R_type_rd;			// Inst[20:16] - Register rt
output reg [4:0] R_type_shamt;		// Inst[10:6]  - Shift amount

// I-type instruction outputs
output reg [15:0] I_type_imm;		// Inst[20:0]  - Immediate field

// J-type instruction outputs
output reg [25:0] J_type_imm;		// Inst[25:0]  - Immediate field

// S-type instruction outputs
output reg [5:0] S_type_index;		// Inst[25:20] - OAM index
output reg [7:0] S_type_imm;		// Inst[7:0]   - S_ATTR-type, S_TNUM-type immediate field
output reg [9:0] S_type_xcoor;		// Inst[19:10] - S_COOR-type x-coordinate
output reg [9:0] S_type_ycoor;		// Inst[9:0]   - S_COOR-type y-coordinate

// A-type instruction outputs
output reg [20:0] A_type_imm;		// Inst[20:0]  - Immediate field

// General outputs
output reg [31:0] PC_out;        	// Program counter
output reg [31:0] instruction_out;	// Current instruction

//INTERNAL CONTROL SIGNALS/////////////////

//NO OPERATION FOR PIPE STALL
wire [5:0] NO_OP = 32'hF0000000;

// Main pipeline register flip flop
always @(posedge clk) begin
    
   // Don't stall the pipe
   if (!data_hazard) begin
   
	// Shared instruction type
	opcode <= instruction_in[31:26];
	R_I_A_type_rs <= instruction_in[25:21];
	R_I_type_rt <= instruction_in[20:16];
	R_funct_S_snum <= instruction_in[5:0];
	
	// R-type instruction
	R_type_rd <= instruction_in[15:11];
	R_type_shamt <= instruction_in[10:6];

	// I-type instruction
	I_type_imm <= instruction_in[15:0];

	// J-type instruction
	J_type_imm <= instruction_in[25:0];

	// S-type instruction
	S_type_index <= instruction_in[25:20];
	S_type_imm <= instruction_in[7:0];	
	S_type_xcoor <= instruction_in[19:10];
	S_type_ycoor <= instruction_in[9:0];

	// A-type instruction
	A_type_imm <= instruction_in[20:0];

	// General outputs
	PC_out <= PC_in;

   end
	
   // Stall the pipe
   else begin
	    
	// Shared instruction type
	opcode <= opcode;
	R_I_A_type_rs <= R_I_A_type_rs;
	R_funct_S_rs <= R_funct_S_snum;

	// R-type instruction
	R_type_rt <= R_type_rt;
	R_type_rd <= R_type_rd;
	R_type_shamt <= R_type_shamt;

	// I-type instruction
	I_type_imm <= I_type_imm;

	// J-type instruction
	J_type_imm <= J_type_imm;

	// S-type instruction
	S_type_index <= S_type_saddr;
	S_type_imm <= S_type_imm;
	S_type_xcoor <= S_type_xcoor;
	S_type_ycoor <= S_type_ycoor;

	// A-type instruction
	A_type_imm <= A_type_imm;

	// General outputs
	PC_out <= PC_out;
	   
   end

end

/* Flop for haulting the pipe appropriately
   during the various types of halts */
always @(posedge clk) begin
	    
	if (PC_hazard) begin
	        instruction_out <= NO_OP;
	end
	else if (data_hazard) begin
	        instruction_out <= instruction_out;
	end
	else begin
	        instruction_out <= instruction_in;
	end
end

endmodule
