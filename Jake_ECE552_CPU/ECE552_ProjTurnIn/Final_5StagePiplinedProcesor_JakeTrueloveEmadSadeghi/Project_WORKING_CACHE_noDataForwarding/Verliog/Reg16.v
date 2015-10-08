module Reg16(bus_out, regWrite, bus_in, clk);
   input regWrite, clk;
   input [15:0] bus_in;
   
   output reg [15:0] bus_out;
   
   always @(posedge clk)
      if(regWrite)
         bus_out <= bus_in;
      else
         bus_out <= bus_out;
         
 endmodule
         
