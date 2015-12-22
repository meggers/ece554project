`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:56:11 11/13/2015 
// Design Name: 
// Module Name:    ALU 
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
//////////////////////////////////////////////////////////////////////////////////

module ALU(N, Z, V, ALU_in1, ALU_in2, ALU_out, opcode, ALU_done);
   //ALU_in1 = $d 	ALU_in2 = shamt
   //ALU_in1 = rs	ALU_in2 = rt <---DIVIDE
   input [31:0] ALU_in1, ALU_in2; //input values to ALU
   input [4:0] opcode;
   output reg N, Z, V, ALU_done;
   output reg [31:0] ALU_out;
   
   //used for overflow detection
   //reg V1, V2;
   //reg [30:0] ALU_out1; 				// <-- Took these out
   //reg [15:0] ALU_in1_16b;
   //reg [15:0] ALU_in2_16b;
   
	localparam ADD		= 5'h00;
	localparam ADDI	= 5'h01;
	localparam SUB		= 5'h02;
	localparam NAND	= 5'h03;
	localparam AND		= 5'h04;
	localparam ANDI	= 5'h05;
	localparam SRL		= 5'h06; 
	localparam SLL		= 5'h07;
	//localparam MULT  = 6'h16;
	//localparam DIV   = 6'h15;
	localparam XOR		= 5'h08;
	localparam OR		= 5'h0A; 
	localparam NO_OP	= 5'h1F;

   //assign ALU_in1_16b = ALU_in1[15:0];
   //assign ALU_in2_16b = ALU_in2[15:0];
   
always@(*) begin

	//N = N;
	//Z = Z;
	//V = V;
	//ALU_done = 0;
	//ALU_out = 32'hzzzzzzzz;
      
	case(opcode)
	
		ADD: begin
//			{V1, ALU_out1} = ALU_in1[30:0] + ALU_in2[30:0];
//			{V2, ALU_out} = ALU_in1 + ALU_in2;
//			V = V1 ^ V2;
			{V, ALU_out} = ALU_in1 + ALU_in2;
			ALU_done = 1;
			
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
			ALU_done = 1;      
			
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
//			{V1, ALU_out1} = (ALU_in1[30:0] - ALU_in2[30:0]);
//			{V2, ALU_out} = (ALU_in1 - ALU_in2);  
//			V = V1 ^ V2;
			{V, ALU_out} = (ALU_in1 - ALU_in2);  
			ALU_done = 1;

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
			ALU_out = (ALU_in1 & ALU_in2);
			ALU_done = 1;
			V = 0;
			
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
			ALU_done = 1;
			
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
			ALU_done = 1;
			V = V;
			
			if((ALU_out & 32'h8000_0000) > 0)
				N = 1;
			else
				N = 0;
			
			if((ALU_out | 32'h0000_0000) == 0)
				Z = 1;
			else
				Z = 0;
		end

		//Shift Right Logical, Leave flags unchanged
		//ALU_in1 = $d 	ALU_in2 = shamt
		SRL: begin
			ALU_out = (ALU_in1 >> ALU_in2);
			ALU_done = 1;
			V = V;
			
			if((ALU_out & 32'h8000_0000) > 0)
				N = 1;
			else
				N = 0;
			
			if((ALU_out | 32'h0000_0000) == 0)
				Z = 1;
			else
				Z = 0;
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
			ALU_out = ~(ALU_in1 & ALU_in2);
			ALU_done = 1;
			V = 0;

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
			ALU_out = (ALU_in1 ^ ALU_in2);
			ALU_done = 1;
			V = 0;
			
			if((ALU_out & 32'h8000_0000) > 0)
				N = 1;
			else
				N = 0;
			
			if((ALU_out | 32'h0000_0000) == 0)
				Z = 1;
			else
				Z = 0;
		end   

		OR: begin
			ALU_out = (ALU_in1 | ALU_in2);
			ALU_done = 1;
			V = 0;
			
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
			N = 0;
			Z = 0;
			V = 0;
			ALU_done = 0;
			ALU_out = 32'hzzzzzzzz;
		end 
         
		default: begin
			N = 0;
			Z = 0;
			V = 0;
			ALU_done = 0;
			ALU_out = 32'hzzzzzzzz;
			//V1 = V1;
			//V2 = V2;
		end
    
	endcase
	
end
  
endmodule
