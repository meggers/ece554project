/*
Working on first 4 arithmetic instructions
*/

//need to implement memory map portion to get instructions
module datapath(clk, rst, 
                instr, 
                /*Reg file contol*/ 
                p0_addr,
                p1_addr,p0,
                p1,
                dst,
                dst_addr,
                WE,hlt, op_ALU,
                /*Reg file end*/
                
                /*TO/FROM control*/
                ALU_mux,
                reg0_addr_cntrl, reg1_addr_cntrl,
                load_LH_sel, dst_sel, dst_addr_sel,
                WE_cntrl,
                WE_DM, RE_DM, 
                we_dm, re_dm, //output to data mem
                PC_mux,
                RE_0,
                RE_1,
                IFID,
                Bad_Instr_CNTRL,
                Bad_Instr_IDEX,
                b_true,
                PC_mux_RET,
                Bad_Instr_RET,
                Bad_Instr_RET_IDEX, 
                Bad_Instr_RET_EXMEM, 
                Bad_Instr_RET_IFID,
                call_ret_hold_bad,  
                //dst_sel_WB,
                               
                /*TO/FROM ALU*/
                ALU_out, ALU_in1, ALU_in2,
     
                /*TO/FROM DATA MEMORY*/  
                addr_DM, addr_DM_mux, rd_DM,
                wd_dm,   
                
                /*TO/FROM INSTRUCTION MEMORY*/
                PC, 
                
                /* BUBBLE DETECTION*/
                No_Op_IFID, No_Op_IDEX, 
             
                rd_rt_addr_IDEX, rd_rt_addr_EXMEM, rd_rt_addr_MEMWB, rd_rt_addr_WB,
                    
                /* CONTROL FOR ICACHE */    
                //bad_instr_icache,
                pc_stop_icache_mem, we_icache); //add signals here
            
  
            
                
   /* BUBBLE DETECTION*/
   input No_Op_IFID; // flag bit indicating if the instruction needs to be held or not
   output reg No_Op_IDEX;
   reg No_Op_EXMEM;
   reg No_Op_MEMWB;
   /* BUBBLE DETECTION*/

   input clk, rst;
   input [15:0] instr;
   
   /*INSTRUCTION MEM*/
   
   
   /*Reg file input/outputs */
   output reg [3:0] p0_addr, p1_addr; //read ports
   output reg WE; //to reg file, piplined version of WE_cntrl
   reg nxt_WE;
   output reg [3:0] dst_addr;
   output reg hlt; //used to dump reg contents 
   input reg [15:0] p0, p1; //output of read
   output reg[15:0] dst;
      
   
   /*ALU*/
   input [3:0] ALU_mux;
   input [15:0] ALU_out;
   output reg [15:0] ALU_in1;
   output reg [15:0] ALU_in2;
   output reg [3:0] op_ALU;
   
   /*Control*/
   input [2:0] reg0_addr_cntrl;
   input [2:0] reg1_addr_cntrl;
   input load_LH_sel; //selects lower or higher bits for LHB/LLB
   input [2:0] dst_sel, dst_addr_sel; //select bits for dst
   input WE_cntrl; //from control to be passed through pipline for regfile
   input WE_DM, RE_DM;
   input [1:0] PC_mux; //input from control
   input [3:0] addr_DM_mux;   //address to read from data memory
   input RE_0, RE_1;
   output reg we_dm, re_dm; //output to data memory
   reg nxt_we_dm, nxt_re_dm;
   output reg [15:0] wd_dm;
   
   output reg call_ret_hold_bad; 
   
   input Bad_Instr_CNTRL;         //This identifies the instruction after a call instruction, should not be executed
   
   input Bad_Instr_RET;
   input PC_mux_RET;
   reg PC_mux_RET_IDEX, nxt_PC_mux_RET_IDEX;
   reg PC_mux_RET_EXMEM, nxt_PC_mux_RET_EXMEM;
   reg PC_mux_RET_MEMWB, nxt_PC_mux_RET_MEMWB;
   //Flip flopped version of Bad_Instr_RET 
   output reg Bad_Instr_RET_IDEX, Bad_Instr_RET_EXMEM, Bad_Instr_RET_IFID;
   reg nxt_Bad_Instr_RET_IDEX, nxt_Bad_Instr_RET_EXMEM, nxt_Bad_Instr_RET_IFID;
   
   //input dst_sel_WB;
   
   input b_true; //indicates if we should branch or not for branch instruction
    
   
   reg [15:0] LHLW_write; // data bus for LHW and LLW writes
   reg load_LH_sel_IDEX;
   
   input we_icache;
   
   /*PC control, and data*/
   output reg [15:0] PC;
   reg [15:0] nxt_PC, branch_pc;
   
    
   reg Bad_Instr; //used to identify when the information in the pipe is bad
   
   input pc_stop_icache_mem;
   
   /*flip flop pipe registers*/
   ///////////////////
   // stage 1 IF/ID //
   ///////////////////
   output reg [15:0] IFID; 
   reg [15:0] nxt_IFID;
   reg [15:0] IDEX;   
   
   
   /*Data Memory*/
   reg[15:0] LW_SW_offset; 
   //reg [15:0] PC_IFID; 
  

   // dst adrs pipelined for reg file
   output reg [3:0] rd_rt_addr_IDEX;
   reg [3:0] nxt_rd_rt_addr_IDEX;
   output reg [3:0] rd_rt_addr_EXMEM;
   output reg [3:0] rd_rt_addr_MEMWB;
   output reg [3:0] rd_rt_addr_WB;

   ///////////////////
   // stage 2 ID/EX //
   ///////////////////
      //control
      //reg WB_IDEX;
      reg [3:0] ALU_mux_IDEX;
      reg RE_DM_IDEX;
      reg WE_DM_IDEX;
      output reg Bad_Instr_IDEX;
      
   
      
      reg [2:0] dst_sel_IDEX;
      reg [2:0] dst_addr_sel_IDEX;
      reg WE_cntrl_IDEX;
      reg [3:0] addr_DM_mux_IDEX;
      
      //data
      reg [15:0] PC_IDEX; 
      reg [15:0] r0_data_IDEX, r1_data_IDEX;
      
      reg [3:0] imm_arithm_IDEX;
      reg[15:0] LW_SW_offset_IDEX; 
      reg [15:0] LHLW_write_IDEX;
   
   ////////////////////   
   // stage 3 EX/MEM //
   ////////////////////
      //control
      //reg WB_ff_s3;
      reg [3:0] addr_DM_mux_EXMEM;
      reg [2:0] dst_sel_EXMEM;
      reg [2:0] dst_addr_sel_EXMEM;
      reg WE_cntrl_EXMEM;
      reg Bad_Instr_EXMEM;
       
      
            
      //data
      reg [15:0] PC_EXMEM; 
      input [15:0] rd_DM; // read output content 
      reg [15:0] ALU_out_EXMEM; 
      reg [15:0] r0_data_EXMEM; 
      reg [15:0] r1_data_EXMEM;
      reg [15:0] LHLW_write_EXMEM;
    
   //////////////////// 
   // stage 4 MEM/WB //
   ////////////////////
      //control
      //reg WB_ff_s4;
      //reg [3:0] addr_DM_mux_MEMWB;
      reg [2:0] dst_sel_MEMWB;
      reg [2:0] dst_addr_sel_MEMWB;
      reg Bad_Instr_MEMWB;
      
      
      //data
      reg [15:0] PC_MEMWB;  
      reg [15:0] r0_data_MEMWB; 
      reg [15:0] r1_data_MEMWB; // NOT USED RIGHT NOW 
      
      reg [15:0] rd_DM_MEMWB; // read output content 
      reg [15:0] ALU_out_MEMWB;
      output reg [15:0] addr_DM;    
      reg [15:0] LHLW_write_MEMWB;
      
   //Regfile write address bitmasks
   localparam ARITHM_1 = 3'b000;
   localparam LW_OP_REG = 3'b001; 
   localparam SW_OP_REG = 3'b010; 
   localparam LLHB_op = 3'b011; 
   localparam CALL_op = 3'b100; 
   localparam RET_op = 3'b101;
   localparam INC_op = 3'b110; 
   
   //ALU_mux bitmasks
   localparam DO_NOTHING = 4'b0000;
   localparam ARITHM_RO_R1 = 4'b0001;
   localparam ARITHM_R0_IMM_S = 4'b0010;
   localparam ARITHM_R0_IMM = 4'b0011;
   localparam LW_OP = 4'b0100; 
   localparam SW_OP = 4'b0101; 
   localparam CALL_OP = 4'b0110;
   localparam RET_OP = 4'b0111; 
 

   
