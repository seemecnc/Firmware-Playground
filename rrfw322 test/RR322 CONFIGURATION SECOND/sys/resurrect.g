; File "0:/gcodes/factory/SeeMeCNC DUAL Testing Wheel.gcode" resume print after print paused at 2021-05-28 15:12
G21
M140 P0 S60.0
T-1 P0
G92 X87.943 Y-79.123 Z0.300
G60 S1
G10 P1 S0 R0
G10 P0 S205 R205
T0 P0
M98 P"resurrect-prologue.g"
M116
M290 X0.000 Y0.000 Z0.000 R0
T-1 P0
T0 P6
; Workplace coordinates
G10 L2 P1 X0.00 Y0.00 Z0.00
G10 L2 P2 X0.00 Y0.00 Z0.00
G10 L2 P3 X0.00 Y0.00 Z0.00
G10 L2 P4 X0.00 Y0.00 Z0.00
G10 L2 P5 X0.00 Y0.00 Z0.00
G10 L2 P6 X0.00 Y0.00 Z0.00
G10 L2 P7 X0.00 Y0.00 Z0.00
G10 L2 P8 X0.00 Y0.00 Z0.00
G10 L2 P9 X0.00 Y0.00 Z0.00
G54
M106 S0.00
M106 P1 S0.80
M116
G92 E0.00000
M83
M23 "0:/gcodes/factory/SeeMeCNC DUAL Testing Wheel.gcode"
M26 S20558
G0 F6000 Z2.300
G0 F6000 X87.943 Y-79.123
G0 F6000 Z0.300
G1 F2700.0 P0
G21
M24