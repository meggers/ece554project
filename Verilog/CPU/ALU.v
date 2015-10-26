module ALU(N, Z, V, ALU_in1, ALU_in2, ALU_out, op);
   //ALU_in1 = $d 	ALU_in2 = shamt
   //ALU_in1 = rs	ALU_in2 = rt <---DIVIDE
   input [31:0] ALU_in1, ALU_in2; //input values to ALU
   input [5:0] op;
   output reg N, Z, V;
   output reg [31:0] ALU_out;
   
   //used for overflow detection
   reg V1, V2;
   reg [30:0] ALU_out1; 
   //reg [15:0] ALU_in1_16b;
  // reg [15:0] ALU_in2_16b;
   
	localparam ADD 	 = 6'h00;
	localparam ADDI  = 6'h01;
	localparam SUB 	 = 6'h02;
	localparam AND	 = 6'h03;
	localparam ANDI  = 6'h04; 
	localparam SLL	 = 6'h05;
	localparam SRL	 = 6'h06;
	//localparam MULT  = 6'h16;
	//localparam DIV   = 6'h15;
	localparam NAND  = 6'h22;
	localparam XOR   = 6'h23; 
	localparam NO_OP = 6'h3F;

   assign ALU_in1_16b = ALU_in1[15:0];
   assign ALU_in2_16b = ALU_in2[15:0];
   
   always@(*) begin
      N = N;
      Z = Z;
      V = V;
      ALU_out = 32'hxxxx_xxxx;
      
      case(op)
         ADD: begin
            {V1, ALU_out1} = ALU_in1[30:0] + ALU_in2[30:0];
	    {V2, ALU_out} = ALU_in1 + ALU_in2;
	    V = V1 ^ V2;
            if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
         end

	 //SAME AS ADD
	 ADDI: begin
	    {V, ALU_out} = ALU_in1 + ALU_in2;
            if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
	 end

	 //Need to check subtract, not sure if it is producing V correctlly
         SUB: begin
            {V1, ALU_out1} = (ALU_in1[30:0] - ALU_in2[30:0]);
            {V2, ALU_out} = (ALU_in1 - ALU_in2);  
            V = V1 ^ V2;
            if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
         end

	 AND: begin
	    V = 0;
	    ALU_out = (ALU_in1 & ALU_in2);
	    if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
	 end
	
	 //SAME AS AND
	 ANDI: begin
	    V = 0;
	    ALU_out = (ALU_in1 & ALU_in2);
	    if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
	 end

	 //Shift Left Logical, Leave flags unchanged
	 //ALU_in1 = $d 	ALU_in2 = shamt
         SLL: begin
             ALU_out = (ALU_in1 << ALU_in2);
         end

	 //Shift Right Logical, Leave flags unchanged
	 //ALU_in1 = $d 	ALU_in2 = shamt
         SRL: begin
             ALU_out = (ALU_in1 >> ALU_in2);
         end

////////////// May need to remove ////////////////////
// MULT valid range => 65535 to -65536 input range  //
//////////////////////////////////////////////////////
/*
	 MULT: begin
	    ALU_out = (ALU_in1_16b * ALU_in2_16b);
	    V1 = ALU_in1[15] ^ ALU_in2[15];
	    V2 = (ALU_in1[31:16] | ALU_in2[31:16]);	//if inputs are greater than 16bits, overflow
	    //V = ~(ALU_out[31] == V1);
	    if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
	    if((ALU_out[31] == V1) && !V2)
	       V = 0;
	    else
		V = 1;
	 end

	 DIV: begin
	    ALU_out1 = (ALU_in1/ALU_in2);
	    V1 = ALU_in1[31] ^ ALU_in2[31];
	    V = (ALU_out[31] != V1);
	    if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
	 end
         
///////////////////////////////////////////////////////
*/

	 NAND: begin
            V = 0;
            ALU_out = ~(ALU_in1 & ALU_in2);
            if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
         end
               
         XOR: begin
            V = 0;
            ALU_out = (ALU_in1 ^ ALU_in2);
            if((ALU_out & 32'h8000_0000) > 0)
               N = 1;
            else
               N = 0;
            if((ALU_out | 32'h0000_0000) == 0)
               Z = 1;
            else
               Z = 0;
         end     	
         
         NO_OP: begin 
         end 
         
         default: begin
         end
    
            
      endcase
  end
  
  endmodule