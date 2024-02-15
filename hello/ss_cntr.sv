module ss_cntr #(
  parameter N = 10000
)(
	input clk, rst_n,
	input [7:0] sw,
	output [6:0] ss,
	output [4:1] dig
);

	wire rst_ni, ENA;
	wire [1:0] sel;
	wire [4:1] digi;
	wire [4:0] Ai, Bi, Ci, Di, mo;
	wire [6:0] ssi;
	
	wire word_clk;
	wire [4:0] A, B, C, D;	

	rst_rg rst_rg_inst (clk, rst_n, rst_ni);
	cnt_div #(N) cnt_div_inst (clk, rst_ni, ENA);
	cnt_div #(N/10) cnt_div_word_inst (ENA, rst_ni, word_clk);
	
	FSM FSM_inst (clk, ENA, rst_ni, sel, digi);
	dig_rg dig_rg_inst (clk, rst_ni, digi, dig);
	
	
	word_gen word_gen_inst (word_clk, rst_ni, sw, A, B, C, D);
	d_rg d_rg_inst (clk, rst_ni, A, B, C, D, Ai, Bi, Ci, Di);
	MUX2 MUX2_inst (sel, Ai, Bi, Ci, Di, mo);
	b2ss b2ss_inst (mo, ssi);
	ss_rg ss_rg_inst (clk, rst_ni, ssi, ss);

endmodule
