onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_PWM/DUT/CLK
add wave -noupdate /tb_PWM/DUT/aRSTin
add wave -noupdate -radix unsigned /tb_PWM/DUT/Din
add wave -noupdate -radix unsigned -childformat {{{/tb_PWM/DUT/Dcnt[7]} -radix unsigned} {{/tb_PWM/DUT/Dcnt[6]} -radix unsigned} {{/tb_PWM/DUT/Dcnt[5]} -radix unsigned} {{/tb_PWM/DUT/Dcnt[4]} -radix unsigned} {{/tb_PWM/DUT/Dcnt[3]} -radix unsigned} {{/tb_PWM/DUT/Dcnt[2]} -radix unsigned} {{/tb_PWM/DUT/Dcnt[1]} -radix unsigned} {{/tb_PWM/DUT/Dcnt[0]} -radix unsigned}} -expand -subitemconfig {{/tb_PWM/DUT/Dcnt[7]} {-radix unsigned} {/tb_PWM/DUT/Dcnt[6]} {-radix unsigned} {/tb_PWM/DUT/Dcnt[5]} {-radix unsigned} {/tb_PWM/DUT/Dcnt[4]} {-radix unsigned} {/tb_PWM/DUT/Dcnt[3]} {-radix unsigned} {/tb_PWM/DUT/Dcnt[2]} {-radix unsigned} {/tb_PWM/DUT/Dcnt[1]} {-radix unsigned} {/tb_PWM/DUT/Dcnt[0]} {-radix unsigned}} /tb_PWM/DUT/Dcnt
add wave -noupdate /tb_PWM/DUT/t_cout
add wave -noupdate -radix unsigned /tb_PWM/DUT/Dint
add wave -noupdate /tb_PWM/DUT/PWM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {0 ps} {21525 ns}
