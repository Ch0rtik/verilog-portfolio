module hello #(
  parameter N = 10000
)(
	(* altera_attribute = "-name IO_STANDARD \"3.3V LVCMOS\"", chip_pin="23" *)
	input clk,
	(* altera_attribute = "-name IO_STANDARD \"2.5V\"", chip_pin="64" *)	
	input rst_n,
	input [7:0] sw,
	(* altera_attribute = "-name IO_STANDARD \"3.3V LVCMOS\"", chip_pin="84, 76, 85, 77, 86, 133, 87" *)
	output [6:0] ss,
	(* altera_attribute = "-name IO_STANDARD \"3.3V LVCMOS\"", chip_pin="73, 80, 74, 83" *)
	output [4:1] dig
);
	
	ss_cntr #(N) ss_cntr_inst (clk, rst_n, sw, ss, dig);

endmodule
