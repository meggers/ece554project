`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:01:35 11/13/2015 
// Design Name: 
// Module Name:    Hazard_Detect 
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

module Hazard_Detect
(
	// INPUTS	
	clk, rst, Read_Reg_1, Read_Reg_2,
	Read_Reg_1_en, Read_Reg_2_en,
	IDEX_reg_rd,
	IDEX_RegWrite, EXMEM_RegWrite, MEMWB_RegWrite,
	call, ret, branch, PC_update, ID_MemToReg,
	pop, PC_src, PC_branch_ff,
	jreg, keyboard_hazard,

	// OUTPUTS	
	data_hazard, PC_hazard, pop_haz
);
  
//INPUTS//////////////////////////////////////////////////////////////

input clk, rst, call, ret, branch, PC_update;

input [4:0] Read_Reg_1;		// Registers being read by the current instruction
input [4:0] Read_Reg_2;

input Read_Reg_1_en;
input Read_Reg_2_en;

input [4:0] IDEX_reg_rd;  	// Corresponds to IDEX_reg's reg_rd_out

input IDEX_RegWrite;
input EXMEM_RegWrite;
input MEMWB_RegWrite;

input ID_MemToReg;

input pop;
input PC_src;
input PC_branch_ff;

input jreg;
input keyboard_hazard;

//OUTPUTS/////////////////////////////////////////////////////////////

output reg 	data_hazard;
output	 	PC_hazard;
output 		pop_haz;

//INTERNAL CONTROL SIGNALS////////////////////////////////////////////

//reg			IDEX_hazard_1, IDEX_hazard_2;		/* Internal signals for determining if there
//																is a data hazard within a pipe segment.	*/

reg 			pop_square;
reg			POPPER;

reg 			PC_hazard_initial;	// For assigning the PC_hazard


// What is Truelove up to?
assign PC_hazard = PC_hazard_initial;

//MAIN LOGIC//////////////////////////////////////////////////////////

always @(*) begin
    
	if (rst) begin
		//PC_hazard_initial	= 1'b0;
		data_hazard			= 1'b0;
	end

	/* Reset the PC_hazard when the PC_Update module finishes
       	computing the new target PC */
   else if (PC_update | PC_branch_ff) begin
		//PC_hazard_initial = 1'b0;
		if (	!IDEX_RegWrite &
				!EXMEM_RegWrite &
				!MEMWB_RegWrite) begin
			data_hazard = 1'b0;
		end
		else begin
			data_hazard = data_hazard;
		end
   end
    
	else if (branch | jreg) begin
		//PC_hazard_initial = 1'b1;
		data_hazard 		= 1'b0; 
	end

	else begin

		if ((Read_Reg_1_en & IDEX_RegWrite & ID_MemToReg)&(&(Read_Reg_1 ~^ IDEX_reg_rd))) begin
				data_hazard = 1'b1;
		end

		else if ((Read_Reg_2_en & IDEX_RegWrite & ID_MemToReg)&(&(Read_Reg_2 ~^ IDEX_reg_rd))) begin
				data_hazard = 1'b1;
		end
		else begin
				data_hazard = 1'b0;
		end
			//IDEX_hazard_2 = &(Read_Reg_2 ~^ IDEX_reg_rd);
			//data_hazard = &(Read_Reg_2 ~^ IDEX_reg_rd);


								  
		/* Data hazards occur when any one of the above signals are set */
		//data_hazard = (IDEX_hazard_1 | IDEX_hazard_2);

//		if (call | ret) begin
//			PC_hazard_initial = !data_hazard;
//			//data_hazard = data_hazard;
//		end
			
		//else begin
		//	PC_hazard = PC_hazard;
			//data_hazard = data_hazard;
		//end
		
	end

end

always @(*) begin

	PC_hazard_initial	= 1'b0;

	if (rst) begin
		PC_hazard_initial	= 1'b0;
	end

	/* Reset the PC_hazard when the PC_Update module finishes
       	computing the new target PC */
   else if (PC_update | PC_branch_ff) begin
		PC_hazard_initial = 1'b0;

   end
    
	else if (branch | jreg) begin
		PC_hazard_initial = 1'b1; 
	end
	
	else if (call | ret) begin
		PC_hazard_initial = !data_hazard;
	end
end




//generates a square wave when pop is high
always @(posedge clk) begin

	if (rst) begin
		pop_square <= 1'b0;
	end
	else if (pop & ~PC_src) begin
		pop_square <= ~pop_square; 
	end
	else begin
		pop_square <= 1'b0;
	end
	
end

always @(rst, pop) begin
	
	if (rst)
		POPPER = 1'b0;
	else if (pop)
		POPPER = 1'b1;
	else
		POPPER = 1'b0;
end

//generates a hazard and allows for multiple pops in a row
assign pop_haz = (~PC_src & ~rst) ? (POPPER & ~pop_square) : 1'b0;

endmodule
