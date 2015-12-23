`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:53 11/13/2015 
// Design Name: 
// Module Name:    PC_control 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module PC_control
(
	// INPUTS
	clk, PC_in, PC_stack_pointer, ALU_result, flags,
	J_type_imm, branch, branch_cond, call, ret, data_hazard,
	reg_1_data, jreg,
	
	// OUTPUTS
	PC_update, PC_src,
	clr_branch_hazard_ff,
	clr_call_hazard_ff,
	clr_ret_hazard_ff,
	clr_jreg_hazard_ff
);

//INPUTS/////////////////////////////////////////////////
input				clk;
input				branch;
input [1:0]		branch_cond;

input				data_hazard;

input				call;
input 			jreg;
input [25:0]	J_type_imm;

input [5:0]		PC_in;

// FROM ID UNIT
input [31:0]	reg_1_data;

// FROM ALU
input [31:0]	ALU_result;
input [2:0]		flags;          // [Z, V, N]

// FROM MEM/WB REG
input				ret;              
input [31:0]	PC_stack_pointer;

//OUTPUTS/////////////////////////////////////////////////
output reg		clr_branch_hazard_ff;
output reg		clr_call_hazard_ff;
output reg		clr_ret_hazard_ff;
output reg		clr_jreg_hazard_ff;

output reg [31:0] 	PC_update;
output reg        	PC_src;

/////////////////////////////////////////////////
reg		clr_branch_hazard;
reg		clr_call_hazard;
reg		clr_ret_hazard;
reg		clr_jreg_hazard;

// NEEDED FOR PROPER BRANCHING
reg		clr_branch_hazard_ff_2;
/////////////////////////////////////////////////

wire branch_en;

// Set enables
assign branch_en = !(clr_branch_hazard_ff | clr_branch_hazard_ff_2);

localparam EQ	= 2'b00;
localparam NE	= 2'b01;
localparam LT	= 2'b10;

always @(*) begin
  
	if (branch && branch_en) begin
        
		PC_update = ALU_result;
        
		case(branch_cond)
            
			EQ : begin
                
				if (flags[2])
					PC_src = 1;
				else
					PC_src = 0;
			end

			NE : begin
                
				if (!flags[2])
					PC_src = 1;
				else
					PC_src = 0;
			end
            
			LT : begin
                
				if (flags[0] & !flags[1])
					PC_src = 1;
				else
					PC_src = 0;
			end

			default : begin

				PC_src = 1;

			end
            
		endcase // End of branch cases
        
		clr_branch_hazard 	= 1;	// Tell control unit to unhault pipe
		clr_call_hazard 		= 0;
		clr_ret_hazard 		= 0;
		clr_jreg_hazard		= 0;
        
	end // end branch
  
	else if (call & !data_hazard) begin
    
		PC_update	= {PC_in, J_type_imm};
		PC_src		= 1;

		clr_call_hazard		= 1;	// Tell control unit to unhault pipe
		clr_branch_hazard 	= 0;
		clr_ret_hazard 		= 0;
		clr_jreg_hazard		= 0;

	end
    
	else if (ret & !data_hazard) begin
        
		PC_update	= PC_stack_pointer;
		PC_src		= ~clr_ret_hazard_ff;

		clr_call_hazard		= 0;
		clr_branch_hazard 	= 0;
		clr_ret_hazard 		= 1;	// Tell control unit to unhault pipe
		clr_jreg_hazard		= 0;
       
	end
	
	else if (jreg & !data_hazard) begin

		PC_update	= reg_1_data;
		PC_src		= 1'b1;

		clr_call_hazard		= 0;
		clr_branch_hazard 	= 0;
		clr_ret_hazard 		= 0;
		clr_jreg_hazard		= 1;	// Tell control unit to unhault pipe
				
	end 
    
	else begin
		PC_update	= 32'hzzzzzzzz;
		PC_src		= 0;

		clr_call_hazard		= 0;
		clr_branch_hazard 	= 0;
		clr_ret_hazard 		= 0;
		clr_jreg_hazard		= 0;
	end
    
end

always @(posedge clk) begin

	clr_branch_hazard_ff		<= clr_branch_hazard;
	clr_call_hazard_ff		<= clr_call_hazard;
	clr_ret_hazard_ff			<= clr_ret_hazard;
	clr_jreg_hazard_ff		<= clr_jreg_hazard;
	
	clr_branch_hazard_ff_2	<= clr_branch_hazard_ff;

end

endmodule
            
                
                
