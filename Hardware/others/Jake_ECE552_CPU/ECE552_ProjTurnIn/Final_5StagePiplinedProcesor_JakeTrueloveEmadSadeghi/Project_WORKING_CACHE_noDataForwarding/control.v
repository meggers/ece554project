module control(IFID, rst, clk, 
               WE, 
               ALU_mux, 
               reg0_addr_cntrl, 
               reg1_addr_cntrl,
               RE_0, 
               RE_1, 
               N, Z, V,
               load_LH_sel, 
               dst_sel, 
               dst_addr_sel,
               WE_DM, 
               RE_DM, 
               addr_DM_mux, 
               rd_en_IM, 
               PC_mux, 
               No_Op_IFID, 
               p0_addr, 
               p1_addr,
               dst_addr_IDEX, 
               dst_addr_EXMEM, 
               dst_addr_MEMWB, 
               dst_addr_WB, 
               No_Op_IDEX, 
               Bad_Instr, 
               Bad_Instr_IDEX,
               b_true,
               PC_mux_RET,
               Bad_Instr_RET,
               Bad_Instr_RET_IDEX, 
               Bad_Instr_RET_EXMEM, 
               Bad_Instr_RET_IFID,
               call_ret_hold_bad,  
               no_op_icache,
               N_ff,
               Z_ff,
               V_ff,
               instr_go);//will add more, lots more outputs
   
   input [15:0] IFID;   //comes from instruction[15:12]
   input rst, clk;
   output reg WE;   //write enable, tells reg file to write register of given address
   output reg WE_DM; // write enable for data mem
   output reg RE_DM; // read enable for data mem 
   output reg [3:0] ALU_mux; //controls what operands are inputed into ALU
   output reg [2:0] reg0_addr_cntrl; //controls where the reg read input address comes from
   output reg [2:0] reg1_addr_cntrl;
   output reg RE_0, RE_1;  //reg read control signals
   input N, Z, V;  //condition flags, and enable flag to write flag registers
   output reg load_LH_sel; //selects lower or higher bits for LHB/LLB
   output reg [2:0] dst_sel, dst_addr_sel; //select bits for dst
   output reg [3:0] addr_DM_mux;
   output reg rd_en_IM;   //read enable for instruction memory
   output reg [1:0] PC_mux;       //control signal for PC mux
   
   input call_ret_hold_bad; 
   input instr_go;
    
   ////// BUBBLES ///////
   output reg No_Op_IFID; // flag bit indicating if the instruction needs to be held or not
   input No_Op_IDEX;
   reg RST; //not using need for rst condition?
   output reg Bad_Instr; 
   input Bad_Instr_IDEX;
   reg nxt_Bad_Instr;
  
   input [3:0] dst_addr_IDEX, dst_addr_EXMEM, dst_addr_MEMWB, dst_addr_WB;
   input [3:0] p0_addr, p1_addr; 
   reg Read_Reg_0_Haz; 
   reg Read_Reg_1_Haz;
   
   input no_op_icache;
   
   //For Branch
   output reg b_true; //if high should branch to PC + offset

   //For return to signify that the 3 following instructions are bad
   output reg Bad_Instr_RET;
   output reg PC_mux_RET;
   //Flip flopped version of Bad_Instr_RET 
   input Bad_Instr_RET_IDEX, Bad_Instr_RET_EXMEM, Bad_Instr_RET_IFID;
   
   reg [3:0] op;
   reg [2:0] cond;
   reg flag_en, flag_en_ff, nxt_flag_en_ff;
   
   output reg N_ff, Z_ff, V_ff;
   reg nxt_N, nxt_Z, nxt_V;
      
   localparam ADD = 4'b0000;
   localparam SUB = 4'b0001;
   localparam NAND = 4'b0010;
   localparam XOR = 4'b0011;
   localparam INC = 4'b0100;
   localparam SRA = 4'b0101;
   localparam SRL = 4'b0110;
   localparam SLL = 4'b0111;
   localparam LW = 4'b1000;
   localparam SW = 4'b1001;
   localparam LHB = 4'b1010;
   localparam LLB = 4'b1011;
   localparam B = 4'b1100;
   localparam CALL = 4'b1101;
   localparam RET = 4'b1110;
   localparam RESET = 4'b1111;
   
   //controls for mux operation of ALU
   localparam DO_NOTHING = 4'b0000;
   localparam ARITHM_RO_R1 = 4'b0001;
   localparam ARITHM_R0_IMM_S = 4'b0010;
   localparam ARITHM_R0_IMM = 4'b0011;
   localparam LW_OP = 4'b0100;
   localparam SW_OP = 4'b0101;
   localparam CALL_OP = 4'b0110;  
   localparam RET_OP = 4'b0111; 
   //typedef enum reg [1:0] {DO_NOTHING, ARITHM_RO_R1};
   
   //Mux control for Reg read addresses
   localparam ARITHM_1 = 3'b000;
   localparam LW_OP_REG = 3'b001; 
   localparam SW_OP_REG = 3'b010;
   localparam LLHB_op = 3'b011; 
   localparam CALL_op = 3'b100; 
   localparam RET_op = 3'b101; 
   localparam INC_op = 3'b110;  
   
   //Conditions for Branch instruction
   //used for branch instruction to identify which condition should be satisfied i.e. GT, LT etc
   localparam EQ = 3'b000;
   localparam LT = 3'b001;
   localparam GT = 3'b010;
   localparam OV = 3'b011;
   localparam NE = 3'b100;
   localparam GE = 3'b101;
   localparam LE = 3'b110;
   localparam TRUE = 3'b111;  
   
   
   assign op = IFID[15:12];
   
   assign cond = IFID[10:8];
