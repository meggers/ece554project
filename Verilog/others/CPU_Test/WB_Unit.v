module WB_Unit
(
	// INPUTS	
	MemToReg, MemRead_data, ALU_result, 
	DestReg_in, RegWrite_in,

	// OUTPUTS
	DestReg_out, RegWrite_out,
	RegWrite_data
);

//INPUTS/////////////////////////////////////////////////////////////

input 		RegWrite_in;
input 		MemToReg;
input [4:0]	DestReg_in;
input [31:0] 	ALU_result;
input [31:0] 	MemRead_data;

//OUTPUTS////////////////////////////////////////////////////////////

output			RegWrite_out;
output [4:0]		DestReg_out;
output reg [31:0] 	RegWrite_data;

//INTERNAL CONTROL///////////////////////////////////////////////////

assign DestReg_out = DestReg_in;

assign RegWrite_out = RegWrite_in;

// Mux for selecting writeback data source
always @(MemRead_data, ALU_result, MemToReg) begin

	if (MemToReg) begin
		RegWrite_data = MemRead_data;
	end
	else begin
		RegWrite_data = ALU_result;
	end

end

endmodule
