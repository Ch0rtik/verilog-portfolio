module word_gen (
	input clk,
	input reset,
	input [7:0] sw,
	output reg [4:0] A, B, C, D);
	
	reg [4:0] hello_ROM [5:0];
	reg [4:0] goodbye_ROM [7:0];
	
	reg [4:0] world_ROM [6:0];
	
	reg [7:0] sw_new, sw_old; 
	
	reg [4:0] next;
	
	reg [7:0] i;
	
	reg read_first;
	
	reg switch_changed;
	wire res;
	
	reg [3:0] first_type;
	reg [3:0] second_type;
	
	initial begin
		hello_ROM[0] 	= 5'd16;
		hello_ROM[1] 	= 5'h0E;
		hello_ROM[2] 	= 5'd22;
		hello_ROM[3] 	= 5'd22;
		hello_ROM[4] 	= 5'h00;
		hello_ROM[5] 	= 5'd30;
		
		goodbye_ROM[0] = 5'd23;
		goodbye_ROM[1] = 5'h00;
		goodbye_ROM[2] = 5'h00;
		goodbye_ROM[3] = 5'h0D;
		goodbye_ROM[4] = 5'h0B;
		goodbye_ROM[5] = 5'd24;
		goodbye_ROM[6] = 5'h0E;
		goodbye_ROM[7] = 5'd30;
		
		world_ROM[0] 	= 5'd22;
		world_ROM[1] 	= 5'd18;
		world_ROM[2] 	= 5'h00;
		world_ROM[3] 	= 5'd20;
		world_ROM[4] 	= 5'd22;
		world_ROM[5] 	= 5'h0D;
		world_ROM[6] 	= 5'd30;
		
		i = 8'd0;
		
		read_first = 1'b1;
		
		A    <= 5'd30;
		B    <= 5'd30;
		C    <= 5'd30;
		D    <= 5'd30;
		next <= 5'd31;
		
		sw_new = 8'd0;
		sw_old = 8'd0;
		
		first_type = 4'b0;
		second_type = 4'b0;
		
		switch_changed = 1'b0;
	end
	
	assign res = !reset || switch_changed;
	
	always @(posedge clk) begin
		sw_new <= sw;
		sw_old <= sw_new;
		
		first_type = sw_new[7:4];
		second_type = sw_new[3:0];
		if (sw_new !== sw_old) begin
			switch_changed = 1'b1;
		end else
			switch_changed = 1'b0;
	end
	
	always @(posedge clk or posedge res) 
	begin
		if (res) begin
			A    <= 5'd30;
			B    <= 5'd30;
			C    <= 5'd30;
			D    <= 5'd30;
			next <= 5'd31;
			i 		= 8'd0;
			read_first = 1'b1;
		end else begin
			A <= B;
			B <= C;
			C <= D;
			if (read_first)
				case (first_type)
					4'b0000: begin
									D    <= hello_ROM[i];
									next <= hello_ROM[i + 1];
								end
					4'b0001: begin
									D    <= goodbye_ROM[i];
									next <= goodbye_ROM[i + 1];
								end
					default: begin
									D    <= hello_ROM[i];
									next <= hello_ROM[i + 1];
								end
				endcase
			else 
				case (second_type)
					4'b0000: begin
									D    <= world_ROM[i];
									next <= world_ROM[i + 1];
								end
					default: begin
									D    <= world_ROM[i];
									next <= world_ROM[i + 1];
								end
				endcase
			if (next !== 5'd30)	
				i = i + 8'd1;
			else begin
				i = 8'd0;
				if(!read_first) begin
					A    <= 5'd30;
					B    <= 5'd30;
					C    <= 5'd30;
					D    <= 5'd30;
					next <= 5'd31;
				end
				read_first = !read_first;
			end
		end
	end
	
endmodule
