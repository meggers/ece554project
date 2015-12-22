module ALU_tb();

   logic  [15:0] ALU_in1, ALU_in2;
   logic [3:0] op;
   logic N, Z, V;
   logic [15:0] ALU_out;
   logic [17:0] i, j;
   
   localparam ADD = 4'b0000;
   localparam SUB = 4'b0001;
   localparam NAND = 4'b0010;
   localparam XOR = 4'b0011;
   
   ALU alu(.N(N), .Z(Z), .V(V), .ALU_in1(ALU_in1), .ALU_in2(ALU_in2), .ALU_out(ALU_out), .op(op));
   
   initial begin
       ALU_in1 = 16'h45A1;
       ALU_in2 = 16'h17CF;
       #5 op = ADD;
       #5 op = SUB;
       #5 op = NAND;
       #5 op = XOR;

       #5 ALU_in1 = 16'h75A1;
       ALU_in2 = 16'h17CF;
       #5 op = ADD;
       #5 op = SUB;
       #5 op = NAND;
       #5 op = XOR;
       
       #5 ALU_in1 = 16'hF5A1;
       ALU_in2 = 16'h17CF;
       #5 op = ADD;
       #5 op = SUB;
       #5 op = NAND;
       #5 op = XOR;
       
       #5 ALU_in1 = 16'h8000;
       ALU_in2 = 16'h8000;
       #5 op = ADD;
       #5 op = SUB;
       #5 op = NAND;
       #5 op = XOR;
       
       #10
       ALU_in1 = 16'h0000;
       ALU_in2 = 16'h0000;
       #5 op = ADD;
       #5 op = SUB;
       #5 op = NAND;
       #5 op = XOR;
       
       #5 op = SUB;
       ALU_in1 = 16'h0800;
       ALU_in2 = 16'h0001;
       #5;
       /*
       for(i = 0; i < 17'h10000; i = i + 5) begin
           ALU_in1 = ALU_in1 + 25;
           for(j = 0; j < 17'h10000; j = j + 5) begin
               #1 ALU_in2 = ALU_in2 + 25;
           end
           ALU_in2 = 0;
       end
       */
       ALU_in1 = 16'hF800;
       ALU_in2 = 16'h0001;
       #5;
       
       ALU_in1 = 16'h0003;
       ALU_in2 = 16'h0002;
       #5;
       
       ALU_in1 = 16'h0002;
       ALU_in2 = 16'h0003;
       #5;
       
       ALU_in1 = 16'h7fff;
       ALU_in2 = 16'hC001;
       #5;
       
       $stop;
   end
endmodule
       
       