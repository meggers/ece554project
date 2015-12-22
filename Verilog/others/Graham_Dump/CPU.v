`timescale 1ns / 1ps

//`include "IF_Unit.v"
//`include "IFID_reg.v"
//`include "ID_Unit.v"
//`include "Hazard_Detect.v"
//`include "CPU_control.v"
//`include "IDEX_reg.v"
//`include "EX_Unit.v"
//`include "EXMEM_reg.v"
//`include "MEM_Unit.v"
//`include "Memory_Interface.v"
//`include "MEMWB_reg.v"
//`include "WB_Unit.v"
//`include "Data_Forward.v"

////////////////////////////////////////////////////////////////////////////////
// Company:  Future Disciple of Jake Truelove and the Truelovin' Disciples
// Engineer: Graham Nygard - Truelovin' Disciple #1
// 
// Create Date:    14:39:49 11/13/2015 
// Design Name: 
// Module Name:    Tronsistor_CPU 
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
/////////////////////////////////////////////////////////////////////////////////

module CPU
(
	// INPUTS
	clk_100mhz, rst_in,
	keyboard_intr, keyboard_data,
	game_tick_intr, stack_overflow_intr,
	
	// OUTPUTS
	clk, rst, data_out, MemAddr, NON_ALU,
	S_type_index, S_type_value, PPU_en, opcode
);

input 		clk_100mhz;
input 		rst_in;				// Active low?
input 		keyboard_intr;
input 		game_tick_intr;
input 		stack_overflow_intr;
input [7:0]	keyboard_data;			// Character byte received from keyboard

output clk;
output rst;

output [31:0] data_out;
output [31:0] MemAddr;
output [11:0] NON_ALU;

output 			PPU_en;
output [5:0]	opcode;
output [9:0]  	S_type_index;
output [31:0] 	S_type_value;

assign clk = clk_100mhz;
assign rst = rst_in;

//INTERNAL CONNECTIONS///////////////////////////////////

/* 	
	For a description of each signal connection, please
	refer to the module in which the signal is an output.
*/

// Instruction Fetch -> IFID Register
wire [11:0]	IFU_PC_IM;
wire [15:0] IFU_PC_curr;
wire [31:0]	IFU_PC_plus_1;
wire [31:0]	IFU_instruction_out;
wire			IFU_instr_en;
wire			IFU_keep_flags;

// IFID Register -> Instruction Decode
wire [31:0] IFID_PC_out;
wire [31:0] IFID_instruction_out;
wire			IFID_pop_haz;

//wire			IFID_ld_idr;
//wire			IFID_ld_epc;
//wire [31:0]	IFID_EPC;
wire			IFID_keep_flags;
//wire [7:0]	IFID_keyboard_data_trap;

// CPU Control -> Instruction Decode, Hazard Detector
wire			CPU_cntrl_call;
wire			CPU_cntrl_ret;
wire			CPU_cntrl_branch;
wire			CPU_cntrl_jreg;
wire [1:0]	CPU_cntrl_branch_cond;
wire			CPU_cntrl_push;
wire			CPU_cntrl_pop;
wire			CPU_cntrl_reg_2_sel;
wire			CPU_cntrl_mem_to_reg;
wire			CPU_cntrl_mem_src;
wire			CPU_cntrl_load_imm;
wire			CPU_cntrl_sign_ext_sel;
wire [1:0] 	CPU_cntrl_alu_src;
wire			CPU_cntrl_RegWrite;
wire			CPU_cntrl_MemWrite;
wire			CPU_cntrl_OAMWrite;
wire			CPU_cntrl_MemRead;
wire			CPU_cntrl_Read_Reg_1_en;
wire			CPU_cntrl_Read_Reg_2_en;
wire [4:0] 	CPU_cntrl_opcode_out;

// Hazard_Detector -> Instruction Decode, IFID Register
wire 			data_hazard;
wire 			PC_hazard;
wire			pop_haz;

// PC Control -> Instruction Fetch, Hazard Detector
wire			clr_branch_hazard;
wire			clr_call_hazard;
wire			clr_ret_hazard;
wire 			clr_jreg_hazard;

