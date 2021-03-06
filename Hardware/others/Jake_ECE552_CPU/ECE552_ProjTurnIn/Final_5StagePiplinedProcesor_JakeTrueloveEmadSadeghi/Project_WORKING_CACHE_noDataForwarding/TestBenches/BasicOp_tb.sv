module BasicOp_tb();
    logic [15:0] instr;
    logic rst;
    logic clk;
    logic [15:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15;
    logic [15:0] i;
    integer f;
    logic [15:0] PC;
    logic [15:0] IFID;
    logic N, Z, V;
    logic flag;
    
    Full_processor FP1(.instr(instr), .rst(rst), .clk(clk), .R0(R0), .R1(R1), .R2(R2), .R3(R3), 
                         .R4(R4), .R5(R5), .R6(R6), .R7(R7), .R8(R8), .R9(R9), .R10(R10), .R11(R11), 
                          .R12(R12), .R13(R13), .R14(R14), .R15(R15), .PC(PC), .IFID(IFID), .N_ff(N),.Z_ff(Z), .V_ff(V));

    
    initial begin
        f = $fopen("output_basicOp.txt");

        rst = 1;
        clk = 0;
        
        #16 rst = 0;
        
        $fdisplay(f, "BasicOp TEST <-----PASS\n\n");
        
        $fmonitor(f, "\tClock #%d", i);
        $fmonitor(f, "\n--------\nPC = %h\n--------\n", PC);
        $fmonitor(f, "IFID = %h", IFID);
        $fmonitor(f, "\t\t\tR0 =%h", R0);
        $fmonitor(f, "\t\t\tR1 =%h", R1);
        $fmonitor(f, "\t\t\tR2 =%h", R2);
        $fmonitor(f, "\t\t\tR3 =%h", R3);
        $fmonitor(f, "\t\t\tR4 =%h", R4);
        $fmonitor(f, "\t\t\tR5 =%h", R5);
        $fmonitor(f, "\t\t\tR6 =%h", R6);
        $fmonitor(f, "\t\t\tR7 =%h", R7);
        $fmonitor(f, "\t\t\tR8 =%h", R8);
        $fmonitor(f, "\t\t\tR9 =%h", R9);
        $fmonitor(f, "\t\t\tR10 =%h", R10);
        $fmonitor(f, "\t\t\tR11 =%h", R11);
        $fmonitor(f, "\t\t\tR12 =%h", R12);
        $fmonitor(f, "\t\t\tR13 =%h", R13);
        $fmonitor(f, "\t\t\tR14 =%h", R14);
        $fmonitor(f, "\t\t\tR15 =%h", R15);
        $fmonitor(f, "\t\t\t N = %b", N);
        $fmonitor(f, "\t\t\t V = %b", V);
        $fmonitor(f, "\t\t\t Z = %b", Z);
        $fmonitor(f, "\t\t\t rst = %b", rst);
        
        #800 
        
          ////////////////////////////////
          // BasicOp Test-Gold Standard // 
          ////////////////////////////////
          $fdisplay(f, "\n");
          $fdisplay(f, "**********************************");  
          $fdisplay(f, "The final values of registers are:\n"); 
          $fdisplay(f, "R0:  %h\n", R0); 
          $fdisplay(f, "R1:  %h\n", R1); 
          $fdisplay(f, "R2:  %h\n", R2); 
          $fdisplay(f, "R3:  %h\n", R3); 
          $fdisplay(f, "R4:  %h\n", R4); 
          $fdisplay(f, "R5:  %h\n", R5); 
          $fdisplay(f, "R6:  %h\n", R6); 
          $fdisplay(f, "R7:  %h\n", R7); 
          $fdisplay(f, "R8:  %h\n", R8); 
          $fdisplay(f, "R9:  %h\n", R9); 
          $fdisplay(f, "R10: %h\n", R10); 
          $fdisplay(f, "R11: %h\n", R11); 
          $fdisplay(f, "R12: %h\n", R12); 
          $fdisplay(f, "R13: %h\n", R13); 
          $fdisplay(f, "R14: %h\n", R14); 
          $fdisplay(f, "R15: %h\n", R15); 
          $fdisplay(f, "**********************************");   
          
          
          flag = 1; 
          $fdisplay(f, "\n\n------------------------------------------------------------------------------");
          $fdisplay(f,    "| The BasicOp Test:                                                          |");
          //This if statement checks that the registers hold the values that they should after executing
          //the full program
          if ((R1 == 16'h0001) && (R2 == 16'h0010) &&
              (R0 == 16'h0000) && (R3 == 16'h0011) && 
              (R4 == 16'hFFFF) && (R5 == 16'h0011) &&
              (R6 == 16'h0011) && (R7 == 16'h000F) && 
              (R8 == 16'h0FFF) && (R9 == 16'h0FFF) &&
              (R10 == 16'hFFF0) && (R11 == 16'hFFF0) &&
              (R14 == 16'h000B) && (R15 == 16'hFFFF))
             flag = 0; 
          
          
          if (flag == 0)
             $fdisplay(f, "| Worked! All the registers that have values were checked to be correct.     |");
          
          else 
             $fdisplay(f, "| Failed! Some of the register values were incorrect.                        |");
          
        $fdisplay(f,      "------------------------------------------------------------------------------\n");
        $fclose(f);
        $stop;
        
    end
    always begin
        #5 clk = ~clk;
    end
    
    always @(posedge clk) begin
       if(rst)begin
          i = 0;
       end
       else begin
       i = i + 1;
       end
    end 
        
endmodule
