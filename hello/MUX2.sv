module MUX2 #(
  parameter N = 5
)(
	input [1:0] sel,
	input [(N-1):0] Ai, Bi, Ci, Di,
	output reg [(N-1):0] mo
);
	
	always @* begin
		case (sel)
			2'b00:	mo <= Di;
			2'b01:	mo <= Ci;
			2'b10:	mo <= Ai;
			2'b11:	mo <= Bi;
		endcase
	end

endmodule