wire [31:0] PC_cntrl_PC_update;
wire        PC_cntrl_PC_src;
reg 			PC_branch_ff;

// Flags Register -> PC Control
wire [2:0]	Flags_in;
wire [2:0]	Flags_reg_flags;
wire [2:0]	Flags_reg_flags_hold;

// Instruction Decode -> IDEX Register, Hazard Detector, OAM Control
wire [5:0]	IDU_opcode;
wire [4:0]	IDU_DestReg;
wire [4:0]	IDU_Read_Reg_1_out;
wire [4:0]	IDU_Read_Reg_2_out;
wire [25:0] IDU_J_type_imm;
wire [31:0]	IDU_PC_out;
wire [31:0] IDU_ALU_input_1;
wire [31:0] IDU_ALU_input_2;
wire [31:0]	IDU_MemWrite_data;
wire			IDU_Read_Reg_1_en;
wire			IDU_Read_Reg_2_en;
wire			IDU_intr_return;

wire [9:0] 	IDU_S_type_index;
wire [31:0] IDU_S_type_value;

// IDEX Register -> Instruction Execute
wire			IDEX_branch_out;
wire [1:0]	IDEX_branch_cond_out;
wire			IDEX_call_out;
wire			IDEX_ret_out;
wire			IDEX_jreg;
wire			IDEX_pop_haz;
wire			IDEX_MemToReg_out;
wire			IDEX_MemSrc_out;
wire			IDEX_load_imm_out;
wire			IDEX_RegWrite_out;
wire			IDEX_MemWrite_out;
wire			IDEX_MemRead_out;
wire			IDEX_Read_Reg_1_en;
wire			IDEX_Read_Reg_2_en;
wire [4:0]	IDEX_DestReg_out;
wire [4:0] 	IDEX_opcode_out;
wire [4:0]	IDEX_reg_read_addr1;
wire [4:0]	IDEX_reg_read_addr2;
wire [31:0] IDEX_ALU_input_1_out;
wire [31:0] IDEX_ALU_input_2_out;
wire [31:0]	IDEX_PC_out;
wire [31:0]	IDEX_MemWrite_data_out;

// Instruction Execute -> EXMEM Register
wire			EXU_RegWrite_out;
wire			EXU_MemWrite_out;
wire			EXU_MemRead_out;
wire			EXU_MemToReg_out;
wire			EXU_MemSrc_out;
wire			EXU_branch_out;
wire			EXU_ret_out;
wire			EXU_call_out;
wire [4:0] 	EXU_DestReg_out;
wire [31:0]	EXU_ALU_addr;
wire [31:0]	EXU_ALU_mux_in1;
wire [11:0]	EXU_NON_ALU_addr;
wire [31:0]	EXU_MemWrite_data_out;
wire 			N_flag, Z_flag, V_flag;
wire			EXU_ALU_done;

// EXMEM Register -> Memory Interface
wire			EXMEM_RegWrite_out;
wire			EXMEM_MemWrite_out;
wire			EXMEM_MemRead_out;
wire			EXMEM_MemToReg_out;
wire			EXMEM_ret_out;
wire			EXMEM_call_out;
wire			EXMEM_MemSrc_out;
wire [4:0] 	EXMEM_DestReg_out;
wire [31:0] EXMEM_ALU_addr_out;
wire [11:0]	EXMEM_NON_ALU_addr_out;
wire [31:0] EXMEM_MemWrite_data_out;

// Memory -> MEMWB Register
wire 			MEM_RegWrite_out;
wire 			MEM_MemToReg_out;
wire			MEM_ret_out;
wire [4:0]	MEM_DestReg_out;
wire [31:0] MEM_ALU_result_out;
wire [31:0] MEM_MemRead_data_out;

wire [11:0]	MEM_MemAddr;
wire			MEM_MemRead;
wire			MEM_MemWrite;
wire [31:0]	MEM_MemWrite_data;

// Memory Interface -> Memory, Instruction Fetch
wire [31:0] MemRead_data_frm_MemCtrl;
wire [31:0] instr_frm_MemCtrl;

