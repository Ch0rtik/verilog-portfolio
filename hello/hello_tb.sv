`timescale 10ns / 10ns
module hello_tb();
	
	localparam T = 10;
	reg clk, rst_n;
	reg [6:0] ss;
	reg [4:1] dig;
	reg [7:0] sw;
	reg [6:0] tb_mem[0:127];
	wire [6:0] tb_ss;
	
	hello #(100) hello_inst (clk, rst_n, sw, ss, dig);
	
	initial begin
		$readmemb ("ss_to_ascii.txt", tb_mem);
		sw = 8'h00;
		clk = 1'b1;
		rst_n = 1'b1;
		forever #(T/2) clk = ~clk;
	end
	
	initial begin
		#(15000*T)
		sw = 8'b00010000;
		#(15000*T)
		rst_n = 1'b0;
		#(5000*T)
		rst_n = 1'b0;
		#(5000*T)
		$stop;
	end
	
	assign tb_ss = tb_mem[ss];
	
endmodule
