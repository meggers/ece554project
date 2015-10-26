
`define MAX32POS 2147483647
`define MIN32NEG 2147483648
`define MAX16POS 32767
`define MIN16NEG -32768
`define OVERFLOWVAL 21494836


module ALU_tbALL();


longint ALU_out_gold;
int i, j;


reg [31:0] ALU_in1, ALU_in2; //input values to ALU
reg [5:0] op;
wire N, Z, V;
wire [31:0] ALU_out;
reg [31:0] ALU_out_gold1;
wire fail_sum, fail_V;
reg clk;
reg passed;
reg rst;

reg gold_V;

typedef enum reg[1:0]{NEG_NEG, NEG_POS, POS_NEG, POS_POS}state_t;
state_t state;

ALU alu1(.N(N), .Z(Z), .V(V), .ALU_in1(ALU_in1), .ALU_in2(ALU_in2), .ALU_out(ALU_out), .op(op));

assign fail_sum = (ALU_out_gold[31:0] != ALU_out) ? 1'b1 : 1'b0;
assign fail_V = ~(gold_V == V);

//assign gold_V = (op == 6'h02) ? (((ALU_in1 < ALU_in2) & ALU_out[31])


//Self Checking for overflow
always@(*) begin
	if(op == 6'h02) begin
		if(~ALU_in1[31] & ~ALU_in2[31]) begin
			gold_V = (((ALU_in1 < ALU_in2)&~ALU_out[31]) || ((ALU_in1 > ALU_in2)&ALU_out[31]));
			state = POS_POS;
		end
		else if(~ALU_in1[31] & ALU_in2[31]) begin
			gold_V = ALU_out[31];	
			state = POS_NEG;
		end
		else if(ALU_in1[31] & ~ALU_in2[31])begin
			gold_V = ~ALU_out[31];
			state = NEG_POS;
		end
		else if(ALU_in1[31] & ALU_in2[31])begin
			gold_V = (((ALU_in1 < ALU_in2)&~ALU_out[31]) || ((ALU_in1 > ALU_in2)&ALU_out[31]));
			state = NEG_NEG;
		end
	end
	else if(op == 6'h03) begin
		gold_V = gold_V;
	end
	else begin
	end
end

always@(posedge clk, posedge rst)begin
	if(rst)
		passed <= 1;	
	else if(fail_sum || fail_V)
		passed <= 0;
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


/////////
// ADD // -----PASSED
/////////
//add_validPOSinputs();
//add_validNEGinputs();
//add_invalidinputs(); -- doesnt work


/////////
// SUB //------PASSED
/////////
//sub_validPOSinputs();
//sub_validNEGinputs();
//sub_validPOSNEGinputs();
//sub_invalidinputs(); --doesnt work
//sub_hardcoded(); -- should fail this


//////////
// NAND //-------PASSED
//////////
//nand_test();


/////////
// AND //--------PASSED
/////////
//and_test();


/////////
// SRL //--------PASSED
/////////
//srl_test();


/////////
// SLL //--------PASSED
/////////
//sll_test();

/////////
// XOR //--------PASSED
/////////
xor_test();


if(passed)
	$display("Passed");
else 
	$display("Failed");
$stop;
end





////////////////////////
/////// TASKS //////////
////////////////////////

///////ADD and ADDI///////////

//Inputs all valid values
task add_validPOSinputs;	
begin
op = 6'h20;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= `MAX32POS) && (i >=0)); i= i + 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j <= `MAX32POS) && (j >=0)); j = j + 50000) begin
		ALU_in2 = j;
		ALU_out_gold = i+j;
		#2;
	end
end
end
endtask


//NEG INPUTS
task add_validNEGinputs;	
begin
op = 6'h20;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i >= (-`MIN32NEG)) && (i <=0)); i= i - 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j >= (-`MIN32NEG)) && (j <=0)); j = j - 50000) begin
		ALU_in2 = j;
		ALU_out_gold = i+j;
		#2;
	end
end
end
endtask


task add_invalidinputs;	
begin

op = 6'h20;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= (1.5*`MAX32POS)) && (i >=0)); i= i +50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j <= (`MAX32POS+100000)) && (j >=0)); j = j + 50000) begin
		ALU_in2 = j;
		ALU_out_gold = i+j;
		#2;
	end
end
end
endtask

/////////////////END ADD/////////////////////////////



///////////////////SUB///////////////////////

task sub_validPOSinputs;	
begin
op = 6'h22;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= `MAX32POS) && (i >=0)); i= i + 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j <= `MAX32POS) && (j >=0)); j = j + 50000) begin
		ALU_in2 = j;
		ALU_out_gold = i-j;
		#2;
	end
end
end
endtask


//NEG INPUTS
task sub_validNEGinputs;	
begin
op = 6'h22;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i >= (-`MIN32NEG)) && (i <=0)); i= i - 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j >= (-`MIN32NEG)) && (j <=0)); j = j - 50000) begin
		ALU_in2 = j;
		ALU_out_gold = i-j;
		#2;
	end
end
end
endtask



task sub_validPOSNEGinputs;	
begin
op = 6'h22;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= `MAX32POS) && (i >=0)); i= i + 50_000_000) begin
	ALU_in1 = i;
	for(j=-5000000; ((j <= `MAX32POS)); j = j + 50000) begin
		ALU_in2 = j;
		ALU_out_gold = i-j;
		#2;
	end
end
end
endtask



task sub_invalidinputs;	
begin
op = 6'h22;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= (1*`MAX32POS)) && (i >=0)); i= i +50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j <= (`MAX32POS+100000)) && (j >=0)); j = j + 50000) begin
		ALU_in2 = j;
		ALU_out_gold = i-j;
		#2;
	end
end
end
endtask



task sub_hardcoded;
begin
op = 6'h22;
ALU_in1 = `MIN32NEG;
ALU_in2 = `MAX32POS;
#2;
while(ALU_in2 != -100_000) begin
	ALU_in2 = ALU_in2-50_000;
	#2;
end

end
endtask


//////////////////////////////
//****** NAND TESTS ********//
//////////////////////////////

task nand_test; begin
op = 6'h23;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= `MAX32POS) && (i >=0)); i= i + 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j <= `MAX32POS) && (j >=0)); j = j + 50000) begin
		ALU_in2 = j;
		ALU_out_gold = ~(i&j);
		#2;
	end
end

end
endtask


//////////////////////////////
//****** AND TESTS *********//
//////////////////////////////

task and_test; begin
op = 6'h24;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= `MAX32POS) && (i >=0)); i= i + 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j <= `MAX32POS) && (j >=0)); j = j + 50000) begin
		ALU_in2 = j;
		ALU_out_gold = (i&j);
		#2;
	end
	for(j=0; ((j >= (-`MIN32NEG)) && (j <=0)); j = j - 50000) begin
		ALU_in2 = j;
		ALU_out_gold = (i&j);
		#2;
	end
end

for(i=0; ((i >= (-`MIN32NEG)) && (i <=0)); i= i - 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j >= (-`MIN32NEG)) && (j <=0)); j = j - 50000) begin
		ALU_in2 = j;
		ALU_out_gold = (i&j);
		#2;
	end
end

end
endtask


//////////////////////////////
//****** SRL TESTS *********//
//////////////////////////////

task srl_test; begin
op = 6'h26;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= `MAX32POS) && (i >=0)); i= i + 50_000_000) begin
	ALU_in1 = i;
	for(j=0; j<=32; j = j + 1) begin
		ALU_in2 = j;
		ALU_out_gold = (i>>j);
		#2;
	end
end

for(i=0; ((i >= (-`MIN32NEG)) && (i <=0)); i= i - 50_000_000) begin
	ALU_in1 = i;
	for(j=0; j<=32; j = j + 1) begin
		ALU_in2 = j;
		ALU_out_gold = (i>>j);
		#2;
	end
end

end
endtask


//////////////////////////////
//****** SLL TESTS *********//
//////////////////////////////

task sll_test; begin
op = 6'h27;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= `MAX32POS) && (i >=0)); i= i + 50_000_000) begin
	ALU_in1 = i;
	for(j=0; j<=32; j = j + 1) begin
		ALU_in2 = j;
		ALU_out_gold = (i<<j);
		#2;
	end
end

for(i=0; ((i >= (-`MIN32NEG)) && (i <=0)); i= i - 50_000_000) begin
	ALU_in1 = i;
	for(j=0; j<=32; j = j + 1) begin
		ALU_in2 = j;
		ALU_out_gold = (i<<j);
		#2;
	end
end

end
endtask



//////////////////////////////
//****** XOR TESTS *********//
//////////////////////////////

task xor_test; begin
op = 6'h28;
ALU_in1 = 0;
ALU_in2 = 0;
for(i=0; ((i <= `MAX32POS) && (i >=0)); i= i + 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j <= `MAX32POS) && (j >=0)); j = j + 50000) begin
		ALU_in2 = j;
		ALU_out_gold = (i^j);
		#2;
	end
	for(j=0; ((j >= (-`MIN32NEG)) && (j <=0)); j = j - 50000) begin
		ALU_in2 = j;
		ALU_out_gold = (i^j);
		#2;
	end
end

for(i=0; ((i >= (-`MIN32NEG)) && (i <=0)); i= i - 50_000_000) begin
	ALU_in1 = i;
	for(j=0; ((j >= (-`MIN32NEG)) && (j <=0)); j = j - 50000) begin
		ALU_in2 = j;
		ALU_out_gold = (i^j);
		#2;
	end
end

end
endtask
endmodule