// MEMWB Register -> Write Back
wire 			MEMWB_RegWrite_out;
wire 			MEMWB_MemToReg_out;
wire [4:0]	MEMWB_DestReg_out;
wire [31:0] MEMWB_ALU_result_out;
wire [31:0] MEMWB_MemRead_data_out;

// Write Back -> Intruction Decode (Reg File)
wire			WBU_RegWrite_out;
wire [4:0]	WBU_DestReg_out;
wire [31:0] WBU_RegWrite_data;

// Data forwarding -> Instruction Decode/Execute
wire 			ID_forward_src_in1;
wire 			ID_forward_src_in2;
wire [1:0]	EX_forward_src_in1;
wire [1:0]	EX_forward_src_in2;

// Trap Handler
wire [7:0] 	TH_keyboard_data_trap;
wire			TH_ld_idr;
wire			TH_ld_epc;
wire [15:0]	TH_EPC;	
wire			TH_keyboard_hazard;
wire			TH_branch_to_keyboard_ISR;
wire			TH_stack_overflow_hazard;
wire			TH_game_tick_hazard;
wire			TH_branch_to_stackoverflow_ISR;
wire			TH_branch_to_gametick_ISR;

//TEST ASSIGNMENT////////////////////////////////////////
assign data_out	= WBU_RegWrite_data;
assign MemAddr		= MEM_MemAddr;
assign NON_ALU		= EXMEM_NON_ALU_addr_out;

assign S_type_index	= IDU_S_type_index;
assign S_type_value	= IDU_S_type_value;
assign PPU_en			= CPU_cntrl_OAMWrite;
assign opcode			= IDU_opcode;

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
		.pop_haz(pop_haz),
		.PC_control(PC_cntrl_PC_update[15:0]),
		.PC_src(PC_cntrl_PC_src),
		.instruction_in(instr_frm_MemCtrl),
		.keyboard_hazard(TH_keyboard_hazard),
		.game_tick_hazard(TH_game_tick_hazard),
		.stack_overflow_hazard(TH_stack_overflow_hazard),
		.ld_idr(TH_ld_idr),
		.ld_epc(TH_ld_epc),
		.EPC(TH_EPC),
		.idr_data(TH_keyboard_data_trap),
		.branch_to_keyboard_ISR(TH_branch_to_keyboard_ISR),
		.branch_to_gametick_ISR(TH_branch_to_gametick_ISR),
		.branch_to_stackoverflow_ISR(TH_branch_to_stackoverflow_ISR),
		.jreg_noRead(CPU_cntrl_jreg),

// OUTPUTS
		.PC_curr(IFU_PC_curr),
		.PC_IM(IFU_PC_IM),
		.PC_plus_1(IFU_PC_plus_1),
		.instruction_out(IFU_instruction_out),
		.instr_en(IFU_instr_en),
		.keep_flags(IFU_keep_flags)

);

IFID_reg IFID
(

// INPUTS
		.clk(clk),
		.rst(rst),		
		.data_hazard(data_hazard),
		.PC_hazard(PC_hazard),
		.instruction_in(IFU_instruction_out),
		.PC_in(IFU_PC_plus_1),
		.pop_haz(pop_haz),
		.keep_flags_in(IFU_keep_flags),

// OUTPUTS
		.instruction_out(IFID_instruction_out),
		.PC_out(IFID_PC_out),
		.pop_haz_out(IFID_pop_haz),
		.keep_flags_out(IFID_keep_flags)
);

