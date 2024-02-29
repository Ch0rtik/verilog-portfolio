`timescale 1ns/1ns
`default_nettype none
module tb_siren ();
	localparam T = 10;
	bit front_door, rear_door, window;
	bit clk, reset, ENA;
	bit [3:0] keypad;
	bit alarm_siren, is_armed, is_wait_delay;
	bit [2:0] sensors;
	
	int i = 0;
	
	assign {front_door, rear_door, window} = sensors;
	
	siren DUT(.*);
	
	always #(T/2) clk = ~clk;
	
	initial begin: test
		ENA = 1'b1;
		reset 	= 1'd1;
		#(T*4)
		
		reset 	= 1'd0;
		sensors 	= 3'b000;
		
		for(i = 0; i <= 4'b1111; i++)begin
			if(i != 4'b0011) begin
				keypad = i;
				#(T*2);
			end
		end
		
		// State 0 -> State 1 -> State 0
		keypad 	= 4'b0011;
		#(T*8)
		
		for (i = 0; i <= 4'b1111; i++) begin
			if(i != 4'b0011 && i != 4'b1100) begin
				keypad = i;
				#(T*2);
			end
		end
		
		keypad 	= 4'b1100;
		#(T*8)
		
		// State 0 -> State 1 -> State 2 -> State 0
		keypad 	= 4'b0011;
		#(T*4)
		sensors 	= 3'b001;
		#(T*4)
		keypad 	= 4'b1100;
		sensors 	= 3'b000;
		#(T*8)
		
		// State 0 -> State 1 -> State 2 -> State 3 -> State 0
		keypad 	= 4'b0011;
		#(T*4)
		sensors 	= 3'b010;
		#(T*128)
		
		for (i = 0; i <= 4'b1111; i++) begin
			if(i != 4'b1100) begin
				keypad = i;
				#(T*2);
			end
		end
		
		keypad 	= 4'b1100;
		sensors	= 3'b000;
		#(T*8)
		
		// Reset 1
		keypad 	= 4'b0011;
		#(T*8)
		reset 	= 1'd1;
		#(T*8)
		
		// Reset 2
		reset 	= 1'b0;
		keypad 	= 4'b0011;
		#(T*4)
		sensors 	= 3'b100;
		#(T*4)
		
		reset 	= 1'd1;
		sensors 	= 3'b000;
		#(T*8)
		
		// Reset 3
		reset 	= 1'b0;
		keypad 	= 4'b0011;
		#(T*4)
		sensors 	= 3'b011;
		#(T*128)
		
		reset 	= 1'd1;
		sensors 	= 3'b000;
		#(T*8)
		
		// All sensors
		reset 	= 1'b0;
		for(i = 1; i <= 3'b111; i++) begin
			keypad 	= 4'b0011;
			#(T*2)
			sensors 	= i;
			#(T*2)
			keypad 	= 4'b1100;
			sensors 	= 3'b000;
			#(T*2);
		end
		
		// ENA 
		
		// State 0 -> State 1
		ENA = 1'b0;
		#(T*2)
		keypad 	= 4'b0011;
		#(T*8)
		
		// State 1 -> State 2
		ENA = 1'b1;
		#(T*2)
		ENA = 1'b0;
		#(T*2)
		sensors = 3'b001;
		#(T*8)
		
		// State 2 -> State 3
		ENA = 1'b1;
		#(T*2)
		ENA = 1'b0;
		#(T*16)
		ENA = 1'b1;
		#(T*64)
		ENA = 1'b0;
		#(T*16)
		ENA = 1'b1;
		#(T*64)
		
		// State 3 -> State 0
		ENA = 1'b0;
		#(T*2)
		keypad 	= 4'b1100;
		sensors 	= 3'b000; 
		#(T*8)
		ENA = 1'b1;
		#(T*2)
		keypad 	= 4'b0000;
		#(T*16)
		
		$stop;
	end: test

endmodule