//This is the master Bad_instr, it identifies when something in the pipe is bad
assign Bad_Instr = (Bad_Instr_CNTRL|| Bad_Instr_RET_IFID || Bad_Instr_RET_IDEX || 
                              Bad_Instr_RET_EXMEM); 
                              
                              
   
   
////////   
// PC //
////////
always_ff@(posedge clk)      //*********Using negedge is this OK?
     PC <= nxt_PC;           //*********Since using negedge we change                
 
    
        
      
/*Flip flops for pipes*/
///////////
// IF/ID //
///////////
always_ff@(posedge clk) begin
   IFID <= nxt_IFID; //holds instruction
   Bad_Instr_RET_IFID <= nxt_Bad_Instr_RET_IFID;
end
     
assign nxt_IFID = (No_Op_IFID) ? IFID : instr;
assign nxt_Bad_Instr_RET_IFID = Bad_Instr_RET_EXMEM; 

      
/////////////////////
// ID/EX flip flop //
/////////////////////
//buble detection//
always_ff@(posedge clk) begin
       rd_rt_addr_IDEX <= nxt_rd_rt_addr_IDEX; 
       Bad_Instr_RET_IDEX <= nxt_Bad_Instr_RET_IDEX;
       PC_mux_RET_IDEX <= nxt_PC_mux_RET_IDEX;
