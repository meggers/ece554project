module Execute(opcode,
		R_type_shamt,
		I_type_imm,
		PC_out,
		J_type_imm,
		reg_data1,
		reg_data2,
		alu_src,
		N,Z,V,
		ALU_out);
//ASSUMTIONS:
//	-All S type instructions will be executed outside of normal CPU pipe
//	{NOT ASSUMING THIS}-PC will have seperate adder for branch instructions
//////////////////////////INPUTS/////////////////////////////
/******************* FROM IDEX - DATA **********************/
input [5:0] opcode;		// Inst[31:26] - instruction opcode

// R-type instruction outputs
input [4:0] R_type_shamt;		// Inst[10:6]  - Shift amount

// I-type instruction outputs
input [20:0] I_type_imm;		// Inst[20:0]  - Immediate field

// General outputs
input [31:0] PC_out;        		// Program counter

// J-type instruction outputs
input [25:0] J_type_imm;		// Inst[25:0]  - Immediate field

//FROM REGISTERS data read from read ports one and two from reg file
input [31:0] reg_data1, reg_data2;

// A-type instruction outputs
//output reg [4:0] A_type_as;		// Inst[25:21] - Register with address for audio playback
//output reg [20:0] A_type_imm;		// Inst[20:0]  - Immediate field



/******************* FROM IFID - CONTROL **********************/
input	[2:0] alu_src;	// ALU operand seleciton
 
/////////////////////////END INPUTS///////////////////////////


//////////////////////////OUTPUTS/////////////////////////////
output reg [31:0] ALU_out;
output reg N, Z, V;



////////////////////////END OUTPUTS///////////////////////////

wire [31:0] ALU_in1, ALU_in2;


ALU ALU1(.N(N), .Z(Z), .V(V), .ALU_in1(ALU_in1), .ALU_in2(ALU_in2), .ALU_out(ALU_out), .opcode(op));

assign ALU_in1 = (alu_src == 3'b011) ? PC_out:		//Branch 
		    		       reg_data1;	//All arithmetic
//MUXES for ALU input selection
assign ALU_in2 = (alu_src == 3'b000) ? reg_data2:	//normal arithmetic and POP PUSH
	  	 (alu_src == 2'b001) ? I_type_imm:
	 	 (alu_src == 2'b010) ? R_type_shamt:
	    	 (alu_src == 2'b011) ? J_type_imm:
				       32'h0001;


endmodule
