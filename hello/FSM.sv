module FSM (
	input clk, ENA, rst_ni,
	output reg [1:0] sel,
	output reg [4:1] digi
);

	reg [1:0] state;
 
	parameter S0 = 0, S1 = 1, S2 = 2, S3 = 3;
 
	always @(posedge clk, negedge rst_ni) begin
		if (!rst_ni)
			state <= S0;
		else if (ENA) begin
			case (state)
				S0:	state <= S1;
				S1:	state <= S2;
				S2:	state <= S3;
				S3:	state <= S0;
			endcase
		end
	end
	
	always @(state) begin
		case (state)
			S0:	begin
						sel = 2'b00;
						digi = 4'b0001;
					end
			S1: 	begin
						sel = 2'b01;
						digi = 4'b0010;
					end
			S2: 	begin
						sel = 2'b11;
						digi = 4'b0100;
					end
			S3:	begin
						sel = 2'b10;
						digi = 4'b1000;
					end
		endcase
	end
	
	initial begin
		state <= S0;
	end
endmodule
