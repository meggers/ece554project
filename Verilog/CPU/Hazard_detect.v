`define NO_WRITE 6'h00
`define $SP	 5'h1F

module Hazard_detect(clk, rst, opcode, RegWrite, ALU_logic, load, push_pop, call, ret, branch, and_add_imm, R_type_rd, R_I_type_rt_rd, R_I_type_rs, rd_addr1, rd_addr2, rd_en1, rd_en2, clr_ret_haz,
			clr_call_haz, clr_branch_haz, data_hazard, control_hazard);
//////////////////////////INPUTS/////////////////////////////
	input clk;
	input rst;

	//data hazard detect
	input [5:0] opcode;
	input RegWrite;
	input ALU_logic; //all arithmetic logical and shift operations
	input load;
	input push_pop;
	
	//control hazard detect
	input call;
	input ret;
	input branch;
	//input pop;
	input and_add_imm;

	//register address
	input [4:0] R_type_rd;
	input [4:0] R_I_type_rt_rd; 
	input [4:0] R_I_type_rs;

	//Register read information
	input [4:0] rd_addr1;
	input [4:0] rd_addr2;
	input rd_en1;
	input rd_en2;

	//clear signals for control hazards
	input clr_ret_haz;
	input clr_call_haz;
	input clr_branch_haz;
/////////////////////////END INPUTS///////////////////////////


//////////////////////////OUTPUTS///////////////////////////
	output data_hazard;
	output control_hazard;
/////////////////////////END OUTPUTS///////////////////////////

wire [5:0] reg_to_write;
reg [5:0] reg_to_write_IDEX;
reg [5:0] reg_to_write_EXMEM;
reg [5:0] reg_to_write_MEMWB;
reg [5:0] reg_to_write_REG;

wire IDEX_hazard;
wire EXMEM_hazard;
wire MEMWB_hazard;
wire REG_hazard;

reg call_hazard;
reg ret_hazard;
reg branch_hazard;



////////// DATA HAZARDS //////////////

//Finds the register that will be written with instruction that is in decode stage
//appends write enable signal to front inorder to preserve relevence
assign reg_to_write = (ALU_logic & and_add_imm)		? {RegWrite, R_I_type_rt_rd}		:
		      (ALU_logic & ~and_add_imm) 	? {RegWrite, R_type_rd}			:
		      (call | ret | push_pop)    	? {RegWrite, $SP}			:
		      (load)				? {RegWrite, R_I_type_rs}		:
						           `NO_WRITE;	  

//find hazards for current reads
assign IDEX_hazard	= ((rd_en1 & (reg_to_write_IDEX == {1'b1,rd_addr1}))  || (rd_en2 & (reg_to_write_IDEX  == {1'b1,rd_addr2})));
assign EXMEM_hazard 	= ((rd_en1 & (reg_to_write_EXMEM == {1'b1,rd_addr1})) || (rd_en2 & (reg_to_write_EXMEM == {1'b1,rd_addr2})));
assign MEMWB_hazard 	= ((rd_en1 & (reg_to_write_MEMWB == {1'b1,rd_addr1})) || (rd_en2 & (reg_to_write_MEMWB == {1'b1,rd_addr2})));
assign REG_hazard 	= ((rd_en1 & (reg_to_write_REG == {1'b1,rd_addr1}))   || (rd_en2 & (reg_to_write_REG   == {1'b1,rd_addr2})));

assign data_hazard = (IDEX_hazard | EXMEM_hazard | MEMWB_hazard | REG_hazard);


////////// CONTROL HAZARDS /////////////
assign control_hazard = (call_hazard | ret_hazard | branch_hazard);


/////// CONTROL HAZARD REGISTERS /////////

/********* CALL *********/
always@(posedge clk, posedge rst)begin
	if(rst) 
		call_hazard <= 1'b0;
	else if(clr_call_haz)
		call_hazard <= 1'b0;
	else if (call)
		call_hazard <= 1'b1;
	else 
		call_hazard <= call_hazard;
end

/********* RETURN *********/
always@(posedge clk, posedge rst)begin
	if(rst) 
		ret_hazard <= 1'b0;
	else if(clr_ret_haz)
		ret_hazard <= 1'b0;
	else if (ret)
		ret_hazard <= 1'b1;
	else 
		ret_hazard <= ret_hazard;
end

/********* BRANCH *********/
always@(posedge clk, posedge rst)begin
	if(rst) 
		branch_hazard <= 1'b0;
	else if(clr_branch_haz)
		branch_hazard <= 1'b0;
	else if (branch)
		branch_hazard <= 1'b1;
	else 
		branch_hazard <= branch_hazard;
end


/////// DATA HAZARD REGISTERS /////////

/********* IDEX *********/
always@(posedge clk, posedge rst)begin
	if(rst) begin 
		reg_to_write_IDEX <= `NO_WRITE;
	end
	else if(data_hazard) begin
		reg_to_write_IDEX <= `NO_WRITE;
	end
	else begin
		reg_to_write_IDEX <= reg_to_write;
	end
end


/********* EXMEM ********/
always@(posedge clk, posedge rst)begin
	if(rst) begin 
		reg_to_write_EXMEM <= `NO_WRITE;
	end
	else begin
		reg_to_write_EXMEM <= reg_to_write_IDEX;
	end
end


/********* MEMWB ********/
always@(posedge clk, posedge rst)begin
	if(rst) begin 
		reg_to_write_MEMWB <= `NO_WRITE;
	end
	else begin
		reg_to_write_MEMWB <= reg_to_write_EXMEM;
	end
end

/********* Writing to Register ********/
always@(posedge clk, posedge rst)begin
	if(rst) begin 
		reg_to_write_REG <= `NO_WRITE;
	end
	else begin
		reg_to_write_REG <= reg_to_write_MEMWB;
	end
end





endmodule;
