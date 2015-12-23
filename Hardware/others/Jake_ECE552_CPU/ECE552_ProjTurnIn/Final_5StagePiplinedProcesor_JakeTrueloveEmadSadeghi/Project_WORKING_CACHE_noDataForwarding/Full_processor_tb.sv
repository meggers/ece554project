/*Notes on testing
-So far testing on individual instructions(without data dependencies) is being done

Working instructions:
   LLW
   LHW
   NAND
   AND
   SUB
   XOR
   INC
   SRA
   SRL
   SLL

*/

module Full_processor_tb();
    logic [15:0] instr;
    logic rst;
    logic clk;
    logic [15:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15;
    logic [15:0] i;
    integer f;
    logic N, Z, V;

    
    Full_processor FP1(.instr(instr), .rst(rst), .clk(clk), .R0(R0), .R1(R1), .R2(R2), .R3(R3), 
                         .R4(R4), .R5(R5), .R6(R6), .R7(R7), .R8(R8), .R9(R9), .R10(R10), .R11(R11), 
                          .R12(R12), .R13(R13), .R14(R14), .R15(R15), .PC(PC), .IFID(IFID), .N_ff(N),.Z_ff(Z), .V_ff(V));


    
    initial begin
        f = $fopen("output_AllReg_Loop.txt");

        rst = 0;
        clk = 0;
        
        #6 rst = 1;
        
        $fdisplay(f, "The register, PC, and cycle # values in each cycle until last cycle of execution.");
        $fdisplay(f, "\n This data is for Loop Test.");
        #27000
        $fclose(f);
        $stop;
        
    end
    always begin
        #5 clk = ~clk;
    end
    
    always @(posedge clk) begin
       if(~rst)begin
          i = 0;
       end
       else begin
           
           
          $fdisplay(f, "**********************************");  
          $fdisplay(f, "Clock:#%d", i); 
          $fdisplay(f, "PC:%h", PC);
          $fdisplay(f, "----------------------------------");  
          $fdisplay(f, "R0:%h\t", R0); 
          $fdisplay(f, "R1:%h\t", R1); 
          $fdisplay(f, "R2:%h\t", R2); 
          $fdisplay(f, "R3:%h\t", R3); 
          $fdisplay(f, "R4:%h\t", R4); 
          $fdisplay(f, "R5:%h\t", R5); 
          $fdisplay(f, "R6:%h\t", R6); 
          $fdisplay(f, "R7:%h\t", R7); 
          $fdisplay(f, "R8:%h\t", R8); 
          $fdisplay(f, "R9:%h\t", R9); 
          $fdisplay(f, "R10:%h\t", R10); 
          $fdisplay(f, "R11:%h\t", R11); 
          $fdisplay(f, "R12:%h\t", R12); 
          $fdisplay(f, "R13:%h\t", R13); 
          $fdisplay(f, "R14:%h\t", R14); 
          $fdisplay(f, "R15:%h\t", R15); 
          $fdisplay(f, "**********************************");   
       i = i + 1;
       end
    end 
        
endmodule