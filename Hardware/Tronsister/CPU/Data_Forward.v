`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:56:35 12/02/2015 
// Design Name: 
// Module Name:    Data_Forward 
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
module Data_Forward
(
	// INPUTS
	reg_addr_MEM,
	reg_write_MEM,
	reg_addr_WB,
	reg_write_WB,
	reg_addr_ALUin1,
	reg_addr_ALUin2,
	regfile_addr1,
	regfile_addr2,
	MemtoReg_MEM,
	MemtoReg_WB,
	reg_read1_ID,
	reg_read2_ID,
	reg_read1_EX,
	reg_read2_EX,
	
	// OUTPUTS
	ID_forward_src_in1,
	ID_forward_src_in2,
	EX_forward_src_in1,
	EX_forward_src_in2
);

//INPUTS////////////////////////////////////////
input [4:0] reg_addr_MEM;
input 		reg_write_MEM;
input [4:0] reg_addr_WB;
input 		reg_write_WB;
input 		MemtoReg_MEM, MemtoReg_WB;
input 		reg_read1_ID, reg_read2_ID;
input 		reg_read1_EX, reg_read2_EX;

//data needed from hazard stage
input [4:0] reg_addr_ALUin1;
input [4:0] reg_addr_ALUin2;

input [4:0] regfile_addr1;
input [4:0] regfile_addr2;

//OUTPUTS///////////////////////////////////////
output [1:0] EX_forward_src_in1; 
output [1:0] EX_forward_src_in2;

output  ID_forward_src_in1; 
output  ID_forward_src_in2; 
	
////////INTERNAL LOGIC//////////////////////////


/******** Data Forwarding to Execute Stage *********/

	wire en_ALUforward_frm_MEM;//enables forwarding of output of ALU from MEM stage
	wire en_ALUforward_frm_WB; //enables forwarding of output of ALU from WB stage
	wire en_Memforward_frm_WB; //enables forwarding of data read from mem

	//Only forward if data being forwarded is going to be writen and proper control signals asserted
	assign en_ALUforward_frm_MEM = (reg_write_MEM & ~MemtoReg_MEM);
	assign en_ALUforward_frm_WB = (reg_write_WB & ~MemtoReg_WB);
	assign en_Memforward_frm_WB = (reg_write_WB & MemtoReg_WB);

	//if there is a hazard in Execute and addr being written in MEM or EX matches forward appropriate source 
	assign EX_forward_src_in1 = 	((reg_addr_MEM == reg_addr_ALUin1) && reg_read1_EX && en_ALUforward_frm_MEM)? 2'b01:	//forward ALU data from MEM
											((reg_addr_WB == reg_addr_ALUin1) && reg_read1_EX && en_ALUforward_frm_WB) 	? 2'b10:	//forward ALU data from WB
											((reg_addr_WB == reg_addr_ALUin1) && reg_read1_EX && en_Memforward_frm_WB) 	? 2'b11:	//forward data from WB
				   						2'b00;	//take normal data from ID
	
	assign EX_forward_src_in2 = 	((reg_addr_MEM == reg_addr_ALUin2) && reg_read2_EX && en_ALUforward_frm_MEM)? 2'b01:	//forward data from MEM
											((reg_addr_WB == reg_addr_ALUin2) && reg_read2_EX && en_ALUforward_frm_WB) 	? 2'b10:
											((reg_addr_WB == reg_addr_ALUin2) && reg_read2_EX && en_Memforward_frm_WB) 	? 2'b11:	//forward data from WB
				   						2'b00;	//take normal data from ID

/******** Data Forwarding to Decode Stage *********/

	//control signals to control muxs in the decode stage that selects if the output of the register
	//read ports should be used or if forwarded data should be used for register data to input
	//to the IDEX reg
	assign ID_forward_src_in1 = ((reg_addr_WB == regfile_addr1) && reg_read1_ID && reg_write_WB);

	assign ID_forward_src_in2 = ((reg_addr_WB == regfile_addr2) && reg_read2_ID && reg_write_WB); 
				    

endmodule 
