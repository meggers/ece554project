module BRG_tb();
    
    	reg clk;
    	reg load;
    	reg [15:0] DB_data;

    	wire enable;

	reg [5:0] count;
    
    	BRG iDUT( .clk(clk), .load(load), .DB_data(DB_data), .enable(enable) );

    	initial begin
       
       		/* Initialize inputs */
       		clk = 0;
		DB_data = 16'h028C;
		load = 1;
		count = 0;

		#1;

		load = 0;

		while (count < 16) begin

			@(posedge enable) count = count + 1;

		end
       
        	$stop; 
        
   	end
    
    	always begin
        	#5 clk = ~clk;
    	end
        
endmodule