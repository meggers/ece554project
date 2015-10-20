module Control_Logic(opcode);

//INPUTS////////////////////////////////////////////////////

input  [5:0]  opcode; // Used for differentiating between NO_OP and HALT

//OUTPUTS///////////////////////////////////////////////////

output reg	call;
output reg	ret;
output reg	branch;		// branching control; 0-2 sensitive, 3 pick 
output reg	mem_to_reg;	// LW signal to Memory unit 
output reg	[1:0] alu_src;	// ALU operand seleciton
output reg	sign_ext_sel;	// sign extend select bit
output reg	mem_src;	// Read_reg_2 proper SW select
output reg	RegWrite;	// Signal for writing back to register
output reg	MemWrite;	// Signal for writing to memory
output reg	OAMWrite;	// Signal for writing to the OAM
output reg	MemRead;	// Signal for reading from memory           

  always @(*) begin
        
	// All ALU oriented instrucitons  
	if (opcode[5]) begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;
		mem_to_reg	= 1'b0;
		mem_src		= 1'b0;

		RegWrite	= 1'b1;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;

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

	// Control instructions 
	else if (!&opcode[5:3]) begin

		OAMWrite	= 1'b0;

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

		end

		else begin

			branch		= 1'b0;
			RegWrite	= 1'b1;
		
			// CALL
			if (!opcode[0]) begin

				call		= 1'b1;
				ret		= 1'b0;
				mem_to_reg	= 1'b0;
				mem_src		= 1'b0;

				MemWrite	= 1'b1;
				MemRead		= 1'b0;

				alu_src 	= 2'b00;

			end
			// RET
			else begin

				call		= 1'b0;
				ret		= 1'b1;
				mem_to_reg	= 1'b1;
				mem_src		= 1'b1;

				MemWrite	= 1'b0;
				MemRead		= 1'b1;

				alu_src 	= 2'b00;

			end

		end

	end

	else if (!&opcode[5:4]) begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;
		OAMWrite	= 1'b0;
		alu_src 	= 2'b01;

		if (!opcode[2]) begin

			mem_to_reg	= 1'b1;
			mem_src		= 1'b0;

			RegWrite	= 1'b1;
			MemWrite	= 1'b0;
			MemRead		= 1'b1;

		end
		else begin

			mem_to_reg	= 1'b0;
			mem_src		= 1'b1;

			RegWrite	= 1'b0;
			MemWrite	= 1'b1;
			MemRead		= 1'b0;

		end

	end

	else begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;
		OAMWrite	= 1'b1;
		mem_to_reg	= 1'b0;
		RegWrite	= 1'b0;
		MemWrite	= 1'b0;
		

		// Is load sprite different from load word at all? Doesn't look like it...
		if (!&opcode[3:0]) begin

			mem_src		= 1'b1;

			MemRead		= 1'b1;

			alu_src 	= 2'b11;	// <-- Spr_start + {24'h000, Spr_num, 2'b00}

		end
		else begin

			mem_src		= 1'b0;

			MemRead		= 1'b0;

			alu_src 	= 2'b00;	// <-- Spr_start + {24'h000, Spr_num, 2'b00}


		end
	end
      
  end

endmodule