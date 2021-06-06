; mesh.g
;M291 P"MESH PROBE Calibration. Delete heightmap.csv and config-override.g?  Continue Click OK" R"SETUP PRINTER" S3
M117 Heating Bed Please Wait                ; display message
G28                                         ; home
M190 S70                                    ; bed preheat temperature
M104 S0                                     ; hotend off
M140 S0                                     ; home
M561                                        ; clear any bed transform
M558 P5 I0 A1 S0.05 R0.4 H35 F1500
G32
M500
M117 Bed Mapping
M558 P5 I0 A1 S0.05 R0.4 H20 F1500
M117 Heating Bed Please Wait
M190 S70
M140 S0
G29
M500
G28
M84
M375
M117 End Mesh Probe Calibration