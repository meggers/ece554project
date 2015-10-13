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

module MonitorTestBench();
    logic [15:0] instr;
    logic rst;
    logic clk;
    logic [15:0] R0, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, R11, R12, R13, R14, R15;
    logic [15:0] i;
    integer f;
    logic [15:0] PC;
    logic [15:0] IFID;
    logic N, Z, V;
    
    Full_processor FP1(.instr(instr), .rst(rst), .clk(clk), .R0(R0), .R1(R1), .R2(R2), .R3(R3), 
                         .R4(R4), .R5(R5), .R6(R6), .R7(R7), .R8(R8), .R9(R9), .R10(R10), .R11(R11), 
                          .R12(R12), .R13(R13), .R14(R14), .R15(R15), .PC(PC), .IFID(IFID), .N_ff(N),.Z_ff(Z), .V_ff(V));

    
    
    initial begin
        f = $fopen("output_monitor.txt");

        rst = 0;
        clk = 0;
        
        #6 rst = 1;
        
        //$display(f, "   R0:%h", R0);

        $fmonitor(f, "PC: #%d\n", i); 
        $fmonitor(f, "Clock: #%d\n", i); 
        $fmonitor(f, "R0:%h\t", R0);
        $fmonitor(f, "R1:%h\t", R1);
        $fmonitor(f, "R2:%h\t", R2);
        $fmonitor(f, "R3:%h\t", R3);
        $fmonitor(f, "R4:%h\t", R4);
        $fmonitor(f, "R5:%h\t", R5);
        $fmonitor(f, "R6:%h\t", R6);
        $fmonitor(f, "R7:%h\t", R7);
        $fmonitor(f, "R8:%h\t", R8);
        $fmonitor(f, "R9:%h\t", R9);
        $fmonitor(f, "R10:%h\t", R10);
        $fmonitor(f, "R11:%h\t", R11);
        $fmonitor(f, "R12:%h\t", R12);
        $fmonitor(f, "R13:%h\t", R13);
        $fmonitor(f, "R14:%h\t", R14);
        $fmonitor(f, "R15:%h\t", R15);

        
        #500 
          /////////////////
          // BasicOp Test// 
          /////////////////
          flag = 0; 
          fdisplay(f, "The test: ");
          if ((R1 ~= 4h'0001) || (R2 ~= 4h'0010) ||
              (R0 ~= 4h'0000) || (R3 ~= 4h'0011) || 
              (R4 ~= 4h'FFFF) || (R5 ~= 4h'0011) ||
              (R6 ~= 4h'0011) || (R7 ~= 4h'000F) || 
              (R8 ~= 4h'FFFF) || (R9 ~= 4h'0FFF) ||
              (R10 ~= 4h'FFF0) || (R11 ~= 4h'FFF0) ||
              (R14 ~= 4h'000B))
             flag = 1; 
          end
          
          if (flag == 1)
             fdisplay(f, "Worked! All register values were correct.");
          end
          else 
             fdisplay(f, "Failed! Some register values were incorrect.");
          end
          
          
          /////////////////
          // LwStall Test// 
          /////////////////
          flag = 0; 
          fdisplay(f, "The test: ");
          if ((R1 ~= 4h'0006) || (R2 ~= 4h'0000) ||
              (R3 ~= 4h'0000) || (R10 ~= 4h'00AA) || 
              (R15 ~= 4h'0006)|| (R14 ~= 4h'0006))
             flag = 1; 
          end
          
          if (flag == 1)
             fdisplay(f, "Worked! All register values were correct.");
          end
          else 
             fdisplay(f, "Failed! Some register values were incorrect.");
          end
          
          
          /////////////////
          // DataDependence Test// 
          /////////////////
          flag = 0; 
          fdisplay(f, "The test: ");
          if ((R1 ~= 4h'0000) || (R2 ~= 4h'0000) ||
              (R4 ~= 4h'000C) || (R3 ~= 4h'0000) || 
              (R14 ~= 4h'0000))
             flag = 1; 
          end
          
          if (flag == 1)
             fdisplay(f, "Worked! All register values were correct.");
          end
          else 
             fdisplay(f, "Failed! Some register values were incorrect.");
          end
          
          ////////////////
          // Loop Test  // 
          ////////////////
          flag = 0; 
          fdisplay(f, "The test: ");
          if ((R1 ~= 4h'0001) || (R2 ~= 4h'0001) ||
              (R3 ~= 4h'0001))
             flag = 1; 
          end
          
          if (flag == 1)
             fdisplay(f, "Worked! All register values were correct.");
          end
          else 
             fdisplay(f, "Failed! Some register values were incorrect.");
          end
          
          
          ///////////////
          // Control Test // 
          ///////////////
          flag = 0; 
          fdisplay(f, "The test: ");
          if ((R15 ~= 4h'000F) || (R3 ~= 4h'0057) ||
              (R0 ~= 4h'0000) || (R4 ~= 4h'0057) ||
              (R1 ~= 4h'AAAA))
             flag = 1; 
          end
          
          if (flag == 1)
             fdisplay(f, "Worked! All register values were correct.");
          end
          else 
             fdisplay(f, "Failed! Some register values were incorrect.");
          end
          
          
          
             
          ///////////////
          //Branch Test// 
          ///////////////
          flag = 0; 
          fdisplay(f, "The test: ");
          if ((R15 ~= 4h'0022) || (R2 ~= 4h'0011) ||
              (R0 ~= 4h'0000) || (R3 ~= 4h'5555) ||
              (R11 ~= 4h'AAAA))
             flag = 1; 
          end
          
          if (flag == 1)
             fdisplay(f, "Worked! All register values were correct.");
          end
          else 
             fdisplay(f, "Failed! Some register values were incorrect.");
          end
          
          
          
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
             i = i + 1;
       end
    end 
        
endmodule
