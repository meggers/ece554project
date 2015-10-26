module Control_Logic(opcode,
			call, ret, branch, SP_update, mem_to_reg, mem_src, 
			sign_ext_sel, alu_src, RegWrite, MemWrite, MemRead,
			OAMWrite);

//INPUTS////////////////////////////////////////////////////

input [5:0]  		opcode_in; 	// Opcode received from ID

//OUTPUTS///////////////////////////////////////////////////

output reg		call;
output reg		ret;
output reg		branch;
output reg		push_pop;

output reg		SP_update;	// Signal for updating the stack pointer

output reg		mem_to_reg;	// LW signal to Memory unit 
output reg		mem_src;	// Read_reg_2 proper SW select
output reg		sign_ext_sel;	// 0 - I-type imm, 1 - J-type imm
output reg [1:0] 	alu_src;	// ALU operand seleciton

output reg		RegWrite;	// Signal for writing back to register
output reg		MemWrite;	// Signal for writing to memory
output reg		OAMWrite;	// Signal for writing to the OAM
output reg		MemRead;	// Signal for reading from memory 

output reg [5:0] 	opcode_out;	// Opcode passed to the ALU       

  always @(*) begin
        
	// All ALU oriented instrucitons  
	if (opcode[5]) begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;

		SP_update 	= 1'b0;

		mem_to_reg	= 1'b0;
		mem_src		= 1'b0;
		sign_ext_sel 	= 1'b0;

		RegWrite	= 1'b1;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;

		opcode_out	= opcode_in;

		/* ADD, ADDI, AND, ANDI, and XOR (Needs Imm) 
		 *	If the LSB is set the ALU will
		 *	need to use the immediate field,
		 *	else it will use register rt.
		 */
		if (!opcode[1]) begin

			if (opcode[0]) begin
				alu_src	= 2'b01;
			end
			else begin
				alu_src = 2'b00;
			end

		end
		
		/* SUB, NAND, SRL, and SLL (Ignores Imm)
		 *	If opcode[2] is set the ALU will
		 *	need to use shamt, else it will
		 *	use register rt.
		 */
		else begin

			if (opcode[2]) begin
				alu_src = 2'b10;
			end
			else begin
				alu_src = 2'b00;
			end

		end
		
	end

	// PC control instructions 
	else if (~(|opcode[5:3])) begin

		OAMWrite	= 1'b0;
		sign_ext_sel 	= 1'b1;

		/* BRANCH
		 *	If opcode[2] is not set the
		 *	ALU will need to add the PC
		 *	with the sign extended branch
		 *	address field.
		 */
		if (!opcode[2]) begin

			call		= 1'b0;
			ret		= 1'b0;
			branch		= 1'b1;
			mem_to_reg	= 1'b0;
			mem_src		= 1'b0;

			RegWrite	= 1'b0;
			MemWrite	= 1'b0;
			MemRead		= 1'b0;

			alu_src 	= 2'b01;

			// Set the output opcode to ADD
			opcode_out	= 6'b100000;

		end

		/* CALL, RETURN
		 *	If opcode[2] is set the
		 *	ALU will need to add or 
		 *	subtract one from the SP
		 */
		else begin

			branch		= 1'b0;
			RegWrite	= 1'b1;
		
			// CALL - Writing SP to memory
			if (!opcode[0]) begin

				call		= 1'b1;
				ret		= 1'b0;
				mem_to_reg	= 1'b0;
				mem_src		= 1'b0;

				MemWrite	= 1'b1;
				MemRead		= 1'b0;

				alu_src 	= 2'b00;

				// Set the output opcode to ADD
				opcode_out	= 6'b100000;

			end

			// RET - Reading SP from memory to register
			else begin

				call		= 1'b0;
				ret		= 1'b1;
				mem_to_reg	= 1'b1;
				mem_src		= 1'b1;

				MemWrite	= 1'b0;
				MemRead		= 1'b1;

				alu_src 	= 2'b00;

				// Set the output opcode to SUB
				opcode_out	= 6'b100010;

			end

		end

	end

	// Memory accessing instructions
	else if (~(|opcode[5:4])) begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;
		OAMWrite	= 1'b0;
		
		sign_ext_sel 	= 1'b0;

		// LW, POP
		if (!(opcode[2] | opcode[0])) begin

			mem_to_reg	= 1'b1;
			mem_src		= 1'b0;

			RegWrite	= 1'b1;
			MemWrite	= 1'b0;
			MemRead		= 1'b1;

			// POP
			if (opcode[1]) begin
				opcode_out	= 6'b100010;
				alu_src		= 2'b00;
			end

			// LW
			else begin
				opcode_out	= 6'b100000;
				alu_src		= 2'b01;
			end

		end

		// SW, PUSH
		else begin

			mem_to_reg	= 1'b0;
			mem_src		= 1'b1;

			RegWrite	= opcode[1];
			MemWrite	= 1'b1;
			MemRead		= 1'b0;
			
			// PUSH - Add to stack pointer
			if (opcode[2]) begin
				opcode_out	= 6'b100000;
			end

			// POP - Sub from stack pointer
			else begin
				opcode_out	= 6'b100010;
			end

		end

	end

	else if (&opcode[4:3]) begin

		// AUDIO

	end

	// Sprite instructions
	else begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;
		OAMWrite	= 1'b1;
		mem_to_reg	= 1'b0;
		RegWrite	= 1'b0;
		MemWrite	= 1'b0;
		sign_ext_sel 	= 1'b0;
		
		mem_src		= 1'b0;
		MemRead		= 1'b0;
		alu_src 	= 2'b00;
		
/*
		// Is load sprite different from load word at all? Doesn't look like it...
		if (~(|opcode[3:0])) begin

			mem_src		= 1'b1;

			MemRead		= 1'b1;

			alu_src 	= 2'b11;	// <-- Spr_start + {24'h000, Spr_num, 2'b00}

		end
		else begin

			mem_src		= 1'b0;

			MemRead		= 1'b0;

			alu_src 	= 2'b00;	// <-- Spr_start + {24'h000, Spr_num, 2'b00}


		end
*/
	end
      
  end

endmodule