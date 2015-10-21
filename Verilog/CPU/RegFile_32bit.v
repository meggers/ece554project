
/* This module defines the regeister interface
   for accessing the 16-bit registers used by
   our processor. */
module RegFile_32bit(clk, RegWrite, Read_Reg_1, Read_Reg_2, Write_Reg, Write_Bus,
						Read_Bus_1, Read_Bus_2);
                 
  input clk;
  input RegWrite; // Writes data to a register when high  
  
  /* Input address buses */
  input [4:0] Read_Reg_1;
  input [4:0] Read_Reg_2;
  input [4:0] Write_Reg;
  
  /* Input Write Data */
  input [31:0] Write_Bus;
 
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
  wire [31:0] 	out2,out3,out4,
              	out5,out6,out7,out8,
              	out9,out10,out11,out12,
              	out13,out14,out15,out16,
		out17,out18,out19,out20,
		out21,out22,out23,out24,
		out25,out26,out27,out28,
		out29,out30,out31,out32;
             
  /* Register Write Selection */
  reg [31:0] RegWriteSel;
    
  // Assembler Temporary Register  
  Reg_32bit Assembler_Temp(.clk(clk), .en(RegWriteSel[1]), .d(Write_Bus), .q(out2));

  // Function Result Registers
  Reg_32bit Func_Result_1(.clk(clk), .en(RegWriteSel[2]), .d(Write_Bus), .q(out3));
  Reg_32bit Func_Result_2(.clk(clk), .en(RegWriteSel[3]), .d(Write_Bus), .q(out4));

  // Argument Registers
  Reg_32bit Arg_Reg_1(.clk(clk), .en(RegWriteSel[4]), .d(Write_Bus), .q(out5));
  Reg_32bit Arg_Reg_2(.clk(clk), .en(RegWriteSel[5]), .d(Write_Bus), .q(out6));
  Reg_32bit Arg_Reg_3(.clk(clk), .en(RegWriteSel[6]), .d(Write_Bus), .q(out7));
  Reg_32bit Arg_Reg_4(.clk(clk), .en(RegWriteSel[7]), .d(Write_Bus), .q(out8));

  // Temporary Value Registers
  Reg_32bit Temp_Reg_1(.clk(clk), .en(RegWriteSel[8]), .d(Write_Bus), .q(out9));
  Reg_32bit Temp_Reg_2(.clk(clk), .en(RegWriteSel[9]), .d(Write_Bus), .q(out10));
  Reg_32bit Temp_Reg_3(.clk(clk), .en(RegWriteSel[10]), .d(Write_Bus), .q(out11));
  Reg_32bit Temp_Reg_4(.clk(clk), .en(RegWriteSel[11]), .d(Write_Bus), .q(out12));
  Reg_32bit Temp_Reg_5(.clk(clk), .en(RegWriteSel[12]), .d(Write_Bus), .q(out13));
  Reg_32bit Temp_Reg_6(.clk(clk), .en(RegWriteSel[13]), .d(Write_Bus), .q(out14));
  Reg_32bit Temp_Reg_7(.clk(clk), .en(RegWriteSel[14]), .d(Write_Bus), .q(out1));
  Reg_32bit Temp_Reg_8(.clk(clk), .en(RegWriteSel[15]), .d(Write_Bus), .q(out2));
  Reg_32bit Temp_Reg_9(.clk(clk), .en(RegWriteSel[16]), .d(Write_Bus), .q(out11));
  Reg_32bit Temp_Reg_10(.clk(clk), .en(RegWriteSel[17]), .d(Write_Bus), .q(out12));
  Reg_32bit Temp_Reg_11(.clk(clk), .en(RegWriteSel[18]), .d(Write_Bus), .q(out13));

  // Saved Temporary Value Registers
  Reg_32bit Saved_Temp_Reg_1(.clk(clk), .en(RegWriteSel[19]), .d(Write_Bus), .q(out3));
  Reg_32bit Saved_Temp_Reg_2(.clk(clk), .en(RegWriteSel[20]), .d(Write_Bus), .q(out4));
  Reg_32bit Saved_Temp_Reg_3(.clk(clk), .en(RegWriteSel[21]), .d(Write_Bus), .q(out5));
  Reg_32bit Saved_Temp_Reg_4(.clk(clk), .en(RegWriteSel[22]), .d(Write_Bus), .q(out6));
  Reg_32bit Saved_Temp_Reg_5(.clk(clk), .en(RegWriteSel[23]), .d(Write_Bus), .q(out7));
  Reg_32bit Saved_Temp_Reg_6(.clk(clk), .en(RegWriteSel[24]), .d(Write_Bus), .q(out8));
  Reg_32bit Saved_Temp_Reg_7(.clk(clk), .en(RegWriteSel[25]), .d(Write_Bus), .q(out9));
  Reg_32bit Saved_Temp_Reg_8(.clk(clk), .en(RegWriteSel[26]), .d(Write_Bus), .q(out10));

  // Special Purpose Registers
  Reg_32bit Audio_Address(.clk(clk), .en(RegWriteSel[27]), .d(Write_Bus), .q(out27));
  Reg_32bit Global_Pointer(.clk(clk), .en(RegWriteSel[28]), .d(Write_Bus), .q(out28));
  Reg_32bit Stack_Pointer(.clk(clk), .en(RegWriteSel[29]), .d(Write_Bus), .q(out29));
  Reg_32bit Frame_Pointer(.clk(clk), .en(RegWriteSel[30]), .d(Write_Bus), .q(out30));
  Reg_32bit Return_Address(.clk(clk), .en(RegWriteSel[31]), .d(Write_Bus), .q(out31));

  /* Read data from the specified registers locations */
  always @(negedge clk) begin
    
       // The instruction requires the use of the Stack_Pointer reg
       if (StackReg) begin
           Read_Bus_1 = out16;
           Read_Bus_2 = 16'h0000;
       end
       
       else begin
           
          // The instruction requires the use of the Data_Segment reg
          if (DataReg) begin
              Read_Bus_1 = out15;
          end
       
          // The instruction does not require the use of special registers       
          else begin
          
             case(Read_Reg_1)
           
                 REG_0 : Read_Bus_1 = 32'h00000000;
                 REG_1 : Read_Bus_1 = out2;
                 REG_2 : Read_Bus_1 = out3;
                 REG_3 : Read_Bus_1 = out4;
                 REG_4 : Read_Bus_1 = out5;
                 REG_5 : Read_Bus_1 = out6;
                 REG_6 : Read_Bus_1 = out7;
                 REG_7 : Read_Bus_1 = out8;
                 REG_8 : Read_Bus_1 = out9;
                 REG_9 : Read_Bus_1 = out10;
                 REG_10 : Read_Bus_1 = out11;
                 REG_11 : Read_Bus_1 = out12;
                 REG_12 : Read_Bus_1 = out13;
                 REG_13 : Read_Bus_1 = out14;
                 REG_14 : Read_Bus_1 = out15;
                 REG_15 : Read_Bus_1 = out16;
		 REG_16 : Read_Bus_1 = out17;
                 REG_17 : Read_Bus_1 = out18;
                 REG_18 : Read_Bus_1 = out19;
                 REG_19 : Read_Bus_1 = out20;
                 REG_20 : Read_Bus_1 = out21;
                 REG_21 : Read_Bus_1 = out22;
                 REG_22 : Read_Bus_1 = out23;
                 REG_23 : Read_Bus_1 = out24;
                 REG_24 : Read_Bus_1 = out25;
                 REG_25 : Read_Bus_1 = out26;
                 REG_26 : Read_Bus_1 = out27;
                 REG_27 : Read_Bus_1 = out28;
                 REG_28 : Read_Bus_1 = out29;
                 REG_29 : Read_Bus_1 = out30;
                 REG_30 : Read_Bus_1 = out31;
                 REG_31 : Read_Bus_1 = out32;
            
             endcase
          
          end
       
          case(Read_Reg_2)
           
                 REG_0 : Read_Bus_2 = 32'h00000000;
                 REG_1 : Read_Bus_2 = out2;
                 REG_2 : Read_Bus_2 = out3;
                 REG_3 : Read_Bus_2 = out4;
                 REG_4 : Read_Bus_2 = out5;
                 REG_5 : Read_Bus_2 = out6;
                 REG_6 : Read_Bus_2 = out7;
                 REG_7 : Read_Bus_2 = out8;
                 REG_8 : Read_Bus_2 = out9;
                 REG_9 : Read_Bus_2 = out10;
                 REG_10 : Read_Bus_2 = out11;
                 REG_11 : Read_Bus_2 = out12;
                 REG_12 : Read_Bus_2 = out13;
                 REG_13 : Read_Bus_2 = out14;
                 REG_14 : Read_Bus_2 = out15;
                 REG_15 : Read_Bus_2 = out16;
		 REG_16 : Read_Bus_2 = out17;
                 REG_17 : Read_Bus_2 = out18;
                 REG_18 : Read_Bus_2 = out19;
                 REG_19 : Read_Bus_2 = out20;
                 REG_20 : Read_Bus_2 = out21;
                 REG_21 : Read_Bus_2 = out22;
                 REG_22 : Read_Bus_2 = out23;
                 REG_23 : Read_Bus_2 = out24;
                 REG_24 : Read_Bus_2 = out25;
                 REG_25 : Read_Bus_2 = out26;
                 REG_26 : Read_Bus_2 = out27;
                 REG_27 : Read_Bus_2 = out28;
                 REG_28 : Read_Bus_2 = out29;
                 REG_29 : Read_Bus_2 = out30;
                 REG_30 : Read_Bus_2 = out31;
                 REG_31 : Read_Bus_2 = out32;
            
          endcase
          
      end
      
  end
  
  /* Write data to the specified location */
  always @(posedge clk) begin
      
      if (RegWrite) begin
      
         case(Write_Reg)
           
           REG_0 : RegWriteSel = 32'h00000001;
           REG_1 : RegWriteSel = 32'h00000002;
           REG_2 : RegWriteSel = 32'h00000004;
           REG_3 : RegWriteSel = 32'h00000008;
           REG_4 : RegWriteSel = 32'h00000010;
           REG_5 : RegWriteSel = 32'h00000020;
           REG_6 : RegWriteSel = 32'h00000040;
           REG_7 : RegWriteSel = 32'h00000080;
           REG_8 : RegWriteSel = 32'h00000100;
           REG_9 : RegWriteSel = 32'h00000200;
           REG_10 : RegWriteSel = 32'h00000400;
           REG_11 : RegWriteSel = 32'h00000800;
           REG_12 : RegWriteSel = 32'h00001000;
           REG_13 : RegWriteSel = 32'h00002000;
           REG_14 : RegWriteSel = 32'h00004000;
           REG_15 : RegWriteSel = 32'h00008000;
	   REG_16 : RegWriteSel = 32'h00010000;
           REG_17 : RegWriteSel = 32'h00020000;
           REG_18 : RegWriteSel = 32'h00040000;
           REG_19 : RegWriteSel = 32'h00080000;
           REG_20 : RegWriteSel = 32'h00100000;
           REG_21 : RegWriteSel = 32'h00200000;
           REG_22 : RegWriteSel = 32'h00400000;
           REG_23 : RegWriteSel = 32'h00800000;
           REG_24 : RegWriteSel = 32'h01000000;
           REG_25 : RegWriteSel = 32'h02000000;
           REG_26 : RegWriteSel = 32'h04000000;
           REG_27 : RegWriteSel = 32'h08000000;
           REG_28 : RegWriteSel = 32'h10000000;
           REG_29 : RegWriteSel = 32'h20000000;
           REG_30 : RegWriteSel = 32'h40000000;
           REG_31 : RegWriteSel = 32'h80000000;
            
          endcase
       
      end
      
      /* Ensure that no register is written
         when RegWrite is not active */
      else begin
          
          RegWriteSel = 32'h00000000;
          
      end
      
  end

endmodule