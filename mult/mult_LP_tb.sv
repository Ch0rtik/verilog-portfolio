`timescale 1ns/1ns
module mult_LP_tb ();
	localparam T = 10;
	reg [7:0] dA, dB;
	wire [15:0] a_mult_b;
	reg clk;
	
	integer i, j;
	
	initial begin
		clk = 1'd1;
		dA = 4'd0;
		dB = 4'd0;
	end
	
	always
		#T clk =~clk;
		
	always begin
		i = 0;
		j = 0;
		#(2*T);
		for(i = 0; i < 256; i = i + 1) begin
			dA = i;
			$display("A = ", dA);
			for (j = 0; j < 256; j = j +1) begin
				dB = j;
				#(20*T);
				if (a_mult_b == i * j)
					$display("Test B = %d passed", j);
				else
					$display("!!!Test not passed!!! Expected: %d, Actual: %d", (i * j), a_mult_b);
			end
		end
		$stop;	
	end
	
	mult_LP_V3 #(8) mult_L_inst (clk, dA, dB, a_mult_b);
endmodule
