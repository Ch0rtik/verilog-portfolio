transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/QuartusProjects/verilog-portfolio/PWM {C:/QuartusProjects/verilog-portfolio/PWM/CNT.v}
vlog -vlog01compat -work work +incdir+C:/QuartusProjects/verilog-portfolio/PWM {C:/QuartusProjects/verilog-portfolio/PWM/CMP.v}
vlog -vlog01compat -work work +incdir+C:/QuartusProjects/verilog-portfolio/PWM {C:/QuartusProjects/verilog-portfolio/PWM/PWM.v}

vlog -vlog01compat -work work +incdir+C:/QuartusProjects/verilog-portfolio/PWM {C:/QuartusProjects/verilog-portfolio/PWM/tb_PWM.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cycloneive_ver -L rtl_work -L work -voptargs="+acc"  tb_PWM

add wave *
view structure
view signals
run -all