/*always_ff @(posedge clk) begin
    if(~rst) 
       op <= NO_OP;
    else
       op <= nxt_op;
end
*/

//No_Op for call instruction to signify that next instruction coming after call should be a no op
always_ff @(posedge clk)begin
    if (rst)
       Bad_Instr <= 0;
    else if(No_Op_IFID && ~instr_go)   //****the addition of bad_instr could throw things off
       Bad_Instr <= Bad_Instr;
    else
       Bad_Instr <= nxt_Bad_Instr;
end

assign nxt_Bad_Instr = (((op === CALL) || (op === RET) ||
                           (Bad_Instr_RET_IDEX === 1'b1) || (Bad_Instr_RET_EXMEM === 1'b1) ||
                           (Bad_Instr_RET_IFID === 1'b1)) && ~(Bad_Instr === 1'bx)) ? 1:0; //if decoding call next instruction is No Op

/*flip flop to keep track of condition flags. 
Enable bit has to be high to update flag*/
always_ff @(posedge clk) begin
    if(rst) begin
       N_ff <= 0;      //not sure if we should initialize condition flags on rst
       Z_ff <= 0;
       V_ff <= 0;
       flag_en_ff <= 0;
    end
    else begin
       N_ff <= nxt_N;
       Z_ff <= nxt_Z;
       V_ff <= nxt_V; 
       flag_en_ff <= nxt_flag_en_ff;
    end
end

assign nxt_flag_en_ff = (No_Op_IDEX) ? flag_en_ff :
                                       flag_en;

assign nxt_N = (flag_en_ff && (~No_Op_IDEX || Bad_Instr_IDEX)) ? N:
                           N_ff;
assign nxt_Z = (flag_en_ff && (~No_Op_IDEX || Bad_Instr_IDEX)) ? Z:
                           Z_ff;
assign nxt_V = (flag_en_ff && (~No_Op_IDEX || Bad_Instr_IDEX)) ? V:
                           V_ff;
                           
                           
// Bubble Hazard Detection Logic 
/*always @(posedge clk) begin
    Read_Reg_0_Haz = (((p0_addr == dst_addr_IDEX) && ~(dst_addr_IDEX === 4'hx)) || ((p0_addr == dst_addr_EXMEM) && ~(dst_addr_EXMEM === 4'hx)) || ((p0_addr == dst_addr_MEMWB) && ~(dst_addr_MEMWB === 4'hx)))? 1:0;
    Read_Reg_1_Haz = (((p1_addr == dst_addr_IDEX) && ~(dst_addr_IDEX === 4'hx)) || ((p1_addr == dst_addr_EXMEM) && ~(dst_addr_EXMEM === 4'hx)) || ((p1_addr == dst_addr_MEMWB) && ~(dst_addr_MEMWB === 4'hx)))? 1:0;
    No_Op_IFID = ((Read_Reg_0_Haz || Read_Reg_1_Haz))? 1 : 0;
end*/
// EMAD COMMENT 
assign Read_Reg_0_Haz = (((p0_addr == dst_addr_IDEX) && ~(dst_addr_IDEX === 4'hx))  || 
                        ((p0_addr == dst_addr_EXMEM) && ~(dst_addr_EXMEM === 4'hx)) || 
                        ((p0_addr == dst_addr_MEMWB) && ~(dst_addr_MEMWB === 4'hx)) ||
                        ((p0_addr == dst_addr_WB)    && ~(dst_addr_WB === 4'hx)))? 1:
                                                                                   0;  

assign Read_Reg_1_Haz = (((p1_addr == dst_addr_IDEX) && ~(dst_addr_IDEX === 4'hx))  || 
                        ((p1_addr == dst_addr_EXMEM) && ~(dst_addr_EXMEM === 4'hx)) || 
                        ((p1_addr == dst_addr_MEMWB) && ~(dst_addr_MEMWB === 4'hx)) ||
                        ((p1_addr == dst_addr_WB)    && ~(dst_addr_WB === 4'hx)))? 1:
                                                                                   0;
//(flag_en_ff && (op == B)) is used to stall the pipeline
//for one cycle if a Branch instruction follows an instruction 
//that updates the flags, this is done to allow for the flag updateing
//to complete before the branch is evaluated 
////*****DOUBLE CHECK THAT THIS BUBLE IS NECESARRY************////////// 
assign No_Op_IFID = (((Read_Reg_0_Haz || Read_Reg_1_Haz) && ~Bad_Instr) || 
                                                (flag_en_ff && (op == B) || no_op_icache)) ? 1:0; 
                
                       
//always @(posedge clk)
//   No_Op_IFID = No_Op;
            
always_comb/* EMAD COMMENT@(op)*/  begin
    //add control signal defaults here
    WE = 0;
    ALU_mux = DO_NOTHING;
    reg0_addr_cntrl = ARITHM_1;
    reg1_addr_cntrl = ARITHM_1;
    RE_0 = 0;
    RE_1 = 0;
    flag_en = 0;
    
    load_LH_sel = 0;
    dst_sel = 0;
    dst_addr_sel = 0;
    addr_DM_mux = 0; 
    
    WE_DM = 0; 
    RE_DM = 0; 
    
    rd_en_IM = 1;
    PC_mux = 2'b01;
    b_true = 1'b0;
    
    Bad_Instr_RET = 1'b0;
    PC_mux_RET = 1'b0; 
    
    case(op) 
        ADD: begin 
              WE = 1;
              ALU_mux = ARITHM_RO_R1;
              RE_0 = 1;
              RE_1 = 1;
              flag_en = 1;  
        end
        
        SUB: begin 
              WE = 1;
              ALU_mux = ARITHM_RO_R1;
              RE_0 = 1;
              RE_1 = 1;
              flag_en = 1; 
        end 
        
        NAND: begin 
              WE = 1;
              ALU_mux = ARITHM_RO_R1;
              RE_0 = 1;
              RE_1 = 1;
              flag_en = 1;
        end

        XOR: begin 
              WE = 1;
              ALU_mux = ARITHM_RO_R1;
              RE_0 = 1;
              RE_1 = 1;
              flag_en = 1;
        end
        
        INC: begin 
              ALU_mux = ARITHM_R0_IMM_S;
              WE = 1;
              RE_1 = 1;
              reg1_addr_cntrl = INC_op; 
              flag_en = 1;
        end

        SRA: begin 
              ALU_mux = ARITHM_R0_IMM;
              WE = 1;
              RE_0 = 1;
        end
        
        SRL: begin 
              ALU_mux = ARITHM_R0_IMM;
              WE = 1;
              RE_0 = 1;
        end
        
        SLL: begin 
               ALU_mux = ARITHM_R0_IMM;
               WE = 1;
               RE_0 = 1;
        end

        
        LW: begin 
              WE = 1;
              ALU_mux = LW_OP ;
              reg0_addr_cntrl = LW_OP_REG; 
              RE_0 = 1;
              RE_DM = 1;
              dst_sel =  3'b010; 
              dst_addr_sel = 3'b010;
              addr_DM_mux = LW_OP;
        end
        
        SW: begin 
             ////////////////////
             ALU_mux = SW_OP;
             reg0_addr_cntrl = SW_OP_REG;
             reg1_addr_cntrl = SW_OP_REG;
             RE_0 = 1;
             RE_1 = 1;
             /*
             dst_sel = 2'b10;
             dst_addr_sel = 2'b00;
             */
             WE_DM = 1; 
             addr_DM_mux = SW_OP;
        
             ///////////////////
        end
        
        LHB: begin 
              load_LH_sel = 0;
              dst_sel = 3'b001;
              dst_addr_sel = 3'b001;
              WE = 1;
              RE_1 = 1;
              reg1_addr_cntrl = LLHB_op;
              
        end
        
        LLB: begin 
              load_LH_sel = 1;    //load into lower bit postions
              dst_sel = 3'b001;        
              dst_addr_sel = 3'b001;
              WE = 1;
              RE_1 = 1;
              reg1_addr_cntrl = LLHB_op;
              
        end
        
        B: begin          
             PC_mux = 2'b10;
             b_true = 1'b0;
             /*
             if(flag_en_ff)begin
                case(cond) 
                    EQ: if(nxt_Z == 1'b1)
                            b_true = 1'b1;
                    LT: if((nxt_N == 1'b1) && (nxt_V == 1'b0))
                            b_true = 1'b1;
                    GT: if((nxt_N == 1'b0) && (nxt_V == 1'b0) && (nxt_Z == 1'b0))
                            b_true = 1'b1;
                    OV: if(nxt_V == 1'b1)
                            b_true = 1'b1;
                    NE: if(nxt_Z == 1'b0)
                            b_true = 1'b1; 
                    GE: if((nxt_Z == 1'b1) || ((nxt_N == 1'b0) && (nxt_V == 1'b0)))
                            b_true = 1'b1;
                    LE: if((nxt_Z == 1'b1) || ((nxt_N == 1'b1) && (nxt_V == 1'b0)))
                            b_true = 1'b1;
                    TRUE:
                            b_true = 1'b1;
                endcase
              end
              else  begin*/
                 case(cond) 
                    EQ: if(Z_ff == 1'b1)
                            b_true = 1'b1;
                    LT: if((N_ff == 1'b1) && (V_ff == 1'b0))
                            b_true = 1'b1;
                    GT: if((N_ff == 1'b0) && (V_ff == 1'b0) && (Z_ff == 1'b0))
                            b_true = 1'b1;
                    OV: if(V_ff == 1'b1)
                            b_true = 1'b1;
                    NE: if(Z_ff == 1'b0)
                            b_true = 1'b1; 
                    GE: if((Z_ff == 1'b1) || ((N_ff == 1'b0) && (V_ff == 1'b0)))
                            b_true = 1'b1;
                    LE: if((Z_ff == 1'b1) || ((N_ff == 1'b1) && (V_ff == 1'b0)))
                            b_true = 1'b1;
                    TRUE:
                            b_true = 1'b1;
                endcase
              //end
        
        end
        
        CALL: begin 
    
              WE = 1; // decrement R15 (stack pointer)
              ALU_mux = CALL_OP ; // add pc with 1 to get PC'
              reg0_addr_cntrl = CALL_op; // call_op is for reg and call_OP is for ALU
              RE_0 = 1; // read R15 from port 0 of Regfile 
              //flag_en = 1; // for R15 := R15 -1 
              
              dst_sel = 3'b011;
              dst_addr_sel = 3'b011;
              addr_DM_mux = CALL_OP; 
    
              WE_DM = 1;
              PC_mux = 2'b00;  
        end
        
        RET: begin 
        
              WE = 1'b1; // increment R15 (stack pointer)
              reg0_addr_cntrl = RET_op;
              RE_0 = 1;
              dst_sel = 3'b100;
              dst_addr_sel = 3'b100;
              addr_DM_mux = RET_OP; 
              
              RE_DM = 1; 
              
              PC_mux_RET = 1'b1; 
              Bad_Instr_RET = 1'b1;
        end 
        
        RESET: begin 
            
        
        end
        
   endcase
  
              
end
endmodule