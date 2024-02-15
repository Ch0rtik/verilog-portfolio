module cnt_div #(
  parameter N = 10000
)(
  input clk, rst_ni,
  output reg ENA
);

  reg [31:0] count;
  
  initial begin
		count <= 0;
		ENA <= 0;
  end

	always @(posedge clk) begin
		if (rst_ni) begin
			count <= count + 16'h0001;
			if (count == (N-1)) begin
				ENA <= 1;
				count <= 0;
			end else 
				ENA <= 0;
		end else 
			count <= 0;
	end

endmodule
