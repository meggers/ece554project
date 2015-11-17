module Memory(clk,instr_addr,re1,we1,wrt_data1, rd_data1, //instr mem information
		data_addr,re2,we2,wrt_data2, rd_data2);	//data mem information

/////////////////////////////////////////////////////////
// Data memory.  Single ported, can read or write but //
// not both in a single cycle.  Precharge on clock   //
// high, read/write on clock low.                   //
/////////////////////////////////////////////////////
input clk;
input [11:0] data_addr, instr_addr;
input re1, re2;				// asserted when instruction read desired
input we1, we2;				// asserted when write desired
input [31:0] wrt_data1, wrt_data2;	// data to be written

output reg [31:0] rd_data1, rd_data2;	//output of data memory

reg [31:0]instr_mem[0:1023];
reg [31:0]data_mem[0:3072];

/***********************/
/****** instr mem ******/
/***********************/

///////////////////////////////////////////////
// Model read, data is latched on clock low //
/////////////////////////////////////////////

always @(instr_addr,re1,clk)
  if (~clk && re1 && ~we1)
    rd_data1 <= instr_mem[instr_addr];
	
////////////////////////////////////////////////
// Model write, data is written on clock low //
//////////////////////////////////////////////
always @(instr_addr,we1,clk)
  if (~clk && we1 && ~re1)
    instr_mem[instr_addr] <= wrt_data1;


/***********************/
/****** data mem *******/
/***********************/

///////////////////////////////////////////////
// Model read, data is latched on clock low //
/////////////////////////////////////////////

always @(data_addr,re2,clk)
  if (~clk && re2 && ~we2)
    rd_data2 <= data_mem[data_addr];
	
////////////////////////////////////////////////
// Model write, data is written on clock low //
//////////////////////////////////////////////
always @(data_addr,we2,clk)
  if (~clk && we2 && ~re2)
    data_mem[data_addr] <= wrt_data2;

initial begin
  $readmemh("instr.hex",instr_mem);
end


endmodule