module FF_unit
#(parameter W = 1) 
(
	input bit clk,
	input bit reset,
	input bit [W-1:0] source,
	output bit [W-1:0] out
);
	bit [W-1:0] source_n;

	always_ff@(posedge clk) begin
		if(reset) begin
			source_n <= '0;
			out <= '0;
		end else begin
			source_n <= source;
			out <= source_n;
		end
	end

endmodule
