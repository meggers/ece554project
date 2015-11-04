
module CPU_control
(
	// INPUTS
	opcode_in,

	// OUTPUTS
	call, ret, branch, push_pop, pop, reg_2_sel,
	mem_to_reg, mem_src, sign_ext_sel, load_imm,
	alu_src, RegWrite, MemWrite, MemRead, OAMWrite,
	opcode_out
);

//INPUTS////////////////////////////////////////////////////

input [5:0]  		opcode_in; 	// Opcode received from IFID

//OUTPUTS///////////////////////////////////////////////////

output reg		call;		// PC_control signal for calling
output reg		ret;		// PC_control signal for returning
output reg		branch;		// PC_control signal for branching
output reg		push_pop;	// Signal for Hazard Detector

output reg		pop;		// Data forwarding of SP-1

output reg		reg_2_sel;	// Signal for selecting second RegFile read
output reg		mem_to_reg;	// LW signal to Memory unit 
output reg		mem_src;	// 0 - MemAddr = ALU output,
					// 1 - MemAddr = MemWrite_data (ALU_input_2)

output reg		load_imm;	// Load the J-type immediate field
output reg		sign_ext_sel;	// 0 - SignExt_out = I-type imm,
					// 1 - SignExt_out = J-type imm

output reg [1:0] 	alu_src;	// ALU operand seleciton

output reg		RegWrite;	// Signal for writing back to register
output reg		MemWrite;	// Signal for writing to memory
output reg		OAMWrite;	// Signal for writing to the OAM
output reg		MemRead;	// Signal for reading from memory 

output reg [5:0] 	opcode_out;	// Opcode passed to the ALU       

always @(opcode_in) begin
        
	// All ALU oriented instrucitons  
	if (opcode_in[5]) begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;
		push_pop	= 1'b0;
		pop		= 1'b0;

		reg_2_sel	= 1'b1;
		mem_to_reg	= 1'b0;
		mem_src		= 1'b0;
		load_imm 	= 1'b0;
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
		if (!opcode_in[1]) begin

			if (opcode_in[0]) begin
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

			if (opcode_in[2]) begin
				alu_src = 2'b10;
			end
			else begin
				alu_src = 2'b00;
			end

		end
		
	end

	// PC control instructions 
	else if (~(|opcode_in[5:3])) begin

		OAMWrite	= 1'b0;
		load_imm 	= 1'b0;
		sign_ext_sel 	= 1'b1;
		push_pop	= 1'b0;
		pop		= 1'b0;

		reg_2_sel	= 1'b0;

		/* BRANCH
		 *	If opcode[2] is not set the
		 *	ALU will need to add the PC
		 *	with the sign extended branch
		 *	address field.
		 */
		if (!opcode_in[2]) begin

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
			push_pop	= 1'b0;
		
			// CALL - Writing SP to memory
			if (!opcode_in[0]) begin

				call		= 1'b1;
				ret		= 1'b0;
				mem_to_reg	= 1'b0;
				mem_src		= 1'b1;

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
				mem_src		= 1'b0;

				MemWrite	= 1'b0;
				MemRead		= 1'b1;

				alu_src 	= 2'b00;

				// Set the output opcode to SUB
				opcode_out	= 6'b100010;

			end

		end

	end

	// Memory accessing instructions
	else if (~(|opcode_in[5:4])) begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;
		OAMWrite	= 1'b0;
		
		sign_ext_sel 	= 1'b0;
		reg_2_sel	= 1'b0;

		/* LW, LI, POP
		 *	Read from memory and write
		 *	this data to a register. In
		 *	the case of POP, update SP.
		 *	If the instruction is LI, no
		 *	memory transactions are needed.
		 */
		if (!(opcode_in[2])) begin

			mem_to_reg	= !(opcode_in[0]);
			mem_src		= 1'b0;
			load_imm 	= opcode_in[0];

			RegWrite	= 1'b1;
			MemWrite	= 1'b0;
			MemRead		= !(opcode_in[0]);

			// POP
			if (opcode_in[1]) begin
				opcode_out	= 6'b100010;
				alu_src		= 2'b00;
				push_pop	= 1'b1;
				pop		= 1'b1;
			end

			// LW
			else begin
				opcode_out	= 6'b100000;
				alu_src		= 2'b01;
				push_pop	= 1'b0;
				pop		= 1'b0;
			end

		end

		/* SW, PUSH
		 *	Write data to memory. In
		 *	the case of PUSH, update SP.
		 */
		else begin

			mem_to_reg	= 1'b0;
			load_imm 	= 1'b0;
			pop		= 1'b0;

			RegWrite	= opcode_in[1];
			MemWrite	= 1'b1;
			MemRead		= 1'b0;
			
			// PUSH
			if (opcode_in[1]) begin
				opcode_out	= 6'b100000;
				alu_src		= 2'b00;
				push_pop	= 1'b1;
				mem_src		= 1'b1;
			end

			// SW
			else begin
				opcode_out	= 6'b100010;
				alu_src		= 2'b01;
				push_pop	= 1'b0;
				mem_src		= 1'b0;
			end

		end

	end

	else if (|opcode_in[4:3]) begin

		// AUDIO

	end

	// Sprite instructions and all else
	else begin

		call		= 1'b0;
		ret		= 1'b0;
		branch		= 1'b0;
		push_pop	= 1'b0;
		pop		= 1'b0;

		reg_2_sel	= 1'b0;
		mem_to_reg	= 1'b0;
		mem_src		= 1'b0;
		load_imm 	= 1'b0;
		sign_ext_sel 	= 1'b0;

		alu_src 	= 2'b11;

		RegWrite	= 1'b0;
		MemWrite	= 1'b0;
		OAMWrite	= opcode_in[4];
		MemRead		= 1'b0;

		opcode_out	= 6'b100000; 

	end
      
  end

endmodule