ID_Unit IDU
(

// INPUTS
		.clk(clk), .rst(rst),
		.data_hazard(data_hazard),
		.call(CPU_cntrl_call),
		.ret(CPU_cntrl_ret),
		.branch(CPU_cntrl_branch),
		.jreg(CPU_cntrl_jreg),
		.push(CPU_cntrl_push),
		.pop(CPU_cntrl_pop), 
		.reg_2_sel(CPU_cntrl_reg_2_sel),
		.sign_ext_sel(CPU_cntrl_sign_ext_sel),
		.alu_src(CPU_cntrl_alu_src),
		.RegWrite_in(WBU_RegWrite_out), 
		.RegWrite_Reg_in(WBU_DestReg_out),
		.RegWrite_Data_in(WBU_RegWrite_data),
		.Read_Reg_1_en(CPU_cntrl_Read_Reg_1_en),
		.Read_Reg_2_en(CPU_cntrl_Read_Reg_2_en),
		.ID_forward_src_in1(ID_forward_src_in1),
		.ID_forward_src_in2(ID_forward_src_in2),

		.instruction_in(IFID_instruction_out),
		.PC_in(IFID_PC_out),

// OUTPUTS
		.opcode(IDU_opcode),
		.J_type_imm_out(IDU_J_type_imm),
		.ALU_input1_mux_out(IDU_ALU_input_1),
		.ALU_input2_mux_out(IDU_ALU_input_2),
		.Read_Reg_1_out(IDU_Read_Reg_1_out),
		.Read_Reg_2_out(IDU_Read_Reg_2_out),
		.DestReg(IDU_DestReg),
		.PC_out(IDU_PC_out),
		.MemWrite_data(IDU_MemWrite_data),
		.Read_Reg_1_en_haz(IDU_Read_Reg_1_en),
		.Read_Reg_2_en_haz(IDU_Read_Reg_2_en),
		.intr_return(IDU_intr_return),
		
		.S_type_index(IDU_S_type_index),
		.S_type_value(IDU_S_type_value)

);

CPU_control CPU_cntrl
(

// INPUTS
		.rst(rst),
		.opcode_in(IDU_opcode),

// OUTPUTS
		.call(CPU_cntrl_call),
		.ret(CPU_cntrl_ret),
		.branch(CPU_cntrl_branch),
		.jreg(CPU_cntrl_jreg),
		.branch_cond(CPU_cntrl_branch_cond),
		.push(CPU_cntrl_push),
		.pop(CPU_cntrl_pop),
		.reg_2_sel(CPU_cntrl_reg_2_sel),
		.mem_to_reg(CPU_cntrl_mem_to_reg),
		.mem_src(CPU_cntrl_mem_src),
		.sign_ext_sel(CPU_cntrl_sign_ext_sel),
		.load_imm(CPU_cntrl_load_imm),
		.alu_src(CPU_cntrl_alu_src),
		.opcode_out(CPU_cntrl_opcode_out),
		.RegWrite(CPU_cntrl_RegWrite),
		.MemWrite(CPU_cntrl_MemWrite),
		.MemRead(CPU_cntrl_MemRead), 
		.OAMWrite(CPU_cntrl_OAMWrite),
		.Read_Reg_1_en(CPU_cntrl_Read_Reg_1_en),
		.Read_Reg_2_en(CPU_cntrl_Read_Reg_2_en)
);

/* This flip flop is used to delay the
	branch hazard clear for one clock cycle,
	which allows the hazard detector to 
	distinguish branch, call, and return
	hazards appropriately.	*/
always @(posedge clk) begin
	PC_branch_ff <= clr_branch_hazard;
end

Hazard_Detect Hazard_Detect
(

// INPUTS	
		.clk(clk),
		.rst(rst),
		.Read_Reg_1(IDU_Read_Reg_1_out),
		.Read_Reg_2(IDU_Read_Reg_2_out),
		.Read_Reg_1_en(CPU_cntrl_Read_Reg_1_en),
		.Read_Reg_2_en(CPU_cntrl_Read_Reg_2_en),
		.IDEX_reg_rd(IDEX_DestReg_out),
		.IDEX_RegWrite(IDEX_RegWrite_out),
		.EXMEM_RegWrite(EXMEM_RegWrite_out),
		.MEMWB_RegWrite(MEMWB_RegWrite_out),
		.call(CPU_cntrl_call),
		.ret(CPU_cntrl_ret),
		.branch(CPU_cntrl_branch),
		.PC_update(clr_branch_hazard|clr_call_hazard|clr_ret_hazard|clr_jreg_hazard),
		.PC_branch_ff(PC_branch_ff),
		.ID_MemToReg(IDEX_MemToReg_out),
		.pop(CPU_cntrl_pop),
		.PC_src(PC_cntrl_PC_src),
		.jreg(CPU_cntrl_jreg),
		.keyboard_hazard(TH_keyboard_hazard),		

// OUTPUTS	
		.data_hazard(data_hazard),
		.PC_hazard(PC_hazard),
		.pop_haz(pop_haz)
);

