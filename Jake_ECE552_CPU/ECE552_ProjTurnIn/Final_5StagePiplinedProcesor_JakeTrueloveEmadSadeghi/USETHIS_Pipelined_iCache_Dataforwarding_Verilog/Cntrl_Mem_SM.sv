module Cntrl_Mem_SM(hit, 
                     we_icache, 
                     re_icache, 
                     pc_stop_icache_mem, 
                     rdy_mem, 
                     we_mem, 
                     re_mem, 
                     no_op_icache, 
                     addr_icache,
                     rst,
                     rd_data_mem,
                     wr_data_icache,
                     addr_mem,
                     clk,
                     rd_data_icache,
                     instr,
                     instr_go);
                     
input hit, rdy_mem, rst, clk;
input [15:0] addr_icache;   //from PC
input [31:0] rd_data_mem;
input [63:0] rd_data_icache;

output reg [15:0] instr;   //goes to pipeline to be processed
output reg we_icache, re_icache, pc_stop_icache_mem, we_mem, re_mem, no_op_icache;
output reg [14:0] addr_mem;
output reg [63:0] wr_data_icache;
output reg instr_go;

reg addr_inc, ignore_rdy, load_lower;

typedef enum reg [1:0] {IDLE, READMEM_HALF_BLOCK, READMEM_FULL_BLOCK, WRITE_ICACHE} state_t;
state_t state, n_state;

//when reading the second block(two words) from mem need to increment the addr into mem
assign addr_mem = addr_inc ? {addr_icache[15:2], 1'b1} : {addr_icache[15:2], 1'b0};


//concatenates the data to write into icache after the two memory accesses
/*assign wr_data_icache = we_icache ? {rd_data_mem, wr_data_icache[31:0]} : {32'hxxxxxxx, rd_data_mem};
*/
assign wr_data_icache[63:32] = we_icache ? rd_data_mem: wr_data_icache[63:32];


assign wr_data_icache[31:0] = load_lower ? rd_data_mem: wr_data_icache[31:0];


//mux for selecting which instruction to process of the block that 
//is outputed when accsessing the Icache
assign instr = (addr_icache[1:0] == 2'b00) ? rd_data_icache[15:0]  :
               (addr_icache[1:0] == 2'b01) ? rd_data_icache[31:16] :
               (addr_icache[1:0] == 2'b10) ? rd_data_icache[47:32] :
                                             rd_data_icache[63:48] ;

//state for state machine
always_ff @(posedge clk)
   if(rst)
      state <= IDLE;
   else
      state <= n_state;
      
always_comb begin
    we_icache = 1'b0;
    re_icache = 1'b0;
    pc_stop_icache_mem = 1'b1; //will be holding the PC for most of this state machine
    we_mem = 1'b0;
    re_mem = 1'b0;
    no_op_icache = 1'b0; //cntrl bit used to indcate that instructions flowing while
                             //reading from mem should be considered no_ops
    addr_inc = 1'b0;
    load_lower = 1'b0;
    instr_go = 1'b0;
    
    
    case(state)
        IDLE:begin
           re_icache = 1'b1;
           ignore_rdy = 1'b0;
           if(~hit)begin
              re_mem = 1'b1;
              n_state = READMEM_HALF_BLOCK;
              no_op_icache = 1'b1; 
              re_icache = 1'b0;
           end
           else begin
              pc_stop_icache_mem = 1'b0;
              n_state = IDLE;
           end
        end
           
        //should be in this state for 4 clock cycles while reading from mem
        READMEM_HALF_BLOCK: begin
           no_op_icache = 1'b1;
           if(rdy_mem) begin
               //mem has been read, need to write to icache
               //we_icache = 1'b1;
               addr_inc = 1'b1;
               re_mem = 1'b0;
               load_lower = 1'b1;
               ignore_rdy = 1'b1;
               n_state = READMEM_FULL_BLOCK;
           end
           else begin
               //if not done accessing mem wait for mem read to complete
               re_mem = 1'b1;
               n_state = READMEM_HALF_BLOCK;  
               ignore_rdy = 1'b0;
           end
        end     
        
        //should be in this state for another 4 clock cycles as the next two words are read
        READMEM_FULL_BLOCK: begin 
           addr_inc = 1'b1;
           no_op_icache = 1'b1;
           if(rdy_mem & ~ignore_rdy)begin
               re_mem = 1'b0;           //now have value don't need to read mem anymore   
               n_state = WRITE_ICACHE; 
               we_icache = 1'b1;
               ignore_rdy = 1'b0;
               instr_go = 1'b1;
           end
           else  begin 
               ignore_rdy = 1'b0;
               re_mem = 1'b1;
               n_state = READMEM_FULL_BLOCK;
               
           end
        end
        //only in this state for one cycle inorder to write to icache   
        WRITE_ICACHE: begin
            n_state = IDLE;
            pc_stop_icache_mem = 1'b0;   //release the PC to get next instr
            re_icache = 1'b1;
        end
                   
   endcase
   end
   endmodule
