onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/instr
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/p0_addr
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/p1_addr
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/WE
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_WE
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_addr
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/hlt
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/p0
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/p1
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/ALU_mux
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/ALU_out
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/ALU_in1
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/ALU_in2
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/op_ALU
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/reg0_addr_cntrl
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/reg1_addr_cntrl
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/load_LH_sel
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_sel
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_addr_sel
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/WE_cntrl
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/WE_DM
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/RE_DM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/PC_mux
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/addr_DM_mux
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/RE_0
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/RE_1
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/we_dm
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/re_dm
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_we_dm
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_re_dm
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/wd_dm
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr_CNTRL
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr_RET
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/PC_mux_RET
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/PC_mux_RET_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_PC_mux_RET_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/PC_mux_RET_EXMEM
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_PC_mux_RET_EXMEM
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/PC_mux_RET_MEMWB
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_PC_mux_RET_MEMWB
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr_RET_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr_RET_EXMEM
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr_RET_IFID
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_Bad_Instr_RET_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_Bad_Instr_RET_EXMEM
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/nxt_Bad_Instr_RET_IFID
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/b_true
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/LHLW_write
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/load_LH_sel_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/PC
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/nxt_PC
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/branch_pc
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/IFID
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/nxt_IFID
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/LW_SW_offset
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/rd_rt_addr_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/nxt_rd_rt_addr_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/rd_rt_addr_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/rd_rt_addr_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/rd_rt_addr_WB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/ALU_mux_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/RE_DM_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/WE_DM_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_sel_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_addr_sel_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/WE_cntrl_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/addr_DM_mux_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/PC_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/r0_data_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/r1_data_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/imm_arithm_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/LW_SW_offset_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/LHLW_write_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/addr_DM_mux_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_sel_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_addr_sel_EXMEM
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/WE_cntrl_EXMEM
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/PC_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/rd_DM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/ALU_out_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/r0_data_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/r1_data_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/LHLW_write_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_sel_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/dst_addr_sel_MEMWB
add wave -noupdate -format Logic /LwStall_tb/FP1/dpath/Bad_Instr_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/PC_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/r0_data_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/r1_data_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/rd_DM_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/ALU_out_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/addr_DM
add wave -noupdate -format Literal /LwStall_tb/FP1/dpath/LHLW_write_MEMWB
add wave -noupdate -divider Control
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/cntrl/IFID
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/rst
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/clk
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/WE
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/WE_DM
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/RE_DM
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/ALU_mux
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/reg0_addr_cntrl
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/reg1_addr_cntrl
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/RE_0
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/RE_1
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/N
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Z
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/V
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/load_LH_sel
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/dst_sel
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/dst_addr_sel
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/addr_DM_mux
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/rd_en_IM
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/PC_mux
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/No_Op_IFID
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/No_Op_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/RST
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Bad_Instr
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Bad_Instr_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/nxt_Bad_Instr
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/dst_addr_IDEX
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/dst_addr_EXMEM
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/dst_addr_MEMWB
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/dst_addr_WB
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/p0_addr
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/p1_addr
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Read_Reg_0_Haz
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Read_Reg_1_Haz
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/b_true
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Bad_Instr_RET
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/PC_mux_RET
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Bad_Instr_RET_IDEX
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Bad_Instr_RET_EXMEM
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Bad_Instr_RET_IFID
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/op
add wave -noupdate -format Literal /LwStall_tb/FP1/cntrl/cond
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/flag_en
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/flag_en_ff
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/nxt_flag_en_ff
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/N_ff
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/Z_ff
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/V_ff
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/nxt_N
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/nxt_Z
add wave -noupdate -format Logic /LwStall_tb/FP1/cntrl/nxt_V
add wave -noupdate -divider ALU
add wave -noupdate -format Literal /LwStall_tb/FP1/alu/ALU_in1
add wave -noupdate -format Literal /LwStall_tb/FP1/alu/ALU_in2
add wave -noupdate -format Literal /LwStall_tb/FP1/alu/op
add wave -noupdate -format Logic /LwStall_tb/FP1/alu/N
add wave -noupdate -format Logic /LwStall_tb/FP1/alu/Z
add wave -noupdate -format Logic /LwStall_tb/FP1/alu/V
add wave -noupdate -format Literal /LwStall_tb/FP1/alu/ALU_out
add wave -noupdate -format Logic /LwStall_tb/FP1/alu/V1
add wave -noupdate -format Logic /LwStall_tb/FP1/alu/V2
add wave -noupdate -format Literal /LwStall_tb/FP1/alu/ALU_out1
add wave -noupdate -divider DM
add wave -noupdate -format Logic /LwStall_tb/FP1/data_mem/clk
add wave -noupdate -format Literal /LwStall_tb/FP1/data_mem/addr
add wave -noupdate -format Logic /LwStall_tb/FP1/data_mem/re
add wave -noupdate -format Logic /LwStall_tb/FP1/data_mem/we
add wave -noupdate -format Literal /LwStall_tb/FP1/data_mem/wrt_data
add wave -noupdate -format Literal /LwStall_tb/FP1/data_mem/rd_data
add wave -noupdate -divider IM
add wave -noupdate -format Logic /LwStall_tb/FP1/instr_mem/clk
add wave -noupdate -format Literal /LwStall_tb/FP1/instr_mem/addr
add wave -noupdate -format Logic /LwStall_tb/FP1/instr_mem/rd_en
add wave -noupdate -format Literal /LwStall_tb/FP1/instr_mem/instr
add wave -noupdate -divider {REG FILE}
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/p0
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/p1
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/dst
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/p0_addr
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/p1_addr
add wave -noupdate -format Literal /LwStall_tb/FP1/regfile/dst_addr
add wave -noupdate -format Logic /LwStall_tb/FP1/regfile/WE
add wave -noupdate -format Logic /LwStall_tb/FP1/regfile/clk
add wave -noupdate -format Logic /LwStall_tb/FP1/regfile/re0
add wave -noupdate -format Logic /LwStall_tb/FP1/regfile/re1
add wave -noupdate -format Literal /LwStall_tb/FP1/regfile/rw
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out0
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out1
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out2
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out3
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out4
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out5
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out6
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out7
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out8
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out9
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out10
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out11
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out12
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out13
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out14
add wave -noupdate -format Literal -radix hexadecimal /LwStall_tb/FP1/regfile/bus_out15
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {313 ns} 0}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
update
WaveRestoreZoom {0 ns} {636 ns}
