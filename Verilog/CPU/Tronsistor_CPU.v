`include "IF_Unit.v"
`include "IFID_reg.v"
`include "ID_Unit.v"
`include "HDT_Unit.v"
`include "CPU_control.v"
`include "IDEX_reg.v"
`include "EX_Unit.v"
`include "EXMEM_reg.v"
`include "MEM_Unit.v"
`include "MEMWB_reg.v"
`include "WB_Unit.v"

module Tronsistor_CPU (clk, rst);

input clk, rst;

//INTERNAL CONNECTIONS///////////////////////////////////

/* 	
	For a description of each signal connection, please
	refer to the module in which the signal is an output.
*/

// Instruction Fetch -> IFID Register
wire [31:0]	IFU_PC_out;
wire [31:0]	IFU_instruction_out;

// IFID Register -> Instruction Decode
wire [5:0] 	IFID_opcode;
wire [4:0] 	IFID_R_I_A_type_rd;
wire [4:0] 	IFID_R_I_type_rs;
wire [4:0] 	IFID_R_type_rt;
wire [4:0] 	IFID_R_type_shamt;
wire [15:0] 	IFID_I_type_imm;
wire [25:0] 	IFID_J_type_imm;
wire [5:0] 	IFID_S_type_snum;
wire [5:0] 	IFID_S_type_index;
wire [7:0] 	IFID_S_type_imm;
wire [9:0] 	IFID_S_type_xcoor;
wire [9:0] 	IFID_S_type_ycoor;
wire [20:0] 	IFID_A_type_imm;
wire [31:0] 	IFID_PC_out;
wire [31:0] 	IFID_instruction_out;

// CPU Control -> Instruction Decode, Hazard Detector
wire		CPU_cntrl_call;
wire		CPU_cntrl_ret;
wire		CPU_cntrl_branch;
wire		CPU_cntrl_push_pop;
wire		CPU_cntrl_pop;
wire		CPU_cntrl_reg_2_sel;
wire		CPU_cntrl_mem_to_reg;
wire		CPU_cntrl_mem_src;
wire		CPU_cntrl_load_imm;
wire		CPU_cntrl_sign_ext_sel;
wire [1:0] 	CPU_cntrl_alu_src;
wire		CPU_cntrl_RegWrite;
wire		CPU_cntrl_MemWrite;
wire		CPU_cntrl_OAMWrite;
wire		CPU_cntrl_MemRead;
wire [5:0] 	CPU_cntrl_opcode_out;

// Hazard_Detector -> Instruction Decode, IFID Register
wire 		data_hazard;
wire 		PC_hazard;

// PC Control -> Instruction Fetch, Hazard Detector
wire		clr_branch_hazard;
wire		clr_call_hazard;
wire		clr_ret_hazard;

wire [31:0] 	PC_cntrl_PC_update;
wire        	PC_cntrl_PC_src;

// Flags Register -> PC Control
wire [2:0]	Flags_reg_flags;

// Instruction Decode -> IDEX Register, HAzard_Unit
wire [4:0]	IDU_DestReg;
wire [4:0]	IDU_Read_Reg_1_out;
wire [4:0]	IDU_Read_Reg_2_out;
wire [15:0]	IDU_I_type_imm_out;
wire [31:0]	IDU_PC_out;
wire [31:0] 	IDU_ALU_input_1;
wire [31:0] 	IDU_ALU_input_2;

// IDEX Register -> Instruction Execute
wire		IDEX_branch_out;
wire		IDEX_call_out;
wire		IDEX_ret_out;
wire		IDEX_pop_out;
wire		IDEX_MemToReg_out;
wire		IDEX_MemSrc_out;
wire		IDEX_load_imm_out;
wire		IDEX_RegWrite_out;
wire		IDEX_MemWrite_out;
wire		IDEX_MemRead_out;
wire [4:0]	IDEX_DestReg_out;
wire [5:0] 	IDEX_opcode_out;
wire [15:0]	IDEX_I_type_imm_out;
wire [31:0] 	IDEX_ALU_input_1_out;
wire [31:0] 	IDEX_ALU_input_2_out;
wire [31:0]	IDEX_PC_out;

// Instruction Execute -> EXMEM Register
wire		EXU_RegWrite_out;
wire		EXU_MemWrite_out;
wire		EXU_MemRead_out;
wire		EXU_MemToReg_out;
wire		EXU_MemSrc_out;
wire		EXU_branch_out;
wire [4:0] 	EXU_DestReg_out;
wire [31:0] 	EXU_EX_out;	
wire [31:0] 	EXU_MemWrite_data;
wire		EXU_pop_out;
wire 		N_flag, Z_flag, V_flag;

// EXMEM Register -> Memory Interface
wire		EXMEM_RegWrite_out;
wire		EXMEM_MemWrite_out;
wire		EXMEM_MemRead_out;
wire		EXMEM_MemToReg_out;
wire		EXMEM_MemSrc_out;
wire [4:0] 	EXMEM_DestReg_out;
wire [31:0] 	EXMEM_EX_out;
wire [31:0] 	EXMEM_MemWrite_data_out;

// Memory Interface -> MEMWB Register
wire 		MEM_RegWrite_out;
wire 		MEM_MemToReg_out;
wire [4:0]	MEM_DestReg_out;
wire [31:0] 	MEM_ALU_result_out;
wire [31:0] 	MEM_MemRead_data_out;

// MEMWB Register -> Write Back
wire 		MEMWB_RegWrite_out;
wire 		MEMWB_MemToReg_out;
wire [4:0]	MEMWB_DestReg_out;
wire [31:0] 	MEMWB_ALU_result_out;
wire [31:0] 	MEMWB_MemRead_data_out;

// Write Back -> Intruction Decode (Reg File)
wire		WBU_RegWrite_out;
wire [4:0]	WBU_DestReg_out;
wire [31:0] 	WBU_RegWrite_data;

//MODULE INSTANTIATIONS//////////////////////////////////

/*
	Note that these modules have been instantiated
	in the order in which they appear in the pipeline.
*/

IF_Unit IFU 
(	

// INPUTS
		.clk(clk),
		.rst(rst),	 	
		.data_hazard(data_hazard),
		.PC_hazard(PC_hazard),
		.PC_control(PC_cntrl_PC_update),
		.PC_src(PC_cntrl_PC_src),

// OUTPUTS
		.PC_next(IFU_PC_out),
		.instruction(IFU_instruction_out)
);

IFID_reg IFID
(

// INPUTS
		.clk(clk), 
		.data_hazard(data_hazard),
		.PC_hazard(PC_hazard), 
		.instruction_in(IFU_instruction_out),
		.PC_in(IFU_PC_out),

// OUTPUTS
		.opcode(IFID_opcode),
		.R_I_A_type_rd(IFID_R_I_A_type_rd),
		.R_I_type_rs(IFID_R_I_type_rs),
		.R_type_rt(IFID_R_type_rt),
		.R_type_shamt(IFID_R_type_shamt),
		.I_type_imm(IFID_I_type_imm),
		.J_type_imm(IFID_J_type_imm), 
		.S_type_snum(IFID_S_type_snum),
		.S_type_index(IFID_S_type_index),
		.S_type_imm(IFID_S_type_imm),
		.S_type_xcoor(IFID_S_type_xcoor),
		.S_type_ycoor(IFID_S_type_ycoor),
		.A_type_imm(IFID_A_type_imm),
		.instruction_out(IFID_instruction_out), // May not be necessary
		.PC_out(IFID_PC_out)
);

ID_Unit IDU
(

// INPUTS
		.clk(clk), .rst(),
		.call(CPU_cntrl_call),
		.ret(CPU_cntrl_ret),
		.branch(CPU_cntrl_branch),
		.push_pop(CPU_cntrl_push_pop),
		.pop(EXU_pop_out), 
		.reg_2_sel(CPU_cntrl_reg_2_sel),
		.sign_ext_sel(CPU_cntrl_sign_ext_sel),
		.alu_src(CPU_cntrl_alu_src),
		.RegWrite(WBU_RegWrite_out), 
		.RegWrite_Reg(WBU_DestReg_out),
		.RegWrite_Data(WBU_RegWrite_data),
		.R_I_A_type_rd(IFID_R_I_A_type_rd),
		.R_I_type_rs(IFID_R_I_type_rs), 
		.R_type_rt(IFID_R_type_rt),
		.R_type_shamt(IFID_R_type_shamt), 			
		.I_type_imm_in(IFID_I_type_imm),
		.J_type_imm(IFID_J_type_imm),
		.A_type_imm(IFID_A_type_imm),
		.PC_in(IFID_PC_out),

// OUTPUTS
		.ALU_input_1(IDU_ALU_input_1),
		.ALU_input_2(IDU_ALU_input_2),
		.Read_Reg_1_out(IDU_Read_Reg_1_out),
		.Read_Reg_2_out(IDU_Read_Reg_2_out),
		.DestReg(IDU_DestReg),
		.I_type_imm_out(IDU_I_type_imm_out),
		.PC_out(IDU_PC_out)
);

CPU_control CPU_cntrl
(

// INPUTS
		.opcode_in(IFID_opcode),

// OUTPUTS
		.call(CPU_cntrl_call),
		.ret(CPU_cntrl_ret),
		.branch(CPU_cntrl_branch),
		.push_pop(CPU_cntrl_push_pop),
		.pop(CPU_cntrl_pop),
		.reg_2_sel(CPU_cntrl_reg_2_sel),
		.mem_to_reg(CPU_cntrl_mem_to_reg),
		.mem_src(CPU_cntrl_mem_src),
		.sign_ext_sel(CPU_cntrl_sign_ext_sel),
		.load_imm(CPU_cntrl_load_imm),
		.alu_src(CPU_cntrl_alu_src),
		.opcode_out(CPU_cntrl_opcode_out),
		.RegWrite(CPU_cntrl_RegWrite),
		.MemWrite(CPU_cntrl_MemRead),
		.MemRead(CPU_cntrl_MemRead), 
		.OAMWrite(CPU_cntrl_OAMWrite)	
);

HDT_Unit Hazard_Detect
(

// INPUTS	
		.rst(rst),
		.Read_Reg_1(IDU_Read_Reg_1_out),
		.Read_Reg_2(IDU_Read_Reg_2_out),
		.IDEX_reg_rd(IDEX_DestReg_out),
		.EXMEM_reg_rd(EXMEM_DestReg_out),
		.MEMWB_reg_rd(MEMWB_DestReg_out),
		//.IDEX_RegWrite(1'b0),
		//.EXMEM_RegWrite(1'b0),
		//.MEMWB_RegWrite(1'b0),
		.call(CPU_cntrl_call),
		.ret(CPU_cntrl_ret),
		.branch(CPU_cntrl_branch),
		.PC_update(clr_branch_hazard|clr_call_hazard|clr_ret_hazard), 

// OUTPUTS	
		.data_hazard(data_hazard),
		.PC_hazard(PC_hazard)
);
/*
Hazard_detect HDU
(
	// INPUTS
	.clk(),
	.rst(),
	.opcode(),
	.RegWrite(),
	.ALU_logic(),
	.load(),
	.push_pop(),
	.call(),
	.ret(),
	.branch(),
	.and_add_imm(),
	.R_type_rd(),
	.R_I_type_rt_rd(),
	.R_I_type_rs(),
	.rd_addr1(),
	.rd_addr2(),
	.rd_en1(),
	.rd_en2(),
	.clr_ret_haz(),
	.clr_call_haz(),
	.clr_branch_haz(),

	// OUTPUTS
	data_hazard, control_hazard
);
*/

PC_control PC_cntrl
(

// INPUTS

		.PC_in(IFID_PC_out),
		.PC_stack_pointer(MEM_MemRead_data_out),
		.ALU_result(EXU_EX_out),
		.flags(Flags_reg_flags),
		.J_type_imm(IFID_J_type_imm),
		.branch(EXU_branch_out),
		.branch_op(IDEX_opcode_out),
		.call(CPU_cntrl_call),
		.ret(MEM_ret_out), 
	
// OUTPUTS

		.PC_update(PC_cntrl_PC_update),
		.PC_src(PC_cntrl_PC_src),
		.clr_branch_hazard(clr_branch_hazard),
		.clr_call_hazard(clr_call_hazard),
		.clr_ret_hazard(clr_ret_hazard)
);

Flags_reg flags
(

// INPUTS
		.clk(clk),
		.en(ALU_done),
		.d({Z_flag,V_flag,N_flag}),
		.q(Flags_reg_flags)
);

IDEX_reg IDEX
(

// INPUTS
		.clk(clk),

		// From CPU_control
		.branch_in(CPU_cntrl_branch),
		.call_in(CPU_cntrl_call),
		.ret_in(CPU_cntrl_ret),
		.pop_in(CPU_cntrl_pop),
		.MemToReg_in(CPU_cntrl_mem_to_reg),
		.MemSrc_in(CPU_cntrl_mem_src), 
		.load_imm_in(CPU_cntrl_load_imm),
		.RegWrite_in(CPU_cntrl_RegWrite),
		.MemWrite_in(CPU_cntrl_MemWrite),
		.MemRead_in(CPU_cntrl_MemRead),
		.opcode_in(CPU_cntrl_opcode_out),
		
		// From ID_Unit
		.ALU_input_1_in(IDU_ALU_input_1),
		.ALU_input_2_in(IDU_ALU_input_2),
		.DestReg_in(IDU_DestReg),
		.I_type_imm_in(IDU_I_type_imm_out),
		.PC_in(IDU_PC_out),

// OUTPUTS
		.branch_out(IDEX_branch_out),
		.call_out(IDEX_call_out),
		.ret_out(IDEX_ret_out),
		.pop_out(IDEX_pop_out),
		.MemToReg_out(IDEX_MemToReg_out),
		.MemSrc_out(IDEX_MemSrc_out), 
		.load_imm_out(IDEX_load_imm_out),
		.RegWrite_out(IDEX_RegWrite_out),
		.MemWrite_out(IDEX_MemWrite_out),
		.MemRead_out(IDEX_MemRead_out),
		.opcode_out(IDEX_opcode_out),
	
		.ALU_input_1_out(IDEX_ALU_input_1_out),
		.ALU_input_2_out(IDEX_ALU_input_2_out),
		.DestReg_out(IDEX_DestReg_out),
		.I_type_imm_out(IDEX_I_type_imm_out),
		.PC_out(IDEX_PC_out)
);

EX_Unit EXU
(

// INPUTS
		.opcode(IDEX_opcode_out), 
		.RegWrite_in(IDEX_RegWrite_out),
		.MemWrite_in(IDEX_MemWrite_out),
		.MemRead_in(IDEX_MemRead_out),
		.MemToReg_in(IDEX_MemToReg_out),
		.MemSrc_in(IDEX_MemSrc_out),
		.DestReg_in(IDEX_DestReg_out),
		.ALU_input_1(IDEX_ALU_input_1_out),
		.ALU_input_2(IDEX_ALU_input_2_out), 
		.branch_in(IDEX_branch_out),
		.call(IDEX_call_out),
		.ret(IDEX_ret_out),
		.pop_in(IDEX_pop_out),
		.load_imm(IDEX_load_imm_out),
		.I_type_imm(IDEX_I_type_imm_out),
		.PC_in(IDEX_PC_out),

// OUTPUTS
		.RegWrite_out(EXU_RegWrite_out),
		.MemWrite_out(EXU_MemWrite_out),
		.MemRead_out(EXU_MemRead_out),
		.MemToReg_out(EXU_MemToReg_out),
		.MemSrc_out(EXU_MemSrc_out),
		.DestReg_out(EXU_DestReg_out),
		.EX_out(EXU_EX_out),
		.MemWrite_data(EXU_MemWrite_data), 
		.branch_out(EXU_branch_out),
		.pop_out(EXU_pop_out),
		.N_out(N_flag), .Z_out(Z_flag), .V_out(V_flag)
);

EXMEM_reg EXMEM
(

// INPUTS
		.clk(clk),
		.RegWrite_in(EXU_RegWrite_out),
		.MemWrite_in(EXU_MemWrite_out),
		.MemRead_in(EXU_MemRead_out), 
		.MemToReg_in(EXU_MemToReg_out),
		.MemSrc_in(EXU_MemSrc_out),
		.DestReg_in(EXU_DestReg_out),
		.EX_in(EXU_EX_out),
		.MemWrite_data_in(EXU_MemWrite_data),

// OUTPUTS
		.RegWrite_out(EXMEM_RegWrite_out),
		.MemWrite_out(EXMEM_MemWrite_out),
		.MemRead_out(EXMEM_MemRead_out),
		.MemToReg_out(EXMEM_MemToReg_out),
		.MemSrc_out(EXMEM_MemSrc_out),
		.DestReg_out(EXMEM_DestReg_out),
		.EX_out(EXMEM_EX_out),
		.MemWrite_data_out(EXMEM_MemWrite_data_out)
);

MEM_Unit Mem_Interface
(

// INPUTS
		.clk(clk),
		.rst(rst),
		.RegWrite_in(EXMEM_RegWrite_out),
		.MemWrite(EXMEM_MemWrite_out),
		.MemRead(EXMEM_MemRead_out),
		.MemToReg_in(EXMEM_MemToReg_out),
		.MemSrc(EXMEM_MemSrc_out),
		.DestReg_in(EXMEM_DestReg_out),
		.MemAcc_addr(EXMEM_EX_out),
		.MemWrite_data(EXMEM_MemWrite_data_out),

// OUTPUTS
		.RegWrite_out(MEM_RegWrite_out),
		.MemToReg_out(MEM_MemToReg_out),
		.DestReg_out(MEM_DestReg_out),
		.ALU_result_out(MEM_ALU_result_out),
		.MemRead_data(MEM_MemRead_data_out)
);

MEMWB_reg MEMWB
(

// INPUTS
		.clk(clk),
		.RegWrite_in(MEM_RegWrite_out),
		.MemToReg_in(MEM_MemToReg_out),
		.DestReg_in(MEM_DestReg_out),
		.ALU_result_in(MEM_ALU_result_out),
		.MemRead_data_in(MEM_MemRead_data_out),

// OUTPUTS
		.RegWrite_out(MEMWB_RegWrite_out),
		.MemToReg_out(MEMWB_MemToReg_out),
		.DestReg_out(MEMWB_DestReg_out),
		.ALU_result_out(MEMWB_ALU_result_out),
		.MemRead_data_out(MEMWB_MemRead_data_out)
);

WB_Unit WBU
(
// INPUTS	
		.RegWrite_in(MEMWB_RegWrite_out),
		.MemToReg(MEMWB_MemToReg_out),
		.DestReg_in(MEMWB_DestReg_out),
		.ALU_result(MEMWB_ALU_result_out), 
		.MemRead_data(MEMWB_MemRead_data_out),

// OUTPUTS
		.RegWrite_out(WBU_RegWrite_out),
		.DestReg_out(WBU_DestReg_out),
		.RegWrite_data(WBU_RegWrite_data)
);

endmodule