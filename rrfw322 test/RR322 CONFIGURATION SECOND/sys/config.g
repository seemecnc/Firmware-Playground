; General Settings SeeMeCNC
G90                                                     ; absolute coordinates
M83                                                     ; relative extruder moves
M550 P"ARTIMES"                                         ; set printer name
M665 R150 L339.47 B145 H530                             ; SeeMeCNC 350mm L Carbon Fiber ARMS Set delta radius, diagonal rod length, printable radius and homed height
;M665 R150 L351.1 B145 H530                              ; SeeMeCNC 350mm L Injection Molded ARMS Set delta radius, diagonal rod length, printable radius and homed height
M666 X0 Y0 Z0                                           ; delta endstop adjustment

; Network
M552 S1                                                 ; enable network, S0 is disable
M586 P0 S1                                              ; enable HTTP
M586 P1 S0                                              ; disable FTP
M586 P2 S0                                              ; disable Telnet

; Drives
M569 P0 S0                                              ; physical drive 0
M569 P1 S0                                              ; physical drive 1
M569 P2 S0                                              ; physical drive 2
M569 P3 S1                                              ; physical drive 3
M569 P4 S1                                              ; physical drive 4
M584 X0 Y1 Z2 E3:4                                      ; set drive mapping
M350 X16 Y16 Z16 E16:16 I1                              ; configure micro stepping with interpolation
M92 X200.00 Y200.00 Z200.00 E182.00:182.00              ; set steps per mm
M566 X700.00 Y700.00 Z700.00 E2000.00:2000.00           ; set maximum instantaneous speed changes (mm/min)
M203 X10000.00 Y10000.00 Z10000.00 E9000.00:9000.00     ; set maximum speeds (mm/min)
M201 X1400.00 Y1400.00 Z1400.00 E5000.00:5000.00        ; set accelerations (mm/s^2)
M906 X1500 Y1500 Z1500 E1600:1600 I40                   ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                                 ; Set idle timeout

; Axis Limits
M208 Z0 S1                                              ; set minimum Z

; End-stops
M574 X2 S1 P"xstop"                                     ; configure active-high endstop for high end on X via pin xstop
M574 Y2 S1 P"ystop"                                     ; configure active-high endstop for high end on Y via pin ystop
M574 Z2 S1 P"zstop"                                     ; configure active-high endstop for high end on Z via pin zstop

; Z-Probe
M558 P5 I0 A2 R0.4 C"zprobe.in" H20 F1500 T9000         ; set Z probe type to switch and the dive height + speeds
;M558 P5 I1 A2 R0.4 C"^zprobe.in" H20 F1500 T9000        ; set Z probe type to switch and the dive height + speeds
G31 P500 X0 Y0 Z-0.2                                    ; set Z probe trigger value, offset and trigger height
M557 R145 S30                                           ; define mesh grid

; Bed Heater
M308 S0 P"bedtemp" Y"thermistor" T100000 B4725 C7.06e-8 ; configure sensor 0 as thermistor on pin bed temp
M950 H0 C"bedheat" T0                                   ; create bed heater output on bed heat and map it to sensor 0
M307 H0 R0.245 C774.3 D25.92 S1.00 V12.9                ; Bed Heater Process Parameters
M140 H0                                                 ; map bed heater to heater zero
M143 H0 S120                                            ; set temperature limit for heater 0 to 120C

; Hotend Heater
M308 S1 P"e0temp" Y"thermistor" T100000 B4725 C7.06e-8  ; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                                    ; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 R4.044 C104.5 D4.80 S1.00 V12.7                 ; Hotend Heater Process Parameters
M143 H1 S280                                            ; Hotend Max Temp

; Fans
M950 F0 C"fan0" Q500                                    ; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                          ; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan2" Q500                                    ; create fan 1 on pin fan1 and set its frequency
M106 P1 S0.80 H1 T45                                    ; set fan 1 value. Thermostatic control is turned on

; Tool Extruder 1
M563 P0 D0 H1 F0
G10 P0 X0 Y0 Z0
G10 P0 S0 R0

; Tool Extruder 2
M563 P1 D1 H1 F0
G10 P1 X0 Y0 Z0
G10 P1 S0 R0

; Filament Switch
M591 D0 P2 C3
M581 E0:1 S0 T2 C0

; Miscellaneous
M575 P1 S1 B57600                                       ; enable support for PanelDue
M501                                                    ; load saved parameters from non-volatile memory
T0                                                      ; select Tool 0
M911 S10.5 R11.2 P"M913 X0 Y0 G91 M83 G1 Z3 E-5 F1000"  ; set voltage thresholds and actions to run on power loss
