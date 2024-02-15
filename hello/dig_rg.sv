module dig_rg (
	input clk, rst_ni,
	input [4:1] digi,
	output reg [4:1] dig
);

	always @(posedge clk) begin
		if(!rst_ni)
			dig <= 4'h0;
		else
			dig <= digi;
	end

endmodule
