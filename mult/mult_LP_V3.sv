module mult_LP_V3 #(parameter w = 8) (
	input clk,
	input [w-1:0] dA, dB,
	output reg [2*w-1:0] a_mult_b
	);
  
	reg [w-1:0] A [w:0],B [w:0];
	reg [2*w-1:0] dSUM [w:0];
	integer j;
	
	initial
		begin : var_init
			for (j = 0; j <= w; j++)
				begin
					dSUM[j] = {(2*w) {1'b0}};
					A[j] = {(w) {1'b0}};
					B[j] = {(w) {1'b0}};
				end
			a_mult_b  = {(2*w) {1'b0}};
		end
  
	function [2*w-1:0] SUM_MUX(
		input [w-1:0] di,
		input [2*w-1:0] dS,
		input sel);
			begin
				case (sel)
					1'b0: SUM_MUX = {1'b0, dS[2*w-1:1]};
					1'b1: SUM_MUX = {1'b0, {1'b0, dS[2*w-1:1]} +  {1'b0, di, {(w-1) {1'b0}}}};
				endcase																			 	
			end
	endfunction
 
	always @(posedge clk)
		{A[0], B[0]} <= {dA, dB};

	genvar i;
	
	generate
		for (i = 0; i <= w-1; i = i + 1)
			begin: u
				always @(posedge clk)
					begin
						dSUM[i+1] <= SUM_MUX(A[i], dSUM[i], B[i][i]);
						B[i+1] <= B[i];
						A[i+1] <= A[i];
					end
			end
	endgenerate

	always @(posedge clk)
		a_mult_b <= dSUM[w];

endmodule