end

assign nxt_rd_rt_addr_IDEX = (No_Op_IFID || Bad_Instr_CNTRL)    ? 4'hx      :
                             (reg0_addr_cntrl == CALL_op)       ? 4'hF      :
                                                            IFID[11:8];  //register to write to when operation is done
assign nxt_Bad_Instr_RET_IDEX = (No_Op_IFID) ? Bad_Instr_RET_IDEX : Bad_Instr_RET;
assign nxt_PC_mux_RET_IDEX = PC_mux_RET;

always_ff@(posedge clk) begin
  
       //control
       op_ALU <= IFID[15:12];
       ALU_mux_IDEX <= ALU_mux;
       WE_DM_IDEX <= WE_DM;
       RE_DM_IDEX <= RE_DM;
       addr_DM_mux_IDEX <= addr_DM_mux;
       dst_addr_sel_IDEX <= dst_addr_sel; 
       dst_sel_IDEX <= dst_sel;
       WE_cntrl_IDEX <= WE_cntrl;
       No_Op_IDEX <= No_Op_IFID;
       load_LH_sel_IDEX <= load_LH_sel;
       Bad_Instr_IDEX <= Bad_Instr;
       
       //data
       PC_IDEX <= PC;  
       LW_SW_offset_IDEX <= LW_SW_offset; 
       r0_data_IDEX <= p0;                   //output read from register
       r1_data_IDEX <= p1;
       IDEX <= IFID; 
       imm_arithm_IDEX <= IFID[3:0];
       //LHLW_write_IDEX <= LHLW_write;
end


//////////////////////
// EX/MEM flip flop //
////////////////////// 
always_ff@(posedge clk) begin
    we_dm <= nxt_we_dm;
    re_dm <= nxt_re_dm;
    Bad_Instr_RET_EXMEM <= nxt_Bad_Instr_RET_EXMEM;
    PC_mux_RET_EXMEM <= nxt_PC_mux_RET_EXMEM; 
    
end

assign nxt_we_dm = (No_Op_IDEX || Bad_Instr_IDEX) ? 0 : WE_DM_IDEX;
assign nxt_re_dm = (No_Op_IDEX || Bad_Instr_IDEX) ? 0 : RE_DM_IDEX;
assign nxt_Bad_Instr_RET_EXMEM = Bad_Instr_RET_IDEX; 
assign nxt_PC_mux_RET_EXMEM = PC_mux_RET_IDEX;
 
always_ff@(posedge clk)begin
   //control
   //WB_ff_s3 <= WB_ff_s2;   //flag bits
   addr_DM_mux_EXMEM <= addr_DM_mux_IDEX;
   dst_addr_sel_EXMEM <= dst_addr_sel_IDEX; 
   dst_sel_EXMEM <= dst_sel_IDEX;
   WE_cntrl_EXMEM <= WE_cntrl_IDEX;
   No_Op_EXMEM <= No_Op_IDEX;
   Bad_Instr_EXMEM <= Bad_Instr_IDEX;
      
   //data
   PC_EXMEM <= PC_IDEX;  
   r0_data_EXMEM <= r0_data_IDEX;
   r1_data_EXMEM <= r1_data_IDEX;
   ALU_out_EXMEM <= ALU_out;
   rd_rt_addr_EXMEM <= rd_rt_addr_IDEX;
   LHLW_write_EXMEM <= LHLW_write_IDEX;
