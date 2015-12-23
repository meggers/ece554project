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
	//INPUTS
	enable,
	opcode,
	
	S_type_index,
	S_type_value,
	
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

input 			enable;			// OAMWrite from CPU control

input [3:0] 	opcode;			// From Intstruction Decode
input [9:0]		S_type_index;
input [31:0]	S_type_value;

//OUTPUTS/////////////////////////////////////////////////

output reg			BGTTWrite;
output reg			BGATWrite;
output reg [9:0]	BGWrite_addr;
output reg [7:0]	BGWrite_data;

output reg [3:0]	OAMWrite;
output reg [4:0]	OAMWrite_addr;
output reg [31:0]	OAMWrite_data;

//INTERNAL CONTROL////////////////////////////////////////

localparam SRM		= 4'h1;
localparam SSL		= 4'h2;
localparam SLD		= 4'h3;
localparam SFT		= 4'h4;
localparam SBT		= 4'h5;
localparam SFA		= 4'h6;
localparam SBA		= 4'h7;

always @(*) begin

	if (enable) begin
	
		// Background address, data is defaulted
		BGWrite_addr = S_type_index;
		BGWrite_data = S_type_value[7:0];
		
		// OAM address is defaulted
		OAMWrite_addr = S_type_index[5:0];
	
		case (opcode)
		
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
				OAMWrite_data = S_type_value;
			
			end
			
			SLD : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b1111;
				OAMWrite_data = S_type_value;
			
			end
		
			SFT : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b0100;
				OAMWrite_data = S_type_value;
			
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
				
				OAMWrite = 4'b0010;
				OAMWrite_data = S_type_value;
			
			end
			
			SBA : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b1;
				
				OAMWrite = 4'b0000;
				OAMWrite_data = 32'h00000000;
			
			end
			
			default : begin
			
				BGTTWrite = 1'b0;
				BGATWrite = 1'b0;
				
				OAMWrite = 4'b0000;
				OAMWrite_data = 32'hFFFFFFFF;
			
			end
		
		endcase
	
	end
	
	else begin
	
		// DO NOTHING...
		BGTTWrite = 1'b0;
		BGATWrite = 1'b0;
		BGWrite_addr = 10'hzzz;
		BGWrite_data = 8'hzz;

		OAMWrite = 4'h0;
		OAMWrite_addr = 6'hzz;
		OAMWrite_data = 32'hzzzzzzzz;
	
	end

end

endmodule