PC_control PC_cntrl
(

// INPUTS
		.clk(clk),
		.PC_in(IFID_PC_out[31:26]),
		.PC_stack_pointer(MEM_MemRead_data_out),
		.ALU_result(EXU_ALU_addr),
		.flags(Flags_reg_flags),
		.J_type_imm(IDU_J_type_imm),
		.branch(EXU_branch_out),
		.branch_cond(IDEX_branch_cond_out),
		.data_hazard(data_hazard),
		.call(CPU_cntrl_call),
		.ret(MEM_ret_out), 
		.jreg(IDEX_jreg),
		.reg_1_data(EXU_ALU_mux_in1),
	
// OUTPUTS

		.PC_update(PC_cntrl_PC_update),
		.PC_src(PC_cntrl_PC_src),
		.clr_branch_hazard_ff(clr_branch_hazard),
		.clr_call_hazard_ff(clr_call_hazard),
		.clr_ret_hazard_ff(clr_ret_hazard),
		.clr_jreg_hazard_ff(clr_jreg_hazard)
);

///////////////////////////////////////////////////////////////////////////

// Flags control for interrupt handling
assign Flags_in = (IDU_intr_return) ? Flags_reg_flags_hold : {Z_flag,V_flag,N_flag};

Flags_reg flags
(

// INPUTS
		.clk(clk),
		.en((EXU_ALU_done & !EXU_branch_out & !IFID_keep_flags) | intr_return),
		.d(Flags_in),
		.q(Flags_reg_flags)
);

//Flags register used to hold flags as they were before an interrupt
Flags_reg flags_hold
(

// INPUTS
		.clk(clk),
		.en(IFID_keep_flags),
		.d(Flags_reg_flags),
		.q(Flags_reg_flags_hold)
);

//////////////////////////////////////////////////////////////////////////

IDEX_reg IDEX
(

// INPUTS
		.clk(clk),
		.rst(rst),
		
		// From CPU_control
		.branch_in(CPU_cntrl_branch),
		.branch_cond_in(CPU_cntrl_branch_cond),
		.call_in(CPU_cntrl_call),
		.ret_in(CPU_cntrl_ret),
		.jreg_in(CPU_cntrl_jreg),
		.clr_ret_hazard(clr_ret_hazard),
		.MemToReg_in(CPU_cntrl_mem_to_reg),
		.MemSrc_in(CPU_cntrl_mem_src), 
		.load_imm_in(CPU_cntrl_load_imm),
		.RegWrite_in(CPU_cntrl_RegWrite),
		.MemWrite_in(CPU_cntrl_MemWrite),
		.MemRead_in(CPU_cntrl_MemRead),
		.opcode_in(CPU_cntrl_opcode_out),

		// From Hazard Detector
		.data_hazard(data_hazard),
		.PC_hazard(PC_hazard),
		
		// From ID_Unit
		.ALU_input_1_in(IDU_ALU_input_1),
		.ALU_input_2_in(IDU_ALU_input_2),
		.DestReg_in(IDU_DestReg),
		.PC_in(IDU_PC_out),
		.MemWrite_data_in(IDU_MemWrite_data),
		.reg_read_addr1_in(IDU_Read_Reg_1_out),	
		.reg_read_addr2_in(IDU_Read_Reg_2_out),
		.Read_Reg_1_en_in(IDU_Read_Reg_1_en),
		.Read_Reg_2_en_in(IDU_Read_Reg_2_en),
		.pop_haz_in(IFID_pop_haz),

// OUTPUTS
		.branch_out(IDEX_branch_out),
		.branch_cond_out(IDEX_branch_cond_out),
		.call_out(IDEX_call_out),
		.ret_out(IDEX_ret_out),
		.jreg_out(IDEX_jreg),
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
		.PC_out(IDEX_PC_out),
		.MemWrite_data_out(IDEX_MemWrite_data_out),
		.reg_read_addr1_out(IDEX_reg_read_addr1),	
		.reg_read_addr2_out(IDEX_reg_read_addr2),
		.Read_Reg_1_en_out(IDEX_Read_Reg_1_en),
		.Read_Reg_2_en_out(IDEX_Read_Reg_2_en),
		.pop_haz_out(IDEX_pop_haz)
	
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
		.MemWrite_data_in(IDEX_MemWrite_data_out),
		.branch_in(IDEX_branch_out),
		.call_in(IDEX_call_out),
		.ret_in(IDEX_ret_out),
		.load_imm(IDEX_load_imm_out),
		.PC_in(IDEX_PC_out),
		.EX_forward_src_in1(EX_forward_src_in1),
		.EX_forward_src_in2(EX_forward_src_in2),
		.MEM_ALUfrwd_data(EXMEM_ALU_addr_out),
		.WB_ALUfrwd_data(MEMWB_ALU_result_out),
		.MEM_Memfrwd_data(MEM_MemRead_data_out),
		.pop_haz_in(IDEX_pop_haz),
		.EXMEM_ALU_addr(EXMEM_ALU_addr_out),

// OUTPUTS
		.RegWrite_out(EXU_RegWrite_out),
		.MemWrite_out(EXU_MemWrite_out),
		.MemRead_out(EXU_MemRead_out),
		.MemToReg_out(EXU_MemToReg_out),
		.MemSrc_out(EXU_MemSrc_out),
		.call_out(EXU_call_out),
		.ret_out(EXU_ret_out),
		.DestReg_out(EXU_DestReg_out),
		.ALU_addr(EXU_ALU_addr),
		.NON_ALU_addr(EXU_NON_ALU_addr),
		.reg_1_data(EXU_ALU_mux_in1),
		.MemWrite_data_out(EXU_MemWrite_data_out),
		.branch_out(EXU_branch_out),
		.N_out(N_flag), .Z_out(Z_flag), .V_out(V_flag),
		.ALU_done(EXU_ALU_done)
);

