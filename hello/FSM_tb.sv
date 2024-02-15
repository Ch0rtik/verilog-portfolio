`timescale 1ns / 1ns
module FSM_tb();
	
	localparam T = 10;
	
	reg clk, ENA, rst_ni, test_passed;
	reg [1:0] sel;
	reg [4:1] digi;
	
	FSM FSM_inst (clk, ENA, rst_ni, sel, digi);
	
	reg [1:0] corr_sel [3:0];
	reg [4:1] corr_digi [3:0];
	
	integer i = 0;
	
	initial begin
		corr_sel[0] = 00;
		corr_sel[1] = 01;
		corr_sel[2] = 11;
		corr_sel[3] = 10;
		
		corr_digi[0] = 4'b0001;
		corr_digi[1] = 4'b0010;
		corr_digi[2] = 4'b0100;
		corr_digi[3] = 4'b1000;
	end
	
	initial begin
		clk = 1'b1;
		rst_ni  = 1'b1;
		ENA = 1'b1;
		forever #(T/2) clk = ~clk;
	end
	
	initial begin
		for (i = 0; i < 4; i = i + 1) begin
			#(T);
			test_passed = (sel == corr_sel[i]) & (digi == corr_digi[i]);
			if(test_passed)
				$display("Test %d passed", i);
			else begin
				$display("Test %d not passed", i);
				
				$display("Given sel: %d", sel);
				$display("Correct sel: %d", corr_sel[i]);
				
				$display("Given digi: %d", digi);
				$display("Correct digi: %d", corr_digi[i]);
			end
		end
		#(T*3)
		rst_ni = 1'b0;
		#(T)
		if((sel == corr_sel[0]) & (digi == corr_digi[0]))
			$display("Reset test passed");
		else begin
			$display("Reset test not passed");
			$display("Given sel: %d", sel);
			$display("Correct sel: %d", corr_sel[0]);
			
			$display("Given digi: %d", digi);
			$display("Correct digi: %d", corr_digi[0]);
		end
		$stop;
	end
	
	
endmodule
