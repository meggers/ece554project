module reg_file_tb();
   logic [15:0] p0, p2; 
   logic [15:0] dst; 
   logic [3:0] p0_addr, p1_addr, dst_addr;
   logic WE, clk, re0, re1;

   logic [16:0] i;
   
   reg_file r_file(.p0(p0), .p2(p2), .re0(re0), .re1(re1), .p0_addr(p0_addr), .p1_addr(p1_addr), .dst_addr(dst_addr), .dst(dst), .WE(WE), .clk(clk));
                     
   initial begin
   //initialize signals
   clk = 0;
   dst = 0;
   p0_addr = 0;
   p1_addr = 0;
   dst_addr = 0;
   WE = 0;
   re0 = 0;
   re1 = 0;
   i = 0;
   

   while(i <= 16) begin
       #10 dst_addr = i;
       i = i + 1;
       dst= i[3:0];
       WE = 1;
   end
   
   i = 0;
   WE = 0;
   while(i <= 16) begin   
       #10 p0_addr = i;
       i = i + 1; 
       p1_addr = i;
   end

   i = 0;
   WE = 0;
   re0 = 1;
   while(i <= 16) begin   
       #10 p0_addr = i;
       i = i + 1; 
       p1_addr = i;
       if(i>7)
	   re1 = 1;
   end
       
$stop;
   end
   
   always begin
       #5 clk = ~clk;
   end
endmodule
