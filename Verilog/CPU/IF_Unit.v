module IF_Unit
(	
	// INPUTS
	clk, rst, 		// General Inputs	
	
	data_hazard, PC_hazard,	// Inputs from Hazard_Unit

	PC_control, PC_src,	// Inputs from PC_control

	// OUTPUTS
	PC_next, instruction
);

//INPUTS/////////////////////////////

input			clk, rst;

//From PC_Control
input 			PC_src;
input [31:0]		PC_control;

//From Hazard_Unit
input			PC_hazard;
input			data_hazard;

//OUTPUTS/////////////////////////////

output reg [31:0]	PC_next;
output reg [31:0]	instruction;

//INTERNAL LOGIC//////////////////////

reg [31:0]		PC_curr;
reg [31:0]		PC_update;

wire			hazard;

assign hazard 		= (data_hazard | PC_hazard);

//Adder for calculating next PC///////
always @(PC_curr) begin
	PC_next = PC_curr + 1;
end

//PC updating mux/////////////////////
always @(PC_control, PC_next) begin
	
	if (PC_src) begin
		PC_update = PC_control;
	end
	else begin
		PC_update = PC_next;
	end

end

//Program counter/////////////////////
always @(posedge clk) begin

	if (!rst & !hazard) begin
		PC_curr <= PC_update;
	end
	else if (rst) begin
		PC_curr <= 32'h00000000;
	end
	else begin
		PC_curr <= PC_curr;
	end

end

Instruction_Memory instr_mem(.clk(clk), .addr(PC_curr), .instr(instruction), .rd_en(!clk));

endmodule
