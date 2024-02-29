`default_nettype none
module impl_siren (
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23"  *)
	input bit clk,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "24" *)
		input bit reset_in,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "88, 89, 90, 91" *)
	input bit [3:0] keypad_in,
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "49, 46, 25" *)
	input bit [2:0] sensors_in,
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "70" *)
	output bit alarm_siren,
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "71" *)	
	output bit is_armed, 
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin = "72" *)
	output bit is_wait_delay
);
	parameter div_par = 2500000;
	bit front_door, rear_door, window;
	bit reset, ENA;
	bit [3:0] keypad;
	bit [24:0] div_cnt;
	
	FF_unit reset_FF(.clk, .reset(1'b0), .source(reset_in), .out(reset));
	FF_unit #(3) sensors_FF(.clk, .reset(reset_in), .source(sensors_in), .out({front_door, rear_door, window}));
	FF_unit #(4) keypad_FF(.clk, .reset(reset_in), .source(keypad_in), .out(keypad));
	
	always @(posedge clk)
		if (ENA)
			div_cnt <= 25'd1;
		else
			div_cnt <= div_cnt + 25'd1;
		
	assign ENA = (div_cnt == div_par);	
	
	siren	siren_inst (.*);
		
endmodule
