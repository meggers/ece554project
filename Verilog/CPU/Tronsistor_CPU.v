`include "IF_Unit.v"
`include "IFID_reg.v"
`include "ID_Unit.v"
`include "IDEX_reg.v"
`include "EX_Unit.v"

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

// CPU_control -> Instruction Decode, Hazard Detector
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

// Instruction Decode -> IDEX Register
wire [4:0]	IDU_DestReg;
wire [25:0]	IDU_J_type_imm_out;
wire [31:0]	IDU_PC_out;
wire [31:0] 	IDU_ALU_input_1;
wire [31:0] 	IDU_ALU_input_2;

// IDEX Register -> Instruction Execute
wire		IDEX_call_out,
		IDEX_ret_out, 
		IDEX_pop_out,
		IDEX_MemToReg_out,
		IDEX_MemSrc_out,
		IDEX_load_imm_out,
		IDEX_RegWrite_out,
		IDEX_MemWrite_out,
		IDEX_MemRead_out;
wire [4:0]	IDEX_DestReg_out;
wire [5:0] 	IDEX_opcode_out;
wire [25:0]	IDEX_J_type_imm_out;
wire [31:0] 	IDEX_ALU_input_1_out;
wire [31:0] 	IDEX_ALU_input_2_out;
wire [31:0]	IDEX_PC_out;

// Instruction Execute -> Memory Interface
wire		EXU_RegWrite_out;
wire		EXU_MemWrite_out;
wire		EXU_MemRead_out;
wire		EXU_MemToReg_out;
wire		EXU_MemSrc_out;
wire [5:0] 	EXU_DestReg_out;
wire [31:0] 	EXU_EX_out;	
wire [31:0] 	EXU_MemWrite_data;
wire 		N_flag, Z_flag, V_flag;

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
		.data_hazard(1'b0),
		.PC_hazard(1'b0),
		.PC_control(32'h00000000),
		.PC_src(1'b0),

// OUTPUTS
		.PC_next(IFU_PC_out),
		.instruction(IFU_instruction_out)
);

IFID_reg IFID
(

// INPUTS
		.clk(clk), 
		.data_hazard(1'b0),
		.PC_hazard(1'b0), 
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
		.pop(1'b0), 
		.reg_2_sel(CPU_cntrl_reg_2_sel),
		.sign_ext_sel(CPU_cntrl_sign_ext_sel),
		.alu_src(CPU_cntrl_alu_src),
		.RegWrite(1'b0), 
		.RegWrite_Reg(5'bzzzzz),
		.RegWrite_Data(32'hzzzzzzzz),
		.R_I_A_type_rd(IFID_R_I_A_type_rd),
		.R_I_type_rs(IFID_R_I_type_rs), 
		.R_type_rt(IFID_R_type_rt),
		.R_type_shamt(IFID_R_type_shamt), 			
		.I_type_imm(IFID_I_type_imm),
		.J_type_imm(IFID_J_type_imm),
		.A_type_imm(IFID_A_type_imm),
		.PC_in(IFID_PC_out),

// OUTPUTS
		.ALU_input_1(IDU_ALU_input_1),
		.ALU_input_2(IDU_ALU_input_2),
		.DestReg(IDU_DestReg),
		.J_type_imm_out(IDU_J_type_imm_out),
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

IDEX_reg IDEX
(

// INPUTS
		.clk(clk),

		// From CPU_control
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
		.J_type_imm_in(IDU_J_type_imm_out),
		.PC_in(IDU_PC_out),

// OUTPUTS
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
		.J_type_imm_out(IDEX_J_type_imm_out),
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
		.call(IDEX_call_out),
		.ret(IDEX_ret_out),
		.load_imm(IDEX_load_imm_out),
		.J_type_imm(IDEX_J_type_imm_out),
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
		
		.N(N_flag), .Z(Z_flag), .V(V_flag)
);


endmodule