`include "IF_Unit.v"

module IF_Unit_tb();

//INPUTS/////////////////////////////

reg			clk, rst;

//From PC_Control
reg 			PC_src;
reg [31:0]		PC_control;

//From Hazard_Unit
reg			PC_hazard;
reg			data_hazard;

reg [5:0] i;

//OUTPUTS/////////////////////////////

wire [31:0]	PC_next;
wire [31:0]	instruction;

IF_Unit IF(	.clk(clk), .rst(rst), .PC_src(PC_src), .PC_control(PC_control), 
		.PC_hazard(PC_hazard), .data_hazard(data_hazard),
		.PC_next(PC_next), .instruction(instruction));
    
//INIT CLOCK
initial begin
  forever #5 clk = ~clk; 
end

initial begin
    
	clk = 0;
	rst = 1;
	data_hazard = 0;
	PC_hazard = 0;
	PC_src = 0;

	#50;

	rst = 0;

	#50;
/*
		@(negedge clk) begin
			if(instruction != IF.PC_curr)begin
			$display("INSTRUCTION FETCH FAILED");
			$stop;
			end
  
			else begin 
			$display("INSTRUCTION FETCH PASSED");
			end
		end
*/
	@(IF.PC_curr == 32'h0000000F) begin $stop; end

end

endmodule