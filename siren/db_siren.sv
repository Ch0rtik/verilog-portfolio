module db_siren (
	(* altera_attribute = "-name IO_STANDARD \"3.3-V LVCMOS\"", chip_pin = "23"  *)
	input bit clk
);
	bit front_door, rear_door, window;
	bit reset, ENA;
	bit [3:0] keypad;
	bit alarm_siren, is_armed, is_wait_delay;
	
	siren 	U1(.*);
	
	SP_unit	U2(
		.source({ENA, reset, keypad, front_door, rear_door, window}),
		.source_clk	(clk)
	);
	
endmodule
