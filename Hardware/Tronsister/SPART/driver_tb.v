module driver_tb();
    
    	reg clk;
    	reg rst;
    	reg [1:0] br_cfg;
    	reg rda;
    	reg tbr;
	reg [7:0] dummy_databus;

    	wire iocs;
    	wire iorw;
    	wire [1:0] ioaddr;
    	wire [7:0] databus;

    	driver iDUT (.clk(clk) , .rst(rst), .rda(rda), .tbr(tbr), .br_cfg(br_cfg),
		     .iocs(iocs), .iorw(iorw), .ioaddr(ioaddr), .databus(databus));

	assign databus = (rda == 1) ? dummy_databus : 8'hZ;

    	initial begin
       
       		/* Initialize inputs */
       		clk = 0;
		br_cfg = 2'b10;
		rst = 1;

		#5;

		rst = 0;

		#20;

		rda = 1;
		tbr = 1;
		dummy_databus = 8'hDE;

		#1;

		rda = 0;
		tbr = 0;

		#20;

       		rda = 1;
		tbr = 1;
		dummy_databus = 8'hAD;

		#1;

		rda = 0;
		tbr = 0;

		#5;

		br_cfg = 2'b10;
		rst = 1;

		#5;

		rst = 0;

		#20;

		rda = 1;
		tbr = 1;
		dummy_databus = 8'hF0;

		#1;

		rda = 0;
		tbr = 0;

		#20;

       		rda = 1;
		tbr = 1;
		dummy_databus = 8'h0D;

		#1;

		rda = 0;
		tbr = 0;

        	$stop; 
        
   	end
    
    	always begin
        	#1 clk = ~clk;
    	end
        
endmodule
