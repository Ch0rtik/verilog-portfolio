# verilog-portfolio
 Some of my projects made with Verilog and SystemVerilog, using Quartus Prime 18.1 software.
 
## hello
 Device that cyclically displays a given 2-word phrase on a 7-segment display ("HELLO WORLD" or "GOODBYE WORLD" in the example). Developed for miniDiLaB Cyclone IV demo FPGA with 4-digit display.
 
 Included is a testbench with .do formatting file for ModelSim.
 
## PWM
 Pulse-Width Modulator with duty cycle controlled by input data.

 Included is a testbench with .do formatting file for ModelSim.
 
## mult
 Parametrized multiplier with automatic pipeline generation. Data width is the parameter. Algorithm — least significant bits first with sum shift.
 
 Included is an automated testbench with .do formatting file for ModelSim.
 
## siren
 An implementation of a simplistic alarm system, using finite-state machine, developed with various constructs from SystemVerilog.
 
 Included are: an automated testbench for ModelSim; debug file, that uses SP unit for debugging via ISSPE and Signal Tap; implementation file for miniDiLaB Cyclone IV device.
