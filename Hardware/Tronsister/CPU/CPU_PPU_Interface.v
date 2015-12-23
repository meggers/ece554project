`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:23:16 11/19/2015 
// Design Name: 
// Module Name:    OAM_control 
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
module CPU_PPU_Interface
(
	clk,
	rst,

	//INPUTS
	enable,
	opcode,
	
	S_type_index,
	S_type_value,
	
	EX_forward_src_in1,
	EX_forward_src_in2,

	MEM_ALUfrwd_data,
	WB_ALUfrwd_data,
	MEM_Memfrwd_data,
	
	//OUTPUTS
	BGTTWrite,
	BGATWrite,
	BGWrite_addr,
	BGWrite_data,
	
	OAMWrite,
	OAMWrite_addr,
	OAMWrite_data
	
);

//INPUTS//////////////////////////////////////////////////
input clk;
input rst;
input 			enable;			// OAMWrite from CPU control

input [3:0] 	opcode;			// From Intstruction Decode
input [9:0]		S_type_index;	
input [31:0]	S_type_value;
input	[1:0]		EX_forward_src_in1;
input	[1:0]		EX_forward_src_in2;

input [31:0]	MEM_ALUfrwd_data;
input [31:0]	WB_ALUfrwd_data;
input [31:0]	MEM_Memfrwd_data;

//OUTPUTS/////////////////////////////////////////////////

output reg			BGTTWrite;
output reg			BGATWrite;
output reg [9:0]	BGWrite_addr;
output reg [7:0]	BGWrite_data;

output reg [3:0]	OAMWrite;
output reg [5:0]	OAMWrite_addr;
output reg [31:0]	OAMWrite_data;

//INTERNAL CONTROL////////////////////////////////////////

localparam SRM		= 4'h1;
localparam SSL		= 4'h2;
localparam SLD		= 4'h3;
localparam SFT		= 4'h4;
localparam SBT		= 4'h5;
localparam SFA		= 4'h6;
localparam SBA		= 4'h7;

reg 					enable_ff;
reg [3:0]			opcode_ff;
reg [9:0]			S_type_index_ff;
reg [31:0]			S_type_value_ff;

wire [9:0] 			S_type_index_mux;
wire [31:0] 		S_type_value_mux;


always@(posedge clk, posedge rst) begin
	if(rst) begin
		enable_ff 			<= 1'b0;
		opcode_ff 			<= 4'h0;
		S_type_index_ff	<= 10'h000;
		S_type_value_ff	<= 32'h0000_0000;
	end
	else begin
		enable_ff			<= enable;
		opcode_ff 			<= opcode;
		S_type_index_ff	<= S_type_index;
		S_type_value_ff	<= S_type_value;
	end
end

assign S_type_value_mux = 	(EX_forward_src_in1 == 2'b01) ? MEM_ALUfrwd_data:
									(EX_forward_src_in1 == 2'b10) ? WB_ALUfrwd_data:
									(EX_forward_src_in1 == 2'b11) ? MEM_Memfrwd_data:
																				S_type_value_ff;

//MUX: ALU_in2
assign S_type_index_mux = 	(EX_forward_src_in2 == 2'b01) ? MEM_ALUfrwd_data[9:0]:
									(EX_forward_src_in2 == 2'b10) ? WB_ALUfrwd_data[9:0]:
									(EX_forward_src_in2 == 2'b11) ? MEM_Memfrwd_data[9:0]:
																				S_type_index_ff;


always @(*) begin
	if (enable_ff) begin
	
		// Background address, data is defaulted
		BGWrite_addr = S_type_index_mux;
		BGWrite_data = S_type_value_mux[7:0];
		
		// OAM address is defaulted
		OAMWrite_addr = S_type_index_mux[5:0];
	
		case (opcode_ff)
		
			SRM : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b1111;
				OAMWrite_data = 32'hFFFFFFFF;
			
			end
			
			SSL : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b1001;
				OAMWrite_data = {S_type_value_mux[15:8], 8'd0, 8'd0, S_type_value_mux[7:0]};
			
			end
			
			SLD : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b1111;
				OAMWrite_data = S_type_value_mux;//{S_type_value_mux[7:0], S_type_value_mux[23:16], S_type_value_mux[15:8], S_type_value_mux[31:24]};
			
			end
		
			SFT : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b0010;
				OAMWrite_data = {8'd0, 0, S_type_value_mux[7:0], 8'd0};
			
			end
			
			SBT : begin
			
				BGTTWrite = 1'b1;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b0000;
				OAMWrite_data = 32'h00000000;
			
			end
			
			SFA : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b0100;
				OAMWrite_data = {8'd0, S_type_value_mux[7:0], 8'd0, 8'd0};
			
			end
			
			SBA : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b1;

				
				OAMWrite = 4'b0000;
				OAMWrite_data = 32'h00000000;
			
			end
			
			default : begin // Nothing?
			
//				BGTTWrite <= 1'b0;
//				BGATWrite <= 1'b0;
//				
//				OAMWrite <= 4'b0000;
//				OAMWrite_data <= 32'hFFFFFFFF;
				
				// DO NOTHING...
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;

				OAMWrite = 4'h0;
				OAMWrite_addr = 6'd0;
				OAMWrite_data = 32'd0;
				
			
			end
		
		endcase
	
	end
	else begin
			// DO NOTHING...
			BGWrite_addr = 10'd0;
			BGWrite_data = 10'd0;
			BGTTWrite = 1'b0;
			BGATWrite = 1'b0;

			OAMWrite = 4'h0;
			OAMWrite_addr = 6'd0;
			OAMWrite_data = 32'd0;
	end

end

endmodule
