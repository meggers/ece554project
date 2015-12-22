module Reg_32bit(clk, en, d, q);
    
    input clk, en;
    input [31:0] d;
    
    output reg [31:0] q;
    
    always @(posedge clk) begin  
        if (en)
           q <= d;    
        else
           q <= q;
    end
    
endmodule