EXMEM_reg EXMEM
(

// INPUTS
		.clk(clk),
		.rst(rst),
		.RegWrite_in(EXU_RegWrite_out),
		.MemWrite_in(EXU_MemWrite_out),
		.MemRead_in(EXU_MemRead_out), 
		.MemToReg_in(EXU_MemToReg_out),
		.MemSrc_in(EXU_MemSrc_out),
		.call_in(EXU_call_out),
		.ret_in(EXU_ret_out),
		.clr_ret_hazard(clr_ret_hazard),
		.DestReg_in(EXU_DestReg_out),
		.ALU_addr_in(EXU_ALU_addr),
		.NON_ALU_addr_in(EXU_NON_ALU_addr),
		.MemWrite_data_in(EXU_MemWrite_data_out),

// OUTPUTS
		.RegWrite_out(EXMEM_RegWrite_out),
		.MemWrite_out(EXMEM_MemWrite_out),
		.MemRead_out(EXMEM_MemRead_out),
		.MemToReg_out(EXMEM_MemToReg_out),
		.MemSrc_out(EXMEM_MemSrc_out),
		.call_out(EXMEM_call_out),
		.ret_out(EXMEM_ret_out),
		.DestReg_out(EXMEM_DestReg_out),
		.ALU_addr_out(EXMEM_ALU_addr_out),
		.NON_ALU_addr_out(EXMEM_NON_ALU_addr_out),
		.MemWrite_data_out(EXMEM_MemWrite_data_out)
);

