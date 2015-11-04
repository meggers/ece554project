module MEMWB_reg
(
	// INPUTS
	clk, RegWrite_in, MemToReg_in,
	DestReg_in, ALU_result_in, MemRead_data_in,

	// OUTPUTS
	RegWrite_out, MemToReg_out, DestReg_out,
	ALU_result_out, MemRead_data_out
);

//INPUTS/////////////////////////////////////////////////////

input 		clk;
input 		RegWrite_in;
input 		MemToReg_in;
input [4:0]	DestReg_in;
input [31:0] 	ALU_result_in;
input [31:0] 	MemRead_data_in;

//OUTPUTS////////////////////////////////////////////////////

output reg 		RegWrite_out;
output reg 		MemToReg_out;
output reg [4:0]	DestReg_out;
output reg [31:0] 	ALU_result_out;
output reg [31:0] 	MemRead_data_out;

always @(posedge clk) begin

	RegWrite_out		<= RegWrite_in;
	MemToReg_out		<= MemToReg_in;
	DestReg_out		<= DestReg_in;
	ALU_result_out		<= ALU_result_in;
	MemRead_data_out	<= MemRead_data_in;

end

endmodule
