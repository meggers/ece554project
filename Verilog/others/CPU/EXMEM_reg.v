module EXMEM_reg
(
	// INPUTS
	clk, RegWrite_in, MemWrite_in, MemRead_in, 
	MemToReg_in, MemSrc_in, DestReg_in, ALU_addr_in,
	NON_ALU_addr_in, MemWrite_data_in, call_in, ret_in,

	// OUTPUTS
	RegWrite_out, MemWrite_out, MemRead_out,
	MemToReg_out, MemSrc_out, DestReg_out,
	ALU_addr_out, NON_ALU_addr_out,
	MemWrite_data_out, call_out, ret_out
);

//INPUTS//////////////////////////////////////////////////

input			clk;
input			RegWrite_in;
input			MemWrite_in;
input			MemRead_in;
input			MemToReg_in;
input			MemSrc_in;
input			call_in;
input			ret_in;

input [4:0] 		DestReg_in;
input [31:0] 		ALU_addr_in;
input [31:0] 		NON_ALU_addr_in;
input [31:0] 		MemWrite_data_in;

//OUTPUTS/////////////////////////////////////////////////

output reg		RegWrite_out;
output reg		MemWrite_out;
output reg		MemRead_out;
output reg		MemToReg_out;
output reg		MemSrc_out;
output reg		call_out;
output reg		ret_out;

output reg [4:0] 	DestReg_out;
output reg [31:0] 	ALU_addr_out;
output reg [31:0] 	NON_ALU_addr_out;
output reg [31:0] 	MemWrite_data_out;

always @(posedge clk) begin

	RegWrite_out		<= RegWrite_in;
	MemWrite_out		<= MemWrite_in;
	MemRead_out		<= MemRead_in;
	MemToReg_out		<= MemToReg_in;
	MemSrc_out		<= MemSrc_in;
	call_out		<= call_in;
	ret_out			<= ret_in;
	DestReg_out		<= DestReg_in;
	ALU_addr_out		<= ALU_addr_in;
	NON_ALU_addr_out	<= NON_ALU_addr_in;
	MemWrite_data_out	<= MemWrite_data_in;

end

endmodule
