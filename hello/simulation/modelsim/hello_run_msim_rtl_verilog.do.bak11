transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/word_gen.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/ss_rg.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/ss_cntr.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/rst_rg.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/MUX2.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/hello.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/FSM.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/d_rg.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/dig_rg.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/cnt_div.sv}
vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/b2ss.sv}

vlog -sv -work work +incdir+C:/QuartusProjects/verilog-portfolio/hello {C:/QuartusProjects/verilog-portfolio/hello/hello_tb.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  hello_tb

add wave *
view structure
view signals
run -all
