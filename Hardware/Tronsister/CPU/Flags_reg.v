`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:00:54 11/13/2015 
// Design Name: 
// Module Name:    Flags_reg 
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

module Flags_reg(clk, en, d, q, rst);
    
    input clk, en, rst;
    
    /* Z (zero), V (overflow), N (sign) */
    input [2:0] d;
    
    output reg [2:0] q;
    
    always @(posedge clk, posedge rst) begin  
        if(rst)
			  q <= 3'b000;
		  else if (en)
           q <= d;    
        else
           q <= q;
    end
    
endmodule
