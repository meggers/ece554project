module ALU(N, Z, V, ALU_in1, ALU_in2, ALU_out, op);
   input [15:0] ALU_in1, ALU_in2;
   input [3:0] op;
   output reg N, Z, V;
   output reg [15:0] ALU_out;
   
   reg V1, V2;
   reg [14:0] ALU_out1;
   
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
   localparam NO_OP = 4'b1111;
   
   
   always_comb begin
      N = 0;
      Z = 0;
      V = 0;
      ALU_out = 16'hxxxx;
      
      case(op)
         ADD: begin
            {V, ALU_out} = ALU_in1 + ALU_in2;
            if((ALU_out & 16'h8000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 16'h0000) == 0)
               Z = 1;
            else
               Z = 0;
         end
         
         //Need to check subtract, not sure if it is producing V correctlly
         SUB: begin
            {V1, ALU_out1} = (ALU_in1[14:0] - ALU_in2[14:0]);
            {V2, ALU_out} = (ALU_in1 - ALU_in2);  //FIXXXXX
            V = V1 ^ V2;
            if((ALU_out & 16'h8000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 16'h0000) == 0)
               Z = 1;
            else
               Z = 0;
         end
         
         NAND: begin
            V = 0;
            ALU_out = ~(ALU_in1 & ALU_in2);
            if((ALU_out & 16'h8000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 16'h0000) == 0)
               Z = 1;
            else
               Z = 0;
         end
               
         XOR: begin
            V = 0;
            ALU_out = (ALU_in1 ^ ALU_in2);
            if((ALU_out & 16'h8000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 16'h0000) == 0)
               Z = 1;
            else
               Z = 0;
         end     
         
         INC: begin
            {V, ALU_out} = (ALU_in1 + ALU_in2);
            if((ALU_out & 16'h8000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 16'h0000) == 0)
               Z = 1;
            else
               Z = 0;
         end
         
         //Shift Right Arithmetic, Leave flags unchanged
         SRA: begin
            ALU_out = (ALU_in1 >>> ALU_in2);
         end
         
         //Shift Right Logical, Leave flags unchanged
         SRL: begin
             ALU_out = (ALU_in1 >> ALU_in2);
         end
         
         //Shift Left Logical, Leave flags unchanged
         SLL: begin
             ALU_out = (ALU_in1 << ALU_in2);
         end
         
    
         LW: begin 
            ALU_out = (ALU_in1 + ALU_in2); 
            
         end 
         
         SW: begin 
         
            ALU_out = (ALU_in1 + ALU_in2); 

         end  
         
         /*CALL: begin 
                        
            {V1, ALU_out1} = (ALU_in1[14:0] - 1);
            {V2, ALU_out} = (ALU_in1 - 1);  //FIXXXXX
            V = V1 ^ V2;
            if((ALU_out & 16'h8000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 16'h0000) == 0)
               Z = 1;
            else
               Z = 0;
              
         end*/
         /*
         B: begin 
         end
         
         RET: begin 
         end 
         
         NO_OP: begin 
         end 
         
          */
         default: begin
         end
    
            
      endcase
  end
  
  endmodule