end


 
////////////   
// MEM/WB //
////////////
always_ff@(posedge clk, rst) begin
      if(rst)
         WE <= 1'b1;
      else
         WE <= nxt_WE;
end
//CORRECT ????  Bad_Instr_EXMEM or Bad_Instr_IDEX
assign nxt_WE = ((No_Op_EXMEM === 1'b1) || (Bad_Instr_EXMEM === 1'b1)) ? 0 : WE_cntrl_EXMEM; 


always_ff@(posedge clk)begin
    //control
    //WB_ff_s4 <= WB_ff_s3;
    dst_addr_sel_MEMWB <= dst_addr_sel_EXMEM; 
    dst_sel_MEMWB <= dst_sel_EXMEM;
    Bad_Instr_MEMWB <= Bad_Instr_EXMEM;
    No_Op_MEMWB <= No_Op_EXMEM;  
      
    //data  
    PC_MEMWB <= PC_EXMEM; 
    rd_DM_MEMWB <= rd_DM; 
    ALU_out_MEMWB <= ALU_out_EXMEM;
    rd_rt_addr_MEMWB <= rd_rt_addr_EXMEM;
    LHLW_write_MEMWB <= LHLW_write_EXMEM;
    r0_data_MEMWB <= r0_data_EXMEM;
    r1_data_MEMWB <= r1_data_EXMEM;
    PC_mux_RET_MEMWB <=  /*PC_mux_RET_EXMEM;*/nxt_PC_mux_RET_MEMWB;
end

//load value on the rising ege of PC_mux_RET otherwise hold when pc_stop is high
//used to hold value of pc_mux_ret signal when a cache miss happens after a ret instruction so that we will
//still load the ret instr address into PC even after waiting 8 cycles to load the iCache
assign nxt_PC_mux_RET_MEMWB = (pc_stop_icache_mem && (PC_mux_RET_EXMEM & ~PC_mux_RET_MEMWB)) ? PC_mux_RET_EXMEM:
                              (pc_stop_icache_mem)                                           ? PC_mux_RET_MEMWB:
                                                                                               PC_mux_RET_EXMEM;       
                        
////////  
// WB //
////////
///////////////////////////////////////////////////////////////////////
// Write register to hold address that is currently being written to //
// in the reg file. This is used for hazzard prevention              //
///////////////////////////////////////////////////////////////////////
always_ff@(posedge clk) begin
   rd_rt_addr_WB <= rd_rt_addr_MEMWB;
end


//Reg File input address muxes
//will add more to these muxes when more instructions are implemented
//ADD FOR INCREMNT
assign p0_addr = (reg0_addr_cntrl == ARITHM_1) ? IFID[7:4]:
                 ((reg0_addr_cntrl == LW_OP_REG) || (reg0_addr_cntrl == SW_OP_REG)) ? 4'b1110 :
                 ((reg0_addr_cntrl == CALL_op) || (reg0_addr_cntrl == RET_op)) ? 4'b1111 :  
                                                            4'hx;
                                                 
assign p1_addr = (reg1_addr_cntrl == ARITHM_1) ? IFID[3:0]:
                 ((reg1_addr_cntrl == SW_OP_REG)||(reg1_addr_cntrl == LLHB_op)) ? IFID[11:8]: 
                 (reg1_addr_cntrl == INC_op) ? IFID[7:4]: 
                                                 4'hx;

//Muxs for ALU input
assign ALU_in1 = ((ALU_mux_IDEX == ARITHM_RO_R1) || 
                  (ALU_mux_IDEX == LW_OP) || 
                  (ALU_mux_IDEX == SW_OP) || 
                  (ALU_mux_IDEX == ARITHM_R0_IMM) 
                  /*(ALU_mux_IDEX == CALL_OP)*/) ? r0_data_IDEX:
                  (ALU_mux_IDEX == ARITHM_R0_IMM_S) ?  r1_data_IDEX:
                                             0;
assign ALU_in2 = (ALU_mux_IDEX == ARITHM_RO_R1) ? r1_data_IDEX:      //was r1_data_IDEX
                 ((ALU_mux_IDEX == LW_OP)||(ALU_mux_IDEX == SW_OP)) ? LW_SW_offset_IDEX: 
                 (ALU_mux_IDEX == ARITHM_R0_IMM_S) ? {{12{imm_arithm_IDEX[3]}}, imm_arithm_IDEX}:
                 (ALU_mux_IDEX == ARITHM_R0_IMM)? imm_arithm_IDEX:
                                               0;                                       
