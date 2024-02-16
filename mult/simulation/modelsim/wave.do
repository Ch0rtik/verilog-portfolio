onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /mult_LP_tb/dA
add wave -noupdate -radix unsigned /mult_LP_tb/dB
add wave -noupdate -radix unsigned /mult_LP_tb/a_mult_b
add wave -noupdate -radix unsigned /mult_LP_tb/clk
add wave -noupdate -radix unsigned /mult_LP_tb/i
add wave -noupdate -radix unsigned /mult_LP_tb/j
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
WaveRestoreZoom {0 ps} {1720322626 ps}
