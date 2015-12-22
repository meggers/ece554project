module HDT_Unit
(
	// INPUTS	
	clk, rst, Read_Reg_1, Read_Reg_2,
	Read_Reg_1_en, Read_Reg_2_en,
	IDEX_reg_rd, EXMEM_reg_rd, MEMWB_reg_rd,
	IDEX_RegWrite, EXMEM_RegWrite, MEMWB_RegWrite,
	call, ret, branch, PC_update, 

	// OUTPUTS	
	data_hazard, PC_hazard
);
  
//INPUTS//////////////////////////////////////////////////////////////

input clk, rst, call, ret, branch, PC_update;

input [4:0] Read_Reg_1;		// Registers being read by the current instruction
input [4:0] Read_Reg_2;

input Read_Reg_1_en;
input Read_Reg_2_en;

input [4:0] IDEX_reg_rd;  	// Corresponds to IDEX_reg's reg_rd_out
input [4:0] EXMEM_reg_rd; 	// Corresponds to EXMEM_reg's reg_rd_out
input [4:0] MEMWB_reg_rd; 	// Corresponds to MEMWB_reg's reg_rd_out

input IDEX_RegWrite;
input EXMEM_RegWrite;
input MEMWB_RegWrite;

//OUTPUTS/////////////////////////////////////////////////////////////

output reg data_hazard;
output reg PC_hazard;

//INTERNAL CONTROL SIGNALS////////////////////////////////////////////

reg IDEX_hazard, IDEX_hazard_1, IDEX_hazard_2;		/* Internal signals for determining if there */
reg EXMEM_hazard, EXMEM_hazard_1, EXMEM_hazard_2;  	/* is a data hazard within a pipe segment 		*/
reg MEMWB_hazard, MEMWB_hazard_1, MEMWB_hazard_2;

reg PC_update_ff;

//MAIN LOGIC//////////////////////////////////////////////////////////

always @(*) begin
    
	if (rst) begin
		PC_hazard = 1'b0;
		data_hazard = 1'b0;
	end

	/* Reset the PC_hazard when the PC_Update module finishes
       	computing the new target PC */
    	else if (PC_update | PC_update_ff) begin
		PC_hazard = 1'b0;
		if (!IDEX_RegWrite & !EXMEM_RegWrite & !MEMWB_RegWrite) begin
			data_hazard = 1'b0;
		end
		else begin
			data_hazard = data_hazard;
		end
    	end
    
	else if (branch) begin
		PC_hazard = 1'b1;
		data_hazard = 1'b0; 
	end

	else begin

	if (Read_Reg_1_en & IDEX_RegWrite) begin
		IDEX_hazard_1 = (Read_Reg_1 == IDEX_reg_rd);	//&(Read_Reg_1 ~^ IDEX_reg_rd);
	end
	else begin
		IDEX_hazard_1 = 1'b0;
	end
	if (Read_Reg_2_en & IDEX_RegWrite) begin
		IDEX_hazard_2 = (Read_Reg_2 == IDEX_reg_rd);	//&(Read_Reg_2 ~^ IDEX_reg_rd);
	end
	else begin
		IDEX_hazard_2 = 1'b0;
	end
	if (Read_Reg_1_en & EXMEM_RegWrite) begin
		EXMEM_hazard_1 = (Read_Reg_1 == EXMEM_reg_rd);	//&(Read_Reg_1 ~^ EXMEM_reg_rd);
	end
	else begin
		EXMEM_hazard_1 = 1'b0;
	end
	if (Read_Reg_2_en & EXMEM_RegWrite) begin
		EXMEM_hazard_2 = (Read_Reg_2 == EXMEM_reg_rd);	//&(Read_Reg_2 ~^ EXMEM_reg_rd);
	end
	else begin
		EXMEM_hazard_2 = 1'b0;
	end
	if (Read_Reg_1_en & MEMWB_RegWrite) begin
		MEMWB_hazard_1 = (Read_Reg_1 == MEMWB_reg_rd);	//&(Read_Reg_1 ~^ MEMWB_reg_rd);
	end
	else begin
		MEMWB_hazard_1 = 1'b0;
	end
	if (Read_Reg_2_en & MEMWB_RegWrite) begin
		MEMWB_hazard_2 = (Read_Reg_2 == MEMWB_reg_rd);	//&(Read_Reg_2 ~^ MEMWB_reg_rd);
	end
	else begin
		MEMWB_hazard_2 = 1'b0;
	end

	/* Combinational register comparisons */
        IDEX_hazard  = IDEX_hazard_1 | IDEX_hazard_2;
                     
        EXMEM_hazard = EXMEM_hazard_1 | EXMEM_hazard_2;
                     
        MEMWB_hazard = MEMWB_hazard_1 | MEMWB_hazard_2;
                       
	/* Data hazards occur when any one of the above signals are set */
        data_hazard = (IDEX_hazard | EXMEM_hazard | MEMWB_hazard);

		if (call | ret) begin
			PC_hazard = !data_hazard;
			data_hazard = data_hazard;
		end
	
	end

end

// Data Hazard Computation
//always @(*) begin
	
	
//end

always @(posedge clk) begin

	PC_update_ff <= PC_update;

end

endmodule