module d_rg (
  input clk, rst_ni,
  input [4:0] A, B, C, D,
  output reg [4:0] Ai, Bi, Ci, Di
);

	always @(posedge clk) begin
		if (rst_ni == 0) begin
			Ai <= 5'b0;
			Bi <= 5'b0;
			Ci <= 5'b0;
			Di <= 5'b0;
		end
		else begin
			Ai <= A;
			Bi <= B;
			Ci <= C;
			Di <= D;
		end
	end

endmodule
