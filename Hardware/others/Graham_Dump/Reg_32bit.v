`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:53:40 11/13/2015 
// Design Name: 
// Module Name:    Reg_32bit 
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
