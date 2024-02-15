onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix unsigned /hello_tb/clk
add wave -noupdate -radix unsigned /hello_tb/rst_n
add wave -noupdate -radix unsigned /hello_tb/ss
add wave -noupdate -radix unsigned /hello_tb/dig
add wave -noupdate -radix hexadecimal /hello_tb/sw
add wave -noupdate -radix ascii /hello_tb/tb_asc
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
WaveRestoreZoom {0 ps} {420 us}