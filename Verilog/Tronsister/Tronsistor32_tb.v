`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:58:17 11/17/2015 
// Design Name: 
// Module Name:    Tronsistor_CPU_tb 
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

module Tronsistor32_tb();

reg clk_in,rst_in;

wire clk_out;
wire rst_out;

wire [31:0] data_out;
wire [31:0] MemAddr;
wire [31:0] NON_ALU;

wire [11:0] D;
wire hsync, vsync, blank, dvi_rst, scl_tri, sda_tri;

reg keyboard_intr;

//////////////////////
// Instantiate CPU //
////////////////////
// Instantiate the module
Tronsistor32 tronsistor (
    .clk_100mhz(clk_in), 
    .rst(rst_in),
    .hsync(hsync), 
    .vsync(vsync), 
    .blank(blank), 
    .clk(clk), 
    .clk_n(clk_n), 
    .D(D), 
    .dvi_rst(dvi_rst), 
    .scl_tri(scl_tri), 
    .sda_tri(sda_tri), 
    .data_out(data_out), 
    .MemAddr(MemAddr), 
    .NON_ALU(NON_ALU)
    );
	
initial begin
	clk_in = 1;
	rst_in = 1;
	keyboard_intr = 1'b0;
	
repeat(20)@(posedge clk_in);

	rst_in = 0;

	

end

//INIT CLOCK
initial begin
  forever #5 clk_in = ~clk_in; 
end

initial begin #1000000000; $stop; end

endmodule
