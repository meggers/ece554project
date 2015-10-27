module EX_Unit(opcode,
		ALU_in1,
		ALU_in2,
		load_imm,
		J_type_imm,
		N,Z,V,
		EX_out);
//ASSUMTIONS:
//	-All S type instructions will be executed outside of normal CPU pipe
//	{NOT ASSUMING THIS}-PC will have seperate adder for branch instructions

//INPUTS//////////////////////////////////////////////////////
/******************* FROM IDEX - DATA **********************/

input load_imm;

input [5:0] opcode;			// Inst[31:26] - instruction opcode

input [31:0] ALU_in1;
input [31:0] ALU_in2;

// J-type instruction outputs
input [25:0] J_type_imm;		// Inst[25:0]  - Immediate field

//OUTPUTS/////////////////////////////////////////////////////

output reg [31:0] EX_out;
output reg N, Z, V;

//INTERNAL CONTROL////////////////////////////////////////////

reg [31:0] ALU_out;

//ARITHMETIC LOGIC UNIT///////////////////////////////////////

ALU ALU1(.N(N), .Z(Z), .V(V), .ALU_in1(ALU_in1), .ALU_in2(ALU_in2), .ALU_out(ALU_out), .opcode(op));


always @(load_imm) begin

	if (load_imm) begin
		EX_out = {6'b000000, J_type_imm};
	end
	else begin
		EX_out = ALU_out;
	end

end

endmodule
