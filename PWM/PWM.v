module PWM
(input CLK,
 input aRSTin,
 input [7:0] Din,
 output reg PWM);
 
	wire t_cout, t_pwm;
	reg [7:0] Dint;
	wire [7:0] Dcnt;
	reg t_rst, arst;
 
	always@(posedge CLK, posedge aRSTin)
	begin
		if(aRSTin) begin
			t_rst <= 1'b1;
			arst 	<= 1'b1;
		end else begin
			t_rst <= 1'b0;
			arst 	<= t_rst;
		end
	end
	
	CNT CNT_inst (
		.clock(CLK),
		.aclr	(arst),
		.q		(Dcnt),
		.cout	(t_cout)
	);
	
	always@(posedge CLK, posedge arst)
		if(arst)
			Dint <= 8'h0;
		else if(t_cout)
				Dint <= Din;
	
	CMP CMP_inst (
		.dataa(Dint),
		.datab(Dcnt),
		.alb	(t_pwm)
	);
	
	always@(posedge CLK, posedge arst)
	begin
		if(arst)
			PWM <= 1'b1;
		else
			PWM <= t_pwm;
	end
	
endmodule
