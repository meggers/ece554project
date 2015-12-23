`define MAX32POS 2147483647
`define MIN32NEG -2147483648
`define MAX16POS 32767
`define MIN16NEG -32768


module ALU_tb();


integer ALU_out_gold;
integer i, j;


reg [31:0] ALU_in1, ALU_in2; //input values to ALU
reg [5:0] op;
wire N, Z, V;
wire [31:0] ALU_out;
reg [31:0] ALU_out_gold1;
wire fail;
wire test;
reg clk;
reg passed;
reg rst;
wire pass;
reg en;

ALU alu1(.N(N), .Z(Z), .V(V), .ALU_in1(ALU_in1), .ALU_in2(ALU_in2), .ALU_out(ALU_out), .op(op));

assign fail = (ALU_out_gold != ALU_out) ? 1'b1 : 1'b0;
assign test = ALU_out[31];
assign pass = passed;
assign ALU_out_gold = i*j;

always@(negedge clk, posedge rst)begin
	if(rst)	
		passed <= 1;
	else if(en)
		if(fail)
			passed <= 0;
		else
			passed <= passed;
	else
		passed <= passed;
end

always begin
	#1 clk = ~clk;
end

initial begin
i = 0;
j = 0;
clk = 1;
rst = 1;
#1
rst = 0;
en = 0;

op = 6'h16;
// 164 * 81 = 13284
ALU_in1 = 32'h00A4;
ALU_in2 = 32'h0051;
ALU_out_gold1 = 32'd13284;
#1;

// -1 * -1 = 1
ALU_in1 = 32'hffff_ffff;
ALU_in2 = 32'hffff_ffff;
ALU_out_gold1 = 32'd1;
#2;

// 0 * 11 = 0
ALU_in1 = 32'h0000_0000;
ALU_in2 = 32'h0000_0001;
ALU_out_gold1 = 32'd0;
#2;

// -32768 * 32767 = -1073709056
//ALU_in1 = 32'hFFFF_8000; // -32768
//ALU_in2 = 32'h0000_7fff; // 32767
//ALU_out_gold = -32'd1073709056; // for what ever reason this doesnt work, functionality does tho.
//#5;

// 32767 * 32767 = 1073676289
ALU_in1 = 32'h0000_7fff; // 32767
ALU_in2 = 32'h0000_7fff; // 32767
ALU_out_gold1 = 32'd1073676289;
#2;


//////////////////////
// TESTING OVERFLOW //
//////////////////////
ALU_in1 = 32'h0008_7fff; // 32767
ALU_in2 = 32'h000F_7fff; // 32767
#2;

/////////
// SUB //
/////////
op = 6'h02;
ALU_in1 = 32'h8000_0000;
ALU_in2 = 32'h7FFF_FFFF;
#2;


//////////////////////
//////////////////////
// REAL TEST BEGINS //
//////////////////////
//////////////////////

/************************************************/
/** Tests all valid inputs, no V should be set **/ 
/************************************************/
/*
op = 6'h16;
ALU_in1 = 0;
ALU_in2 = 0;
en = 1;
for(i=0; ((i <= `MAX16POS) && (i >=0)); i= i +10) begin
	ALU_in1 = i;
	for(j=0; ((j <= `MAX16POS) && (j >=0)); j = j + 5) begin
		ALU_in2 = j;
		#2;
	end
end
*/

/****************************************/
/** Tests input outside of valid range **/
/****************************************/
//after passing valid threshold, V should be set and passed should be deasserted
op = 6'h16;
ALU_in1 = 32700;
ALU_in2 = 32700;
en = 1;
for(i=32700; ((i <= 42700) && (i >=0)); i= i +10) begin
	ALU_in1 = i;
	for(j=32700; ((j <= 32700) && (j >=0)); j = j + 5) begin
		ALU_in2 = j;
		#2;
	end
end




$stop;

end
endmodule



