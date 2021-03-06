`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:34 11/13/2015 
// Design Name: 
// Module Name:    RegFile_32bit 
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

module RegFile_32bit
(
	// INPUTS
	clk, rst, RegWrite, Read_Reg_1, Read_Reg_2, 
	Read_Reg_1_en, Read_Reg_2_en,
	Write_Reg, Write_Bus_in,

	// OUTPUTS
	Read_Bus_1, Read_Bus_2
);
                 
  input clk, rst;
  input RegWrite; // Writes data to a register when high 

  input Read_Reg_1_en;
  input Read_Reg_2_en; 
  
  /* Input address buses */
  input [4:0] Read_Reg_1;
  input [4:0] Read_Reg_2;
  input [4:0] Write_Reg;
  
  /* Input Write Data */
  input [31:0] Write_Bus_in;
 
  /* Output Read Data */	
  output reg [31:0] Read_Bus_1;
  output reg [31:0] Read_Bus_2;

  // Parameters for selecting the output    
  localparam   REG_0     =    5'b00000;
  localparam   REG_1     =    5'b00001;
  localparam   REG_2     =    5'b00010;
  localparam   REG_3     =    5'b00011;
  localparam   REG_4     =    5'b00100;
  localparam   REG_5     =    5'b00101;
  localparam   REG_6     =    5'b00110;
  localparam   REG_7     =    5'b00111;
  localparam   REG_8     =    5'b01000;
  localparam   REG_9     =    5'b01001;
  localparam   REG_10    =    5'b01010;
  localparam   REG_11    =    5'b01011;
  localparam   REG_12    =    5'b01100;
  localparam   REG_13    =    5'b01101;
  localparam   REG_14    =    5'b01110;
  localparam   REG_15    =    5'b01111;
  localparam   REG_16    =    5'b10000;
  localparam   REG_17    =    5'b10001;
  localparam   REG_18    =    5'b10010;
  localparam   REG_19    =    5'b10011;
  localparam   REG_20    =    5'b10100;
  localparam   REG_21    =    5'b10101;
  localparam   REG_22    =    5'b10110;
  localparam   REG_23    =    5'b10111;
  localparam   REG_24    =    5'b11000;
  localparam   REG_25    =    5'b11001;
  localparam   REG_26    =    5'b11010;
  localparam   REG_27    =    5'b11011;
  localparam   REG_28    =    5'b11100;
  localparam   REG_29    =    5'b11101;
  localparam   REG_30    =    5'b11110;
  localparam   REG_31    =    5'b11111;
  
  /* Outputs from each specific register */
  wire [31:0] 	out1,out2,out3,out4,
              	out5,out6,out7,out8,
              	out9,out10,out11,out12,
              	out13,out14,out15,out16,
					out17,out18,out19,out20,
					out21,out22,out23,out24,
					out25,out26,out27,out28,
					out29,out30,out31;
					
	wire [31:0] Write_Bus;
	
	wire [31:0] zero,at,v0,v1,a0,a1,a2,a3,t0,t1,t2,t3,t4,t5,t6,t7,s0,s1,s2,s3,s4,s5,s6,s7,t8,t9,t10,au,idr,sp,epc,ra;
	
	assign zero = 32'h00000000;
	assign at = out1;
	assign v0 = out2;
	assign v1 = out3;
	assign a0 = out4;
	assign a1 = out5;
	assign a2 = out6;
	assign a3 = out7;
	assign t0 = out8;
	assign t1 = out9;
	assign t2 = out10;
	assign t3 = out11;
	assign t4 = out12;
	assign t5 = out13;
	assign t6 = out14;
	assign t7 = out15;
	assign s0 = out16;
	assign s1 = out17;
	assign s2 = out18;
	assign s3 = out19;
	assign s4 = out20;
	assign s5 = out21;
	assign s6 = out22;
	assign s7 = out23;
	assign t8 = out24;
	assign t9 = out25;
	assign t10 = out26;
	assign au = out27;
	assign idr = out28;
	assign sp = out29;
	assign epc = out30;
	assign ra = out31;
	
	assign Write_Bus = (rst) ? 32'h00000000 : Write_Bus_in;
             
  /* Register Write Selection */
  reg [30:0] RegWriteSel;
    
  // Assembler Temporary Register  
  Reg_32bit Assembler_Temp(.clk(clk), .en(RegWriteSel[0]), .d(Write_Bus), .q(out1));	// Register 1

  // Function Result Registers
  Reg_32bit Func_Result_1(.clk(clk), .en(RegWriteSel[1]), .d(Write_Bus), .q(out2));		// Register 2
  Reg_32bit Func_Result_2(.clk(clk), .en(RegWriteSel[2]), .d(Write_Bus), .q(out3));		// Register 3

  // Argument Registers
  Reg_32bit Arg_Reg_1(.clk(clk), .en(RegWriteSel[3]), .d(Write_Bus), .q(out4));			// Register 4
  Reg_32bit Arg_Reg_2(.clk(clk), .en(RegWriteSel[4]), .d(Write_Bus), .q(out5));			// Register 5
  Reg_32bit Arg_Reg_3(.clk(clk), .en(RegWriteSel[5]), .d(Write_Bus), .q(out6));			// Register 6
  Reg_32bit Arg_Reg_4(.clk(clk), .en(RegWriteSel[6]), .d(Write_Bus), .q(out7));			// Register 7

  // Temporary Value Registers
  Reg_32bit Temp_Reg_1(.clk(clk), .en(RegWriteSel[7]), .d(Write_Bus), .q(out8));		// Register 8
  Reg_32bit Temp_Reg_2(.clk(clk), .en(RegWriteSel[8]), .d(Write_Bus), .q(out9));		// Register 9
  Reg_32bit Temp_Reg_3(.clk(clk), .en(RegWriteSel[9]), .d(Write_Bus), .q(out10));		// Register 10
  Reg_32bit Temp_Reg_4(.clk(clk), .en(RegWriteSel[10]), .d(Write_Bus), .q(out11));		// Register 11
  Reg_32bit Temp_Reg_5(.clk(clk), .en(RegWriteSel[11]), .d(Write_Bus), .q(out12));		// Register 12
  Reg_32bit Temp_Reg_6(.clk(clk), .en(RegWriteSel[12]), .d(Write_Bus), .q(out13));		// Register 13
  Reg_32bit Temp_Reg_7(.clk(clk), .en(RegWriteSel[13]), .d(Write_Bus), .q(out14));		// Register 14
  Reg_32bit Temp_Reg_8(.clk(clk), .en(RegWriteSel[14]), .d(Write_Bus), .q(out15));		// Register 15
  Reg_32bit Temp_Reg_9(.clk(clk), .en(RegWriteSel[15]), .d(Write_Bus), .q(out16));		// Register 16
  Reg_32bit Temp_Reg_10(.clk(clk), .en(RegWriteSel[16]), .d(Write_Bus), .q(out17));		// Register 17
  Reg_32bit Temp_Reg_11(.clk(clk), .en(RegWriteSel[17]), .d(Write_Bus), .q(out18));		// Register 18

  // Saved Temporary Value Registers
  Reg_32bit Saved_Temp_Reg_1(.clk(clk), .en(RegWriteSel[18]), .d(Write_Bus), .q(out19));	// Register 19
  Reg_32bit Saved_Temp_Reg_2(.clk(clk), .en(RegWriteSel[19]), .d(Write_Bus), .q(out20));	// Register 20
  Reg_32bit Saved_Temp_Reg_3(.clk(clk), .en(RegWriteSel[20]), .d(Write_Bus), .q(out21));	// Register 21
  Reg_32bit Saved_Temp_Reg_4(.clk(clk), .en(RegWriteSel[21]), .d(Write_Bus), .q(out22));	// Register 22
  Reg_32bit Saved_Temp_Reg_5(.clk(clk), .en(RegWriteSel[22]), .d(Write_Bus), .q(out23));	// Register 23
  Reg_32bit Saved_Temp_Reg_6(.clk(clk), .en(RegWriteSel[23]), .d(Write_Bus), .q(out24));	// Register 24
  Reg_32bit Saved_Temp_Reg_7(.clk(clk), .en(RegWriteSel[24]), .d(Write_Bus), .q(out25));	// Register 25
  Reg_32bit Saved_Temp_Reg_8(.clk(clk), .en(RegWriteSel[25]), .d(Write_Bus), .q(out26));	// Register 26

  // Special Purpose Registers
  Reg_32bit Audio_Address(.clk(clk), .en(RegWriteSel[26]), .d(Write_Bus), .q(out27));		// Register 27
  Reg_32bit Global_Pointer(.clk(clk), .en(RegWriteSel[27]), .d(Write_Bus), .q(out28));		// Register 28
  Reg_32bit Stack_Pointer(.clk(clk), .en(RegWriteSel[28]), .d(Write_Bus_in), .q(out29));		// Register 29
  Reg_32bit Frame_Pointer(.clk(clk), .en(RegWriteSel[29]), .d(Write_Bus), .q(out30));		// Register 30
  Reg_32bit Return_Address(.clk(clk), .en(RegWriteSel[30]), .d(Write_Bus), .q(out31));		// Register 31

/* Read data from the specified registers locations */
always @(negedge clk) begin
   
	if (Read_Reg_1_en) begin

		case(Read_Reg_1)
           
			REG_0 : Read_Bus_1 <= 32'h00000000;
			REG_1 : Read_Bus_1 <= out1;
			REG_2 : Read_Bus_1 <= out2;
			REG_3 : Read_Bus_1 <= out3;
			REG_4 : Read_Bus_1 <= out4;
			REG_5 : Read_Bus_1 <= out5;
			REG_6 : Read_Bus_1 <= out6;
			REG_7 : Read_Bus_1 <= out7;
			REG_8 : Read_Bus_1 <= out8;
			REG_9 : Read_Bus_1 <= out9;
			REG_10 : Read_Bus_1 <= out10;
			REG_11 : Read_Bus_1 <= out11;
			REG_12 : Read_Bus_1 <= out12;
			REG_13 : Read_Bus_1 <= out13;
			REG_14 : Read_Bus_1 <= out14;
			REG_15 : Read_Bus_1 <= out15;
			REG_16 : Read_Bus_1 <= out16;
			REG_17 : Read_Bus_1 <= out17;
			REG_18 : Read_Bus_1 <= out18;
			REG_19 : Read_Bus_1 <= out19;
			REG_20 : Read_Bus_1 <= out20;
			REG_21 : Read_Bus_1 <= out21;
			REG_22 : Read_Bus_1 <= out22;
			REG_23 : Read_Bus_1 <= out23;
			REG_24 : Read_Bus_1 <= out24;
			REG_25 : Read_Bus_1 <= out25;
			REG_26 : Read_Bus_1 <= out26;
			REG_27 : Read_Bus_1 <= out27;
			REG_28 : Read_Bus_1 <= out28;
			REG_29 : Read_Bus_1 <= out29;
			REG_30 : Read_Bus_1 <= out30;
			REG_31 : Read_Bus_1 <= out31;
            
		endcase
	end

	// If the enable isn't set, don't drive
	else begin

		Read_Bus_1 <= 32'hzzzzzzzz;

	end

	if (Read_Reg_2_en) begin
      
		case(Read_Reg_2)
           
			REG_0 : Read_Bus_2 <= 32'h00000000;
			REG_1 : Read_Bus_2 <= out1;
			REG_2 : Read_Bus_2 <= out2;
			REG_3 : Read_Bus_2 <= out3;
			REG_4 : Read_Bus_2 <= out4;
			REG_5 : Read_Bus_2 <= out5;
			REG_6 : Read_Bus_2 <= out6;
			REG_7 : Read_Bus_2 <= out7;
			REG_8 : Read_Bus_2 <= out8;
			REG_9 : Read_Bus_2 <= out9;
			REG_10 : Read_Bus_2 <= out10;
			REG_11 : Read_Bus_2 <= out11;
			REG_12 : Read_Bus_2 <= out12;
			REG_13 : Read_Bus_2 <= out13;
			REG_14 : Read_Bus_2 <= out14;
			REG_15 : Read_Bus_2 <= out15;
			REG_16 : Read_Bus_2 <= out16;
			REG_17 : Read_Bus_2 <= out17;
			REG_18 : Read_Bus_2 <= out18;
			REG_19 : Read_Bus_2 <= out19;
			REG_20 : Read_Bus_2 <= out20;
			REG_21 : Read_Bus_2 <= out21;
			REG_22 : Read_Bus_2 <= out22;
			REG_23 : Read_Bus_2 <= out23;
			REG_24 : Read_Bus_2 <= out24;
			REG_25 : Read_Bus_2 <= out25;
			REG_26 : Read_Bus_2 <= out26;
			REG_27 : Read_Bus_2 <= out27;
			REG_28 : Read_Bus_2 <= out28;
			REG_29 : Read_Bus_2 <= out29;
			REG_30 : Read_Bus_2 <= out30;
			REG_31 : Read_Bus_2 <= out31;
            
		endcase
	end

	// If the enable isn't set, don't drive
	else begin

		Read_Bus_2 <= 32'hzzzzzzzz;

	end
     
end
  
/* Write data to the specified location */
always @(negedge clk) begin
    
	if (rst) begin
	
			RegWriteSel 	<= 31'hFFFFFFFF;

	end
	 
	else if (RegWrite) begin
      
		case(Write_Reg)
           
			REG_1 : RegWriteSel 	<= 31'h00000001;
			REG_2 : RegWriteSel 	<= 31'h00000002;
			REG_3 : RegWriteSel 	<= 31'h00000004;
			REG_4 : RegWriteSel 	<= 31'h00000008;
			REG_5 : RegWriteSel 	<= 31'h00000010;
			REG_6 : RegWriteSel 	<= 31'h00000020;
			REG_7 : RegWriteSel 	<= 31'h00000040;
			REG_8 : RegWriteSel 	<= 31'h00000080;
			REG_9 : RegWriteSel 	<= 31'h00000100;
			REG_10 : RegWriteSel 	<= 31'h00000200;
			REG_11 : RegWriteSel 	<= 31'h00000400;
			REG_12 : RegWriteSel 	<= 31'h00000800;
			REG_13 : RegWriteSel 	<= 31'h00001000;
			REG_14 : RegWriteSel 	<= 31'h00002000;
			REG_15 : RegWriteSel 	<= 31'h00004000;
			REG_16 : RegWriteSel 	<= 31'h00008000;
			REG_17 : RegWriteSel 	<= 31'h00010000;
			REG_18 : RegWriteSel 	<= 31'h00020000;
			REG_19 : RegWriteSel 	<= 31'h00040000;
			REG_20 : RegWriteSel 	<= 31'h00080000;
			REG_21 : RegWriteSel 	<= 31'h00100000;
			REG_22 : RegWriteSel 	<= 31'h00200000;
			REG_23 : RegWriteSel 	<= 31'h00400000;
			REG_24 : RegWriteSel 	<= 31'h00800000;
			REG_25 : RegWriteSel 	<= 31'h01000000;
			REG_26 : RegWriteSel 	<= 31'h02000000;
			REG_27 : RegWriteSel 	<= 31'h04000000;
			REG_28 : RegWriteSel 	<= 31'h08000000;
			REG_29 : RegWriteSel 	<= 31'h10000000;
			REG_30 : RegWriteSel 	<= 31'h20000000;
			REG_31 : RegWriteSel 	<= 31'h40000000;
			default : RegWriteSel	<= 31'h00000000;
            
		endcase
	end
      
	/* Ensure that no register is written
	   when RegWrite is not active */
	else begin
          
		RegWriteSel <= 32'h00000000;
          
	end
      
end

endmodule
