module rst_rg (
  input clk,
  input rst_n,
  output reg rst_ni
);

	reg rst_n_;

	always @(posedge clk) begin
		rst_n_ <= rst_n;
		rst_ni <= rst_n_;
	end

endmodule