// SW and LW signals
assign LW_SW_offset = {{8{IFID[7]}}, IFID[7:0]}; 

// Emad: Call Jump address 
// assign Call_Jump_addr = {(PC+1)[15:12], IFID[11:0]}; 
// next PC address should be assigned to Call_Jump_addr 

   
//WORKING ON THIS
//Mux for destination address for register writes
//I believe every instruction that writes to reg file, the reg destination to write
//will be specified in 11:8 (rd_rt_addr)
assign dst_addr = ((dst_sel_MEMWB == 3'b011) || (dst_sel_MEMWB == 3'b100) || rst) ? 4'b1111 : rd_rt_addr_MEMWB;
 
                  
//Mux for data input of register writes
assign dst = ((dst_sel_MEMWB == 3'b000) & ~rst) ? ALU_out_MEMWB      :
             ((dst_sel_MEMWB == 3'b001) & ~rst) ? LHLW_write_MEMWB   :
             ((dst_sel_MEMWB == 3'b010) & ~rst) ? rd_DM_MEMWB        : 
             ((dst_sel_MEMWB == 3'b011) & ~rst) ? (r0_data_MEMWB - 1):
             ((dst_sel_MEMWB == 3'b100) & ~rst) ? (r0_data_MEMWB + 1): //ret
               rst                              ? 16'hFFFF           : //used to reset the stack pointer to the bottom of the stack on rst                         
                                        0;
             
//Mux for LHW/LLW data
assign LHLW_write_IDEX = (load_LH_sel_IDEX) ? {r1_data_IDEX[15:8], IDEX[7:0]}:
                                              {IDEX[7:0], r1_data_IDEX[7:0]};
                       
// Emad: changed p1 to r1_data_IDEX //


// Mux for LW/SW address of data mem
assign addr_DM = ((addr_DM_mux_EXMEM == LW_OP) || (addr_DM_mux_EXMEM == SW_OP)) ? ALU_out_EXMEM       :
                  (addr_DM_mux_EXMEM == CALL_OP)                                ? r0_data_EXMEM       :  
                  (addr_DM_mux_EXMEM == RET_OP)                                ? (r0_data_EXMEM + 1) :                
                                             0;      
//data to write to Data memory                                   
assign wd_dm = (addr_DM_mux_EXMEM == CALL_OP) ? (/*PC_EXMEM*/ PC_EXMEM): r1_data_EXMEM;
// before was 
//assign wd_dm = r1_data_EXMEM;

//Mux for PC
assign nxt_PC =  rst                                                                           ? 16'h0000:
                (PC_mux_RET_MEMWB === 1'b1) && (~pc_stop_icache_mem)                                                   ? rd_DM                                  :
                ((PC_mux == 2'b01)&&(No_Op_IFID === 0)&&
                      ((PC_mux_RET_MEMWB === 1'b0)||(PC_mux_RET_MEMWB === 1'bx))&& (~pc_stop_icache_mem))              ?  (PC + 1)                              :
                ((PC_mux == 2'b00)&&(No_Op_IFID === 0)&&
                      ((PC_mux_RET_MEMWB === 1'b0)||(PC_mux_RET_MEMWB === 1'bx))&& (~pc_stop_icache_mem))              ?  {PC[15:12], IFID[11:0]}               :
                ((PC_mux == 2'b10)&&(No_Op_IFID === 0)&&
                      ((PC_mux_RET_MEMWB === 1'b0)||(PC_mux_RET_MEMWB === 1'bx))&&(b_true)/*&& (~pc_stop_icache_mem)*/)    ?  ((PC - 1) + {{8{IFID[7]}}, IFID[7:0]}):      //for branch
                        //use we_icache above so that we can still facilitate delayed branching even when the delayed
                        //instr needs to be read into cache
                ((PC_mux == 2'b10)&&(No_Op_IFID === 0)&&
                      ((PC_mux_RET_MEMWB === 1'b0)||(PC_mux_RET_MEMWB === 1'bx))&&(~b_true)&& (~pc_stop_icache_mem))   ?  (PC + 1)                              :                      
                                                                                                                                     PC;           
//control signal for holding no_op signals when we have calls and ret at the same time as a cache miss
//if call, or ret in IDEX stage this signal goes high
assign call_ret_hold_bad = ((IDEX == 4'hD) || (IDEX == 4'hE)) ? 1'b1: 1'b0;
 
endmodule


