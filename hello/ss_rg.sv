module ss_rg (
	input clk, rst_ni,
	input [6:0] ssi,
	output reg [6:0] ss
);

	always @(posedge clk) begin
		if(!rst_ni)
			ss <= 7'h00;
		else
			ss <= ssi;
	end

endmodule
