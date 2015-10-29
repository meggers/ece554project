module MEM_Unit(clk, rst,
		RegWrite,
		MemRead,
		mem_to_reg,
		mem_src,
		dest_reg,
		mem_addr,
		MemWrite_data,
		RegWrite_out,
		mem_to_reg_out,
		dest_reg_out,
		mem_read_data,
		alu_result_out);

//////////////////////////INPUTS/////////////////////////////
input RegWrite,
	mem_to_reg,
	mem_src;
input [4:0] dest_reg;
input [31:0] mem_addr;
input [31:0] MemWrite_data;
input [31:0] mem_read_data_in;
input [31:0] rd_data_mem;
/////////////////////////END INPUTS///////////////////////////


//////////////////////////OUTPUTS/////////////////////////////
output RegWrite_out;
output mem_to_reg_out;
output dest_reg_out;
output reg [31:0] mem_read_data_out;
output reg alu_result_out;
output [31:0] data_mem_addr;

////////////////////////END OUTPUTS///////////////////////////

reg mem_addr_in
//////////////////////////////////////////////////////////////

//decide what address should be loaded into mem to read from
//when mem_src = 1, load none alu output as address
assign data_mem_addr = (mem_src) ? MemWrite_data :
				 mem_addr;
assign MemWrite_data 




endmodule
