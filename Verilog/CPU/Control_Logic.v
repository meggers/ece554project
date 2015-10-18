module Control_Logic(instruction, /*opcode,*/
	data_reg, stack_reg, call, rtrn, branch, mem_to_reg, alu_op, alu_src, sign_ext_sel,
	reg_rt_src, RegWrite, MemWrite, MemRead, load_half, half_spec, HALT

	);

//INPUTS////////////////////////////////////////////////////

input  [5:0]  opcode; // Used for differentiating between NO_OP and HALT

//OUTPUTS///////////////////////////////////////////////////

output reg	jump;
output reg	branch;		// branching control; 0-2 sensitive, 3 pick 
output reg	mem_to_reg;	// LW signal to Memory unit 
output reg	[1:0] alu_src;	// ALU operand seleciton
output reg	sign_ext_sel;	// sign extend select bit
output reg	reg_rt_src;	// Read_reg_2 proper SW select
output reg	RegWrite;	// Signal for writing back to register
output reg	MemWrite;	// Signal for writing to memory
output reg	OAMWrite;	// Signal for writing to the OAM
output reg	MemRead;	// Signal for reading from memory

output reg	HALT;		// STOP THE CPU
              
/* LOCAL PARAMS */      
//ALU OPERATIONS 
localparam	ADD   = 6'b000000;
localparam	ADDI  = 6'b000001;
localparam	SUB   = 6'b000010;
localparam	NAND  = 6'b000011;
localparam	XOR   = 6'b001000;


localparam   NAND  =   6'b0010;
localparam   XOR   =   6'b0011;
localparam   INC   =   6'b0100;
localparam   SRA   =   6'b0101;
localparam   SRL   =   6'b0110;
localparam   SLL   =   6'b0111;

//SPECIAL
localparam   LW    =   4'b1000;
localparam   SW    =   4'b1001;
localparam   LHB   =   4'b1010;
localparam   LLB   =   4'b1011;
localparam   B     =   4'b1100;
localparam   CALL  =   4'b1101;
localparam   RET   =   4'b1110;
localparam   ERR   =   4'b1111;

  always_comb begin
      
	case(opcode)
           
	// ADD and ADDI   
	(~&opcode[5:1]) : begin	

		jump		= 1'b0;
		branch		= 1'b0;
		mem_to_reg	= 1'b0;
		sign_ext_sel	= 1'b1;
		reg_rt_src	= 1'b0;
		RegWrite	= 1'b1;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;

		if (opcode[0]) begin
			alu_src	= 2'b01;
		end
		else begin
			alu_src = 2'b00;
		end	

	end
           
	SUB : begin
		
		jump		= 1'b0;
		branch		= 1'b0;
		mem_to_reg	= 1'b0;
		sign_ext_sel	= 1'b0;
		reg_rt_src	= 1'b0;
		RegWrite	= 1'b1;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;
		alu_src 	= 2'b00;

	end

	NAND : begin
		
		jump		= 1'b0;
		branch		= 1'b0;
		mem_to_reg	= 1'b0;
		sign_ext_sel	= 1'b0;
		reg_rt_src	= 1'b0;
		RegWrite	= 1'b1;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;
		alu_src 	= 2'b00;

	end

	// AND and ANDI
	(~&opcode[5:3] & opcode[2] & ~opcode[1]) : begin	

		jump		= 1'b0;
		branch		= 1'b0;
		mem_to_reg	= 1'b0;
		sign_ext_sel	= opcode[0];
		reg_rt_src	= 1'b0;
		RegWrite	= 1'b1;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;

		if (opcode[0]) begin
			alu_src	= 2'b01;
		end
		else begin
			alu_src = 2'b00;
		end	

	end
  
	XOR : begin

		jump		= 1'b0;
		branch		= 1'b0;
		mem_to_reg	= 1'b0;
		sign_ext_sel	= 1'b0;
		reg_rt_src	= 1'b0;
		RegWrite	= 1'b1;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;
		alu_src 	= 2'b00;
		
	end
                             
	BEQ : begin

		jump		= 1'b0;
		branch		= 1'b1;
		mem_to_reg	= 1'b0;
		sign_ext_sel	= 1'b1;
		reg_rt_src	= 1'b0;
		RegWrite	= 1'b0;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;
		alu_src 	= 2'b01;

	end
           
	BNE : begin

		jump		= 1'b0;
		branch		= 1'b1;
		mem_to_reg	= 1'b0;
		sign_ext_sel	= 1'b1;
		reg_rt_src	= 1'b0;
		RegWrite	= 1'b0;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;
		alu_src 	= 2'b01;
	end
           
	BLT : begin

		jump		= 1'b0;
		branch		= 1'b1;
		mem_to_reg	= 1'b0;
		sign_ext_sel	= 1'b1;
		reg_rt_src	= 1'b0;
		RegWrite	= 1'b0;
		MemWrite	= 1'b0;
		OAMWrite	= 1'b0;
		MemRead		= 1'b0;
		alu_src 	= 2'b01;

	end
        
	// All forms of JUMP
	(~&opcode[5:4] & &opcode[3:2]) : begin

		 data_reg = 1'b0;
		 stack_reg = 1'b0;
		 call = 1'b0;
		 rtrn = 1'b0;
		 branch = 1'b0;
		 mem_to_reg = 1'b0;
		 alu_op = opcode[2:0];
		 alu_src = 1'b0;
		 sign_ext_sel = 1'b0;
		 reg_rt_src = 1'b0;
		 RegWrite = 1'b1;
		 MemWrite = 1'b0;
		 MemRead  = 1'b0;
		 load_half = 1'b0;
		 half_spec = 1'b0;
		 HALT = 1'b0;

	end

	

	   default : begin    //ERR is now defaulted
	    data_reg = 1'b0;
		 stack_reg = 1'b0;
		 call = 1'b0;
		 rtrn = 1'b0;
		 branch = 1'b0;
		 mem_to_reg = 1'b0;
		 alu_op = 3'bzzz;
		 alu_src = 1'bz;
		 sign_ext_sel = 1'bz;
		 reg_rt_src = 1'bz;
		 RegWrite = 1'b0;
		 MemWrite = 1'b0;
		 MemRead  = 1'b0;
		 load_half = 1'bz;
		 half_spec = 1'bz;
	    if (&instruction) HALT = 1'b1;
	    else HALT = 1'b0;
	   end

       endcase
      
  end

endmodule