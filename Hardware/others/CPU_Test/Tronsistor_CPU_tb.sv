`include "Tronsistor_CPU.v"

module Tronsistor_CPU_tb();

reg clk,rst;

//////////////////////
// Instantiate CPU //
////////////////////
Tronsistor_CPU iCPU(.clk(clk), .rst(rst));

initial begin
	clk = 0;
	rst = 1;

	@(posedge clk);
	@(negedge clk);

	rst = 0;

	#200;

end

//INIT CLOCK
initial begin
  forever #5 clk = ~clk; 
end

endmodule
