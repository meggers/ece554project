module Hazard_detect_tb();

	reg clk;
	reg rst;

	//data hazard detect
	reg [5:0] opcode;
	reg RegWrite;
	reg ALU_logic; //all arithmetic logical and shift operations
	reg load;
	reg pop_push;
	
	//control hazard detect
	reg call;
	reg ret;
	reg branch;
	//input pop;
	reg and_add_imm;

	//register address
	reg [4:0] R_type_rd;
	reg [4:0] R_I_type_rt_rd; 
	reg [4:0] R_I_type_rs;

	//Register read information
	reg [4:0] rd_addr1;
	reg [4:0] rd_addr2;
	reg rd_en1;
	reg rd_en2;

	//clear signals for control hazards
	reg clr_ret_haz;
	reg clr_call_haz;
	reg clr_branch_haz;

	wire data_hazard;
	wire control_hazard;

	//For testing
	reg data_hazard_gold;

Hazard_detect h_detect(.clk(clk), .rst(rst), .opcode(opcode), .RegWrite(RegWrite), .ALU_logic(ALU_logic), .load(load), .pop_push(pop_push), .call(call), .ret(ret), .and_add_imm(and_add_imm), 
			.R_type_rd(R_type_rd), .R_I_type_rt_rd(R_I_type_rt_rd), .R_I_type_rs(R_I_type_rs), .rd_addr1(rd_addr1), .rd_addr2(rd_addr2), .rd_en1(rd_en1), .rd_en2(rd_en2), .clr_ret_haz(clr_ret_haz),
			.clr_branch_haz(clr_branch_haz), .clr_call_haz(clr_call_haz), .data_hazard(data_hazard), .control_hazard(control_hazard));

initial begin
initialize();

ALU_hazardDetect();	//ALU TEST-------------PASSED
call = 1;
@(posedge clk);
call = 0;
@(posedge clk);
@(posedge clk);
@(posedge clk);
@(posedge clk);
clr_call_haz = 1;
@(posedge clk);
@(posedge clk);
$stop;

end


/**********TASKS********/
////////////////////////////////////
////////  TASK - initialize  ///////
////////////////////////////////////
task initialize;
begin
clk = 0;
rst = 1;
RegWrite = 0;
ALU_logic = 0;
load = 0;
pop_push = 0;
call = 0;
ret = 0;
branch = 0;
and_add_imm = 0;
R_type_rd = 0;
R_I_type_rt_rd = 0;
R_I_type_rs = 0;
rd_addr1 = 0;
rd_addr2 = 0;
rd_en1 = 0;
rd_en2 = 0;
clr_ret_haz = 0;
clr_call_haz = 0;
clr_branch_haz = 0;
@(posedge clk);
rst = 0;
@(posedge clk);
end
endtask



/////////////////////////////////
////////  TASK - ALU haz  ///////
/////////////////////////////////

task ALU_hazardDetect;
begin

ALU_logic = 1;
R_type_rd = 5'h02;
RegWrite = 1;
data_hazard_gold = 0;
@(posedge clk);
// 1
ALU_logic = 1;
R_type_rd = 5'h00;
RegWrite = 0;
rd_en1 = 1;
rd_addr1 = 5'h02;
data_hazard_gold = 1;
@(posedge clk);
//2
@(posedge clk);
//3
@(posedge clk);
//4
@(posedge clk);
//5
data_hazard_gold = 0;

@(posedge clk);
/** should not create hazard ***/
//alu operation
ALU_logic = 1;
R_type_rd = 5'h01;
RegWrite = 1;
//read reg 2
rd_addr1 = 5'h01;
rd_en1 = 1;
data_hazard_gold = 0;
@(posedge clk);
//1
/** should create hazard ***/
ALU_logic = 0;
R_type_rd = 5'h01;
RegWrite = 0;
//read reg 2
rd_addr1 = 5'h01;
rd_en1 = 1;
data_hazard_gold = 1;
@(posedge clk);
//2
data_hazard_gold = 1;
@(posedge clk);
//3
data_hazard_gold = 1;
@(posedge clk);
//4
data_hazard_gold = 1;
@(posedge clk);
data_hazard_gold = 0;
@(posedge clk);



/** should not create hazard ***/
//alu operation
ALU_logic = 1;
R_type_rd = 5'h04;
RegWrite = 1;
//read reg 2
rd_addr1 = 5'h06;
rd_en1 = 1;
data_hazard_gold = 0;
@(posedge clk);
/** should not create hazard ***/
ALU_logic = 1;
R_type_rd = 5'h03;
RegWrite = 1;
//read reg 2
rd_addr1 = 5'h06;
rd_en1 = 1;
data_hazard_gold = 0;

@(posedge clk);
RegWrite = 0;
rd_addr2 = 5'h04;
rd_en2 = 1;
rd_en1 = 0;
data_hazard_gold = 1;
@(posedge clk);
//3
data_hazard_gold = 1;
@(posedge clk);
//4
data_hazard_gold = 1;
@(posedge clk);
data_hazard_gold = 0;
repeat(10)@(posedge clk);
end
endtask


always
	#2 clk = ~clk;

endmodule;