onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider TB
add wave -noupdate -format Literal -radix hexadecimal /Full_processor_tb/FP1/dpath/instr
add wave -noupdate -format Logic /Full_processor_tb/rst
add wave -noupdate -format Logic /Full_processor_tb/clk
add wave -noupdate -divider REG
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/p0
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/p1
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/dst
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/p0_addr
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/p1_addr
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/dst_addr
add wave -noupdate -format Logic /Full_processor_tb/FP1/regfile/WE
add wave -noupdate -format Logic /Full_processor_tb/FP1/regfile/clk
add wave -noupdate -format Logic /Full_processor_tb/FP1/regfile/re0
add wave -noupdate -format Logic /Full_processor_tb/FP1/regfile/re1
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/bus_out1
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/bus_out3
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/bus_out4
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/bus_out8
add wave -noupdate -format Literal /Full_processor_tb/FP1/regfile/bus_out14
add wave -noupdate -divider {DATA PATH}
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/nxt_PC
add wave -noupdate -format Logic /Full_processor_tb/FP1/dpath/PC_mux
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/PC
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/p0_addr
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/p1_addr
add wave -noupdate -format Logic /Full_processor_tb/FP1/dpath/WE
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/dst_addr
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/p0
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/dst
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/ALU_mux
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/ALU_out
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/ALU_in1
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/ALU_in2
add wave -noupdate -format Literal -radix hexadecimal /Full_processor_tb/FP1/dpath/if_id_ff
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/dst_sel
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/dst_addr_sel
add wave -noupdate -format Logic /Full_processor_tb/FP1/dpath/load_LH_sel
add wave -noupdate -format Logic /Full_processor_tb/FP1/dpath/WB_cntrl
add wave -noupdate -format Logic /Full_processor_tb/FP1/dpath/WE_DM
add wave -noupdate -format Logic /Full_processor_tb/FP1/dpath/RE_DM
add wave -noupdate -format Logic /Full_processor_tb/FP1/dpath/we_dm
add wave -noupdate -format Logic /Full_processor_tb/FP1/dpath/re_dm
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/addr_DM
add wave -noupdate -divider CONTROL
add wave -noupdate -format Logic /Full_processor_tb/FP1/cntrl/WE
add wave -noupdate -format Logic /Full_processor_tb/FP1/cntrl/WB
add wave -noupdate -format Logic /Full_processor_tb/FP1/cntrl/WE_DM
add wave -noupdate -format Logic /Full_processor_tb/FP1/cntrl/RE_DM
add wave -noupdate -format Literal /Full_processor_tb/FP1/cntrl/ALU_mux
add wave -noupdate -format Literal /Full_processor_tb/FP1/cntrl/reg0_addr_cntrl
add wave -noupdate -format Logic /Full_processor_tb/FP1/cntrl/RE_0
add wave -noupdate -format Literal /Full_processor_tb/FP1/cntrl/dst_sel
add wave -noupdate -format Literal /Full_processor_tb/FP1/cntrl/dst_addr_sel
add wave -noupdate -format Literal /Full_processor_tb/FP1/cntrl/addr_DM_mux
add wave -noupdate -format Literal /Full_processor_tb/FP1/cntrl/nxt_op
add wave -noupdate -format Literal /Full_processor_tb/FP1/cntrl/op
add wave -noupdate -divider {DATA MEM}
add wave -noupdate -format Logic /Full_processor_tb/FP1/data_mem/clk
add wave -noupdate -format Literal /Full_processor_tb/FP1/data_mem/addr
add wave -noupdate -format Logic /Full_processor_tb/FP1/data_mem/re
add wave -noupdate -format Logic /Full_processor_tb/FP1/data_mem/we
add wave -noupdate -format Literal /Full_processor_tb/FP1/data_mem/wrt_data
add wave -noupdate -format Literal /Full_processor_tb/FP1/data_mem/rd_data
add wave -noupdate -format Literal /Full_processor_tb/FP1/data_mem/addr
add wave -noupdate -format Literal /Full_processor_tb/FP1/data_mem/data_mem
add wave -noupdate -divider {INSTRUCTION MEM}
add wave -noupdate -format Logic /Full_processor_tb/FP1/instr_mem/clk
add wave -noupdate -format Literal /Full_processor_tb/FP1/instr_mem/addr
add wave -noupdate -format Logic /Full_processor_tb/FP1/instr_mem/rd_en
add wave -noupdate -format Literal /Full_processor_tb/FP1/instr_mem/instr
add wave -noupdate -format Literal /Full_processor_tb/FP1/dpath/r1_data_ff
add wave -noupdate -format Literal /Full_processor_tb/FP1/instr_mem/instr_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {25 ns} 0}
configure wave -namecolwidth 105
configure wave -valuecolwidth 110
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
WaveRestoreZoom {15 ns} {120 ns}