MEM_Unit MEMU
(

// INPUTS
		.RegWrite_in(EXMEM_RegWrite_out),
		.MemWrite(EXMEM_MemWrite_out),
		.MemRead(EXMEM_MemRead_out),
		.MemToReg_in(EXMEM_MemToReg_out),
		.MemSrc(EXMEM_MemSrc_out),
		.call_in(EXMEM_call_out),
		.ret_in(EXMEM_ret_out),
		.DestReg_in(EXMEM_DestReg_out),
		.ALU_addr(EXMEM_ALU_addr_out),
		.NON_ALU_addr(EXMEM_NON_ALU_addr_out),
		.MemWrite_data(EXMEM_MemWrite_data_out),
		.MemRead_data_frm_MemCtrl(MemRead_data_frm_MemCtrl),

// OUTPUTS
		.RegWrite_out(MEM_RegWrite_out),
		.MemToReg_out(MEM_MemToReg_out),
		.DestReg_out(MEM_DestReg_out),
		.ALU_result_out(MEM_ALU_result_out),
		.MemRead_data(MEM_MemRead_data_out),
		.ret_out(MEM_ret_out),

		.MemAddr_to_MemCtrl(MEM_MemAddr),
		.MemRead_to_MemCtrl(MEM_MemRead),
		.MemWrite_to_MemCtrl(MEM_MemWrite),
		.MemWrite_data_to_MemCtrl(MEM_MemWrite_data)

);

Memory_Interface Memory_Interface
(

// INPUTS
		.clk(clk), 
		
		.instr_addr(IFU_PC_IM),
		.rd_instr_en(IFU_instr_en), 
		.wr_instr_en(1'b0),
		.wrt_instr(32'hzzzzzzzz),

		.data_addr(MEM_MemAddr[11:0]),
		.rd_data_en(MEM_MemRead),
		.wr_data_en(MEM_MemWrite),
		.wrt_data(MEM_MemWrite_data),

// OUTPUTS
		.data(MemRead_data_frm_MemCtrl), 
		.instr(instr_frm_MemCtrl)

);

MEMWB_reg MEMWB
(

// INPUTS
		.clk(clk),
		.rst(rst),
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

Data_Forward DataForward
(
// INPUTS
		.reg_addr_MEM(EXMEM_DestReg_out),
		.reg_write_MEM(EXMEM_RegWrite_out),
		.reg_addr_WB(MEMWB_DestReg_out),
		.reg_write_WB(MEMWB_RegWrite_out),
		.reg_addr_ALUin1(IDEX_reg_read_addr1),
		.reg_addr_ALUin2(IDEX_reg_read_addr2),
		.MemtoReg_MEM(EXMEM_MemToReg_out),
		.MemtoReg_WB(MEMWB_MemToReg_out),
		.reg_read1_EX(IDEX_Read_Reg_1_en),
		.reg_read2_EX(IDEX_Read_Reg_2_en),
		.reg_read1_ID(IDU_Read_Reg_1_en),
		.reg_read2_ID(IDU_Read_Reg_2_en),
		.regfile_addr1(IDU_Read_Reg_1_out),
		.regfile_addr2(IDU_Read_Reg_2_out),


// OUTPUTS
		.EX_forward_src_in1(EX_forward_src_in1),
		.EX_forward_src_in2(EX_forward_src_in2),	
		.ID_forward_src_in1(ID_forward_src_in1),
		.ID_forward_src_in2(ID_forward_src_in2)
);

Trap_Handler TrapHandler
(

// INPUTS
	  	   .clk(clk),
		   .rst(rst),
		   .data_hazard(data_hazard),
		   .control_hazard(PC_hazard),
		   .pop_hazard(pop_haz),
		   .keyboard_intr(keyboard_intr),
		   .game_tick_intr(game_tick_intr),		//UPDATE
		   .stack_overflow_intr(stack_overflow_intr),		//UPDATE
		   .keyboard_data_in(keyboard_data),
		   .IF_PC(IFU_PC_curr),
		  
// OUTPUTS
		   .keyboard_hazard(TH_keyboard_hazard),
		   .game_tick_hazard(TH_game_tick_hazard),
		   .stack_overflow_hazard(TH_stack_overflow_hazard),
		   .keyboard_data_out(TH_keyboard_data_trap),
		   .ld_idr(TH_ld_idr),
		   .ld_epc(TH_ld_epc),
		   .branch_to_keyboard_ISR(TH_branch_to_keyboard_ISR),
		   .branch_to_stackoverflow_ISR(TH_branch_to_stackoverflow_ISR),
		   .branch_to_gametick_ISR(TH_branch_to_gametick_ISR),
		   .EPC(TH_EPC)
);

endmodule