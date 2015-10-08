/*This file combines all modules to create a complete processor
CONTAINS:
   1.) ALU
   2.) Datapath
   3.) Control
   4.) Register file
   5.) Data Memory 
   6.) Instruction Memory 
*/
module Full_processor(instr, rst, clk, R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15, PC, IFID, N_ff, V_ff, Z_ff);
   input [15:0] instr;
   input rst;
   input clk;
   wire [15:0] dst;
   
   wire re0, re1;
   wire [3:0] ALU_cntrl;
   wire [3:0] ALU_mux;
   wire [2:0] reg0_addr_cntrl, reg1_addr_cntrl;
   wire N, Z, V;
   output reg N_ff, V_ff, Z_ff; 
   
   
   wire[3:0] p0_addr, p1_addr;
   wire [15:0] p0, p1;
   wire [3:0] dst_addr;
   
   wire [15:0] dst1;
   wire WE;
   wire WE_cntrl;
   wire hlt;
   wire [15:0] ALU_out; 
   wire [15:0] ALU_in1, ALU_in2;
   wire [3:0] op;
   
   wire load_LH_sel; //selects lower or higher bits for LHB/LLB
   wire [2:0] dst_sel, dst_addr_sel;
   
   wire RE_DM; 
   wire WE_DM; 
   
   wire [3:0] dst_addr_IDEX;
   wire [3:0] dst_addr_EXMEM;
   wire [3:0] dst_addr_MEMWB;
   wire [3:0] dst_addr_WB; 
   wire No_Op_IFID;
   wire No_Op_IDEX;
   wire call_ret_hold_bad;
   
   /////////////
   // CONTROL //
   /////////////
   wire [3:0] addr_DM_mux;
   //wire dst_sel_WB;
   wire Bad_Instr;
   wire Bad_Instr_IDEX;
   wire [1:0] PC_mux;
   wire b_true;
   wire PC_mux_RET;
   wire Bad_Instr_RET;
   wire Bad_Instr_RET_IDEX;
   wire Bad_Instr_RET_EXMEM; 
   wire Bad_Instr_RET_IFID;
   
   //////////////
   // DATA MEM //
   //////////////
            
   wire [15:0] addr_DM;
   wire re_dm; //pipelined re/we signals for data memory
   wire we_dm;  
   wire [15:0] rd_data_DM; 
   wire [15:0] wd_dm;
   
   ///////////////
   // INSTR MEM //
   ///////////////
                       
   output reg [15:0] PC;
   wire rd_en_IM;
   output reg [15:0] IFID;
   wire [15:0] instr_IM;
   
   ///////////////
   // REGISTERS //
   ///////////////
   output [15:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15;
   
   
   ///////////////////////////////////
   // Control for icache and memory //
   ///////////////////////////////////
   wire hit, we_icache, re_icache, pc_stop_icache_mem,
         rdy_mem, we_mem, re_mem, no_op_icache;
         
   
   wire [31:0] rd_data_mem;
   wire [63:0] wr_data_icache, rd_data_icache;
   wire [14:0] addr_mem;
   
   wire instr_go;
   
   
   
   ///////////////////////
   // MODULE DECLRATION //
   ///////////////////////
       
   /*Module declarations*/   
       //will need to map to PC once memory is mapped correctly
   control cntrl(.IFID(IFID), 
                 .rst(rst), .clk(clk), 
                 .WE(WE_cntrl), 
                 .ALU_mux(ALU_mux),
                 .reg0_addr_cntrl(reg0_addr_cntrl),
                 .reg1_addr_cntrl(reg1_addr_cntrl),
                 .RE_0(re0), 
                 .RE_1(re1), 
                 .N(N),
                 .V(V),
                 .Z(Z),
                 .N_ff(N_ff),
                 .V_ff(V_ff),
                 .Z_ff(Z_ff),
                 .load_LH_sel(load_LH_sel),
                 .dst_sel(dst_sel),
                 .dst_addr_sel(dst_addr_sel), 
                 .WE_DM(WE_DM), 
                 .RE_DM(RE_DM),
                 .addr_DM_mux(addr_DM_mux),
                 .rd_en_IM(rd_en_IM), 
                 .PC_mux(PC_mux),
                 .p0_addr(p0_addr),
                 .p1_addr(p1_addr),
                 .dst_addr_IDEX(dst_addr_IDEX), 
                 .dst_addr_EXMEM(dst_addr_EXMEM), 
                 .dst_addr_MEMWB(dst_addr_MEMWB),
                 .dst_addr_WB(dst_addr_WB), 
                 .No_Op_IFID(No_Op_IFID),
                 .No_Op_IDEX(No_Op_IDEX),
                 .Bad_Instr(Bad_Instr),
                 .Bad_Instr_IDEX(Bad_Instr_IDEX),
                 .b_true(b_true),
                 .PC_mux_RET(PC_mux_RET),
                 .Bad_Instr_RET(Bad_Instr_RET),
                 .Bad_Instr_RET_IDEX(Bad_Instr_RET_IDEX), 
                 .Bad_Instr_RET_EXMEM(Bad_Instr_RET_EXMEM), 
                 .Bad_Instr_RET_IFID(Bad_Instr_RET_IFID),
                 .no_op_icache(no_op_icache),
                 .call_ret_hold_bad(call_ret_hold_bad),
                 .instr_go(instr_go));
   
                
   DM data_mem(.clk(clk), 
                     .addr(addr_DM), 
                     .re(re_dm), 
                     .we(we_dm), 
                     .wrt_data(wd_dm), 
                     .rd_data(rd_data_DM)); 
    /*                
   IM instr_mem(.clk(clk), 
                       .addr(PC), 
                       .rd_en(rd_en_IM),
                       .instr(instr_IM)); 
    */                   
                                   
   datapath dpath(.clk(clk),
                   .IFID(IFID),
                   .rst(rst),  
                   .p0_addr(p0_addr),
                   .p1_addr(p1_addr), 
                   .p0(p0),
                   .p1(p1),
                   .dst(dst),
                   .dst_addr(dst_addr), 
                   .WE(WE), 
                   .hlt(hlt),
                   .WE_cntrl(WE_cntrl),
                   .ALU_mux(ALU_mux),
                   .reg0_addr_cntrl(reg0_addr_cntrl), 
                   .reg1_addr_cntrl(reg1_addr_cntrl),
                   .ALU_out(ALU_out), 
                   .ALU_in1(ALU_in1), 
                   .ALU_in2(ALU_in2), 
                   .op_ALU(op),
                   .load_LH_sel(load_LH_sel),
                   .dst_sel(dst_sel),
                   .dst_addr_sel(dst_addr_sel),
                   .WE_DM(WE_DM), 
                   .RE_DM(RE_DM),
                   .re_dm(re_dm), 
                   .we_dm(we_dm),
                   .addr_DM(addr_DM),
                   .addr_DM_mux(addr_DM_mux),
                   .rd_DM(rd_data_DM),
                   .wd_dm(wd_dm),
                   .instr(instr_IM),
                   .PC(PC),
                   .PC_mux(PC_mux),
                   .rd_rt_addr_IDEX(dst_addr_IDEX), 
                   .rd_rt_addr_EXMEM(dst_addr_EXMEM), 
                   .rd_rt_addr_MEMWB(dst_addr_MEMWB),
                   .rd_rt_addr_WB(dst_addr_WB), 
                   .No_Op_IFID(No_Op_IFID),
                   .RE_0(re0), 
                   .RE_1(re1),
                   .No_Op_IDEX(No_Op_IDEX),
                   .Bad_Instr_CNTRL(Bad_Instr),
                   .Bad_Instr_IDEX(Bad_Instr_IDEX),
                   .b_true(b_true),
                   .PC_mux_RET(PC_mux_RET),
                   .Bad_Instr_RET(Bad_Instr_RET),
                   .Bad_Instr_RET_IDEX(Bad_Instr_RET_IDEX), 
                   .Bad_Instr_RET_EXMEM(Bad_Instr_RET_EXMEM), 
                   .Bad_Instr_RET_IFID(Bad_Instr_RET_IFID),
                   .pc_stop_icache_mem(pc_stop_icache_mem),
                   .we_icache(we_icache),
                   .call_ret_hold_bad(call_ret_hold_bad));
                   
   
   unified_mem UM(.clk(clk),
                  .rst_n(~rst),
                  .addr(addr_mem),
                  .re(re_mem),
                  .we(we_mem),
                  .wdata(),
                  .rd_data(rd_data_mem),
                  .rdy(rdy_mem));
                  
   cache icache(.clk(clk),
                .rst_n(~rst),
                .addr(PC[15:2]),
                .wr_data(wr_data_icache),
                .wdirty(1'b0),
                .we(we_icache),
                .re(re_icache),
                .rd_data(rd_data_icache),
                .tag_out(),
                .hit(hit),
                .dirty());
                
                
   //controls the flow if instructions into the pipeline as well as 
   //the transaction data between Icache and memory    
   Cntrl_Mem_SM cntrl_mem(.hit(hit),
                          .we_icache(we_icache),
                          .re_icache(re_icache),
                          .pc_stop_icache_mem(pc_stop_icache_mem),
                          .rdy_mem(rdy_mem),
                          .we_mem(we_mem),
                          .re_mem(re_mem),
                          .no_op_icache(no_op_icache), //WHERE DOES THIS GO????
                          .addr_icache(PC),
                          .rst(rst),
                          .rd_data_mem(rd_data_mem),
                          .wr_data_icache(wr_data_icache),
                          .addr_mem(addr_mem),
                          .clk(clk),
                          .rd_data_icache(rd_data_icache),
                          .instr(instr_IM),
                          .instr_go(instr_go));
                
                
   ALU alu(.N(N), 
            .Z(Z), 
            .V(V), 
            .ALU_in1(ALU_in1), 
            .ALU_in2(ALU_in2), 
            .ALU_out(ALU_out), 
            .op(op));
   
   reg_file regfile(.clk(clk),
               .p0_addr(p0_addr),
               .p1_addr(p1_addr),
               .p0(p0),
               .p1(p1),
               .re0(re0),
               .re1(re1),
               .dst_addr(dst_addr),
               .dst(dst),
               .WE(WE),
               .bus_out0(R0), .bus_out1(R1), .bus_out2(R2), .bus_out3(R3), .bus_out4(R4), 
               .bus_out5(R5), .bus_out6(R6), .bus_out7(R7), .bus_out8(R8), .bus_out9(R9),
               .bus_out10(R10), .bus_out11(R11), .bus_out12(R12), .bus_out13(R13), .bus_out14(R14),
               .bus_out15(R15));
   
   ////////THINGS THAT COULD POSSIBLLY BE IMPROVED///////
   // 1) may be an extra bubble in branch instruction. 
   //    There is a bubble after the call always.
   
   endmodule;
   
