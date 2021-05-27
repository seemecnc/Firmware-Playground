; bed.g
; called to perform automatic delta calibration via G32
;
G28
M117 Heating Bed Please Wait                ; display message
M190 S70                                    ; bed preheat temperature
M104 S0                                     ; hotend off
M140 S0                                     ; home
M561                                        ; clear any bed transform
G30 X0 Y0                                   ; set Z height before calibrating
; Probe the bed at 3 peripheral and 3 halfway points, and perform 6-factor auto compensation
; Before running this, you should have set up your Z-probe trigger height to suit your build, in the G31 command in config.g.
G30 P0 X0 Y84.9 H0 Z-99999
G30 P1 X73.53 Y-42.45 H0 Z-99999
G30 P2 X-73.53 Y-42.45 H0 Z-99999
G30 P3 X0 Y42.4 H0 Z-99999
G30 P4 X36.72 Y-21.2 H0 Z-99999
G30 P5 X-36.72 Y-21.2 H0 Z-99999
G30 P6 X0 Y0 H0 Z-99999 S6
G28
g28
; Use S-1 for measurements only, without calculations. Use S4 for endstop heights and Z-height only. Use S6 for full 6 factors
; If your Z probe has significantly different trigger heights depending on XY position, adjust the H parameters in the G30 commands accordingly. The value of each H parameter should be (trigger height at that XY position) - (trigger height at centre of bed)


