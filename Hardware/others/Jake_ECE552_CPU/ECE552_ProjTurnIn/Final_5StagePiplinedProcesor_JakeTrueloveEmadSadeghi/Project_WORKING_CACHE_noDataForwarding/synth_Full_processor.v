
module Full_processor ( instr, rst, clk, R0, R1, R2, R3, R4, R5, R6, R7, R8, 
        R9, R10, R11, R12, R13, R14, R15, PC, IFID, N_ff, V_ff, Z_ff );
  input [15:0] instr;
  output [15:0] R0;
  output [15:0] R1;
  output [15:0] R2;
  output [15:0] R3;
  output [15:0] R4;
  output [15:0] R5;
  output [15:0] R6;
  output [15:0] R7;
  output [15:0] R8;
  output [15:0] R9;
  output [15:0] R10;
  output [15:0] R11;
  output [15:0] R12;
  output [15:0] R13;
  output [15:0] R14;
  output [15:0] R15;
  output [15:0] PC;
  output [15:0] IFID;
  input rst, clk;
  output N_ff, V_ff, Z_ff;
  wire   WE_cntrl, re0, re1, N, V, Z, load_LH_sel, WE_DM, RE_DM, rd_en_IM,
         No_Op_IFID, No_Op_IDEX, Bad_Instr, Bad_Instr_IDEX, b_true, PC_mux_RET,
         Bad_Instr_RET, Bad_Instr_RET_IDEX, Bad_Instr_RET_EXMEM,
         Bad_Instr_RET_IFID, re_dm, we_dm, WE;
  wire   [3:0] ALU_mux;
  wire   [2:0] reg0_addr_cntrl;
  wire   [2:0] reg1_addr_cntrl;
  wire   [2:0] dst_sel;
  wire   [2:0] dst_addr_sel;
  wire   [3:0] addr_DM_mux;
  wire   [1:0] PC_mux;
  wire   [3:0] p0_addr;
  wire   [3:0] p1_addr;
  wire   [3:0] dst_addr_IDEX;
  wire   [3:0] dst_addr_EXMEM;
  wire   [3:0] dst_addr_MEMWB;
  wire   [3:0] dst_addr_WB;
  wire   [15:0] addr_DM;
  wire   [15:0] wd_dm;
  wire   [15:0] rd_data_DM;
  wire   [15:0] instr_IM;
  wire   [15:0] p0;
  wire   [15:0] p1;
  wire   [15:0] dst;
  wire   [3:0] dst_addr;
  wire   [15:0] ALU_out;
  wire   [15:0] ALU_in1;
  wire   [15:0] ALU_in2;
  wire   [3:0] op;

  control cntrl ( .IFID(IFID), .rst(rst), .clk(clk), .WE(WE_cntrl), .ALU_mux(
        ALU_mux), .reg0_addr_cntrl(reg0_addr_cntrl), .reg1_addr_cntrl(
        reg1_addr_cntrl), .RE_0(re0), .RE_1(re1), .N(N), .V(V), .Z(Z), .N_ff(
        N_ff), .V_ff(V_ff), .Z_ff(Z_ff), .load_LH_sel(load_LH_sel), .dst_sel(
        dst_sel), .dst_addr_sel(dst_addr_sel), .WE_DM(WE_DM), .RE_DM(RE_DM), 
        .addr_DM_mux(addr_DM_mux), .rd_en_IM(rd_en_IM), .PC_mux(PC_mux), 
        .p0_addr(p0_addr), .p1_addr(p1_addr), .dst_addr_IDEX(dst_addr_IDEX), 
        .dst_addr_EXMEM(dst_addr_EXMEM), .dst_addr_MEMWB(dst_addr_MEMWB), 
        .dst_addr_WB(dst_addr_WB), .No_Op_IFID(No_Op_IFID), .No_Op_IDEX(
        No_Op_IDEX), .Bad_Instr(Bad_Instr), .Bad_Instr_IDEX(Bad_Instr_IDEX), 
        .b_true(b_true), .PC_mux_RET(PC_mux_RET), .Bad_Instr_RET(Bad_Instr_RET), .Bad_Instr_RET_IDEX(Bad_Instr_RET_IDEX), .Bad_Instr_RET_EXMEM(
        Bad_Instr_RET_EXMEM), .Bad_Instr_RET_IFID(Bad_Instr_RET_IFID) );
  DM data_mem ( .clk(clk), .addr(addr_DM), .re(re_dm), .we(we_dm), .wrt_data(
        wd_dm), .rd_data(rd_data_DM) );
  IM instr_mem ( .clk(clk), .addr(PC), .rd_en(rd_en_IM), .instr(instr_IM) );
  datapath dpath ( .clk(clk), .IFID(IFID), .rst(rst), .p0_addr(p0_addr), 
        .p1_addr(p1_addr), .p0(p0), .p1(p1), .dst(dst), .dst_addr(dst_addr), 
        .WE(WE), .WE_cntrl(WE_cntrl), .ALU_mux(ALU_mux), .reg0_addr_cntrl(
        reg0_addr_cntrl), .reg1_addr_cntrl(reg1_addr_cntrl), .ALU_out(ALU_out), 
        .ALU_in1(ALU_in1), .ALU_in2(ALU_in2), .op_ALU(op), .load_LH_sel(
        load_LH_sel), .dst_sel(dst_sel), .dst_addr_sel(dst_addr_sel), .WE_DM(
        WE_DM), .RE_DM(RE_DM), .re_dm(re_dm), .we_dm(we_dm), .addr_DM(addr_DM), 
        .addr_DM_mux(addr_DM_mux), .rd_DM(rd_data_DM), .wd_dm(wd_dm), .instr(
        instr_IM), .PC(PC), .PC_mux(PC_mux), .rd_rt_addr_IDEX(dst_addr_IDEX), 
        .rd_rt_addr_EXMEM(dst_addr_EXMEM), .rd_rt_addr_MEMWB(dst_addr_MEMWB), 
        .rd_rt_addr_WB(dst_addr_WB), .No_Op_IFID(No_Op_IFID), .RE_0(re0), 
        .RE_1(re1), .No_Op_IDEX(No_Op_IDEX), .Bad_Instr_CNTRL(Bad_Instr), 
        .Bad_Instr_IDEX(Bad_Instr_IDEX), .b_true(b_true), .PC_mux_RET(
        PC_mux_RET), .Bad_Instr_RET(Bad_Instr_RET), .Bad_Instr_RET_IDEX(
        Bad_Instr_RET_IDEX), .Bad_Instr_RET_EXMEM(Bad_Instr_RET_EXMEM), 
        .Bad_Instr_RET_IFID(Bad_Instr_RET_IFID) );
  ALU alu ( .N(N), .Z(Z), .V(V), .ALU_in1(ALU_in1), .ALU_in2(ALU_in2), 
        .ALU_out(ALU_out), .op(op) );
  reg_file regfile ( .clk(clk), .p0_addr(p0_addr), .p1_addr(p1_addr), .p0(p0), 
        .p1(p1), .re0(re0), .re1(re1), .dst_addr(dst_addr), .dst(dst), .WE(WE), 
        .bus_out0(R0), .bus_out1(R1), .bus_out2(R2), .bus_out3(R3), .bus_out4(
        R4), .bus_out5(R5), .bus_out6(R6), .bus_out7(R7), .bus_out8(R8), 
        .bus_out9(R9), .bus_out10(R10), .bus_out11(R11), .bus_out12(R12), 
        .bus_out13(R13), .bus_out14(R14), .bus_out15(R15) );
endmodule

