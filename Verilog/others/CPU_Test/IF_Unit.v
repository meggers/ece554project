module IF_Unit
(	
	// INPUTS
	clk, rst, 		// General Inputs	
	
	data_hazard, PC_hazard,	// Inputs from Hazard_Unit

	PC_control, PC_src,	// Inputs from PC_control

	instruction_in,		// Instruction from memory interface

	// OUTPUTS
	PC_plus_1, PC_curr,	// PC to IFID, PC to fetch instruction

	instr_en,

	instruction_out		// Intsruction for IFID
);

//INPUTS/////////////////////////////

input			clk, rst;

//From PC_Control
input 			PC_src;
input [31:0]		PC_control;

//From Hazard_Unit
input			PC_hazard;
input			data_hazard;

input [31:0]		instruction_in;

//OUTPUTS/////////////////////////////

output reg [31:0]	PC_plus_1;
output reg [31:0]	PC_curr;

output			instr_en;
output [31:0]		instruction_out;

//INTERNAL LOGIC//////////////////////

reg 			PC_src_ff;
reg [31:0]		PC_update;

//Instruction handling from memory////

assign instr_en 	= !(data_hazard | PC_hazard);
assign instruction_out 	= instruction_in;

//Adder for calculating next PC///////
always @(negedge clk) begin

	if (!PC_hazard) begin
		PC_plus_1 <= PC_curr + 1;
	end
	else begin
		PC_plus_1 <= PC_plus_1;
	end
end

//PC updating mux/////////////////////
always @(*) begin
	
	if (PC_src) begin
		PC_update = PC_control;
	end
	else begin
		PC_update = PC_plus_1;
	end

end

//Program counter/////////////////////
always @(posedge clk) begin

	if (rst) begin
		PC_curr <= 32'h00000000;
	end

	else if (!data_hazard) begin
		PC_curr <= PC_update;
	end
	
	else begin
		PC_curr <= PC_curr;
	end

end

endmodule
