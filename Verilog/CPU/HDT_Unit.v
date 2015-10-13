module HDT_Unit(IF_ID_reg_rs, IF_ID_reg_rt, IF_ID_reg_rd,
                   ID_EX_reg_rd, EX_MEM_reg_rd, MEM_WB_reg_rd,
                   jump, branch, PC_update, rst,
                data_hazard, PC_hazard);
  
//INPUTS//////////////////////////////////////////////////////////////

input rst, jump, branch, PC_update;

input [4:0] IF_ID_reg_rs;	// Registers being read by the current instruction
input [4:0] IF_ID_reg_rt;
input [4:0] IF_ID_reg_rd;

input [4:0] ID_EX_reg_rd;  	// Corresponds to IDEX_reg's reg_rd_out
input [4:0] EX_MEM_reg_rd; 	// Corresponds to EXMEM_reg's reg_rd_out
input [4:0] MEM_WB_reg_rd; 	// Corresponds to MEMWB_reg's reg_rd_out

//OUTPUTS/////////////////////////////////////////////////////////////

output reg data_hazard;
output reg PC_hazard;

//INTERNAL CONTROL SIGNALS////////////////////////////////////////////

reg IDEX_hazard;		/* Internal signals for determining if there is */
reg EXMEM_hazard;  		/* a data hazard within a pipe segment 		*/
reg MEMWB_hazard;

//MAIN LOGIC//////////////////////////////////////////////////////////

always @(*) begin
    
    if (rst) begin
        PC_hazard = 1'b0;
        data_hazard = 1'b0;
    end
    
    /* Reset the PC_hazard when the PC_Update module finishes
       computing the new target PC */
    else if (PC_update) begin
        PC_hazard = 1'b0;
        data_hazard = data_hazard;
    end
    
    // Can't have a data hazard if the current instruction is return
    else if (jump) begin
       PC_hazard = 1'b1;
       data_hazard = 1'b0; 
    end
       
    else begin

	/* Combinational register comparisons */
        IDEX_hazard  = ( (&(IF_ID_reg_rs ~^ ID_EX_reg_rd)) |
                         (&(IF_ID_reg_rt ~^ ID_EX_reg_rd)) |
                         (&(IF_ID_reg_rd ~^ ID_EX_reg_rd)) );
                     
        EXMEM_hazard = ( (&(IF_ID_reg_rs ~^ EX_MEM_reg_rd)) |
                         (&(IF_ID_reg_rt ~^ EX_MEM_reg_rd)) |
                         (&(IF_ID_reg_rd ~^ EX_MEM_reg_rd)) );
                     
        MEMWB_hazard = ( (&(IF_ID_reg_rs ~^ MEM_WB_reg_rd)) |
                         (&(IF_ID_reg_rt ~^ MEM_WB_reg_rd)) |
                         (&(IF_ID_reg_rd ~^ MEM_WB_reg_rd)) );
                       
	/* Data hazards occur when any one of the above signals are set */
        data_hazard = (IDEX_hazard | EXMEM_hazard | MEMWB_hazard);
        
	/* Data hazards shouldn't happen when one of the above signals 
	is undefined, however this will not synthesize */
        if (data_hazard === 1'bx)
    		data_hazard = 1'b0;
      
    end

end

endmodule