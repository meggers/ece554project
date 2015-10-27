module IDEX_reg(clk, opcode_in, ALU_input_1_in, ALU_input_2_in, load_imm_in, J_type_imm_in,
			opcode_out, ALU_input_1_out, ALU_input_2_out, load_imm_out, J_type_imm_out );

//INPUTS/////////////////////////////

input		clk;
input [5:0] 	opcode_in;
input [31:0] 	ALU_input_1_in;
input [31:0] 	ALU_input_2_in;
input 		load_imm_in;
input [25:0]	J_type_imm_in;

//OUTPUTS/////////////////////////////

output reg [5:0] 	opcode_out;
output reg [31:0] 	ALU_input_1_out;
output reg [31:0] 	ALU_input_2_out;
output reg		load_imm_out;
output reg [25:0]	J_type_imm_out;

always @(posedge clk) begin

	opcode_out 	<= opcode_in;
	ALU_input_1_out <= ALU_input_1_in;
	ALU_input_2_out <= ALU_input_2_in;
	load_imm_out 	<= load_imm_in;
	J_type_imm_out 	<= J_type_imm_in;

end

endmodule
