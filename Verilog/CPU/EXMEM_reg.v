module EXMEM_reg(clk,
		rst,
		RegWrite_in,
		MemWrite_in,
		MemRead_in,
		mem_to_reg_in,
		dest_reg_in,
		EX_in,
		MemWrite_data_in,
		RegWrite_out,
		MemWrite_out,
		MemRead_out,
		mem_to_reg_out,
		dest_reg_out,
		mem_addr,
		MemWrite_data_out,
		mem_src_in,
		mem_src_out);

//////////////////////////INPUTS/////////////////////////////
input clk;
input rst;
input RegWrite_in,
	MemWrite_in,
	MemRead_in,
	mem_to_reg_in,
	mem_src_in;
input [4:0] dest_reg_in;
input [31:0] EX_in;
input [31:0] MemWrite_data_in;
/////////////////////////END INPUTS///////////////////////////


//////////////////////////OUTPUTS/////////////////////////////
output reg RegWrite_out,
	MemWrite_out,
	MemRead_out,
	mem_to_reg_out,
	mem_src_out;
output reg [4:0] dest_reg_out;
output reg [31:0] mem_addr;
output reg [31:0] MemWrite_data_out;
////////////////////////END OUTPUTS///////////////////////////


always@(posedge clk, posedge rst) begin
	if(rst) begin
		RegWrite_out <= 1'b0;
		MemWrite_out <= 1'b0;
		MemRead_out <= 1'b0;
		mem_to_reg_out <= 1'b0;
		mem_src_out <= 1'b0;
		dest_reg_out <= 5'h00;
		mem_addr <= 32'h0000_0000;
		MemWrite_data_out <= 32'h0000_0000;
	end
	else begin
		RegWrite_out <= RegWrite_in;
		MemWrite_out <= MemWrite_in;
		MemRead_out <= MemRead_in;
		mem_to_reg_out <= mem_to_reg_in;
		mem_src_out <= mem_src_in;
		dest_reg_out <= dest_reg_in;
		mem_addr <= EX_in;
		MemWrite_data_out <= MemWrite_data_in;
	end
end
endmodule;
