`timescale 1ns/100ps
module tb_PWM();
localparam T = 10;

	reg 			tb_clk;
	reg 			tb_reset;
	reg [7:0] 	tb_in;
	wire 			tb_out;
	
	PWM DUT (
		.CLK		(tb_clk),
		.aRSTin	(tb_reset),
		.Din 		(tb_in),
		.PWM		(tb_out)
	);
	
	initial begin
		tb_clk = 1'b0;
		tb_reset = 1'b1;
		#(10*T) tb_reset = 0;
		
		#(384*T) tb_in = 8'd32;
		#(384*T) tb_in = 8'd64;
		#(760*T) tb_in = 8'd192;
		#(512*T) $stop;
	end

	always #T tb_clk = ~tb_clk;
	
endmodule
