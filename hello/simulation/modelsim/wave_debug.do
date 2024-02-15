onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /hello_tb/clk
add wave -noupdate /hello_tb/rst_n
add wave -noupdate -radix hexadecimal /hello_tb/ss
add wave -noupdate -radix hexadecimal /hello_tb/dig
add wave -noupdate -radix hexadecimal /hello_tb/sw
add wave -noupdate -radix unsigned /hello_tb/hello_inst/ss_cntr_inst/word_gen_inst/i
add wave -noupdate -radix unsigned /hello_tb/hello_inst/ss_cntr_inst/word_gen_inst/next
add wave -noupdate -radix unsigned /hello_tb/hello_inst/ss_cntr_inst/word_gen_inst/D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 342
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
WaveRestoreZoom {0 ps} {3105048465 ps}
