EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L pspice:VSOURCE V1
U 1 1 5FF747BD
P 2100 3700
F 0 "V1" H 2328 3746 50  0000 L CNN
F 1 "VSOURCE" H 2328 3655 50  0000 L CNN
F 2 "" H 2100 3700 50  0001 C CNN
F 3 "" H 2100 3700 50  0001 C CNN
F 4 "V" H 2100 3700 50  0001 C CNN "Spice_Primitive"
F 5 "dc 1" H 2550 3550 50  0000 C CNN "Spice_Model"
F 6 "Y" H 2100 3700 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2100 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF74822
P 2100 4000
F 0 "#PWR?" H 2100 3750 50  0001 C CNN
F 1 "GND" H 2105 3827 50  0000 C CNN
F 2 "" H 2100 4000 50  0001 C CNN
F 3 "" H 2100 4000 50  0001 C CNN
	1    2100 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5FF74120
P 3750 3400
F 0 "R1" V 3543 3400 50  0000 C CNN
F 1 "100k" V 3634 3400 50  0000 C CNN
F 2 "" V 3680 3400 50  0001 C CNN
F 3 "~" H 3750 3400 50  0001 C CNN
	1    3750 3400
	0    1    1    0   
$EndComp
$Comp
L Device:R R3
U 1 1 5FF743BE
P 4650 2900
F 0 "R3" V 4443 2900 50  0000 C CNN
F 1 "100k" V 4534 2900 50  0000 C CNN
F 2 "" V 4580 2900 50  0001 C CNN
F 3 "~" H 4650 2900 50  0001 C CNN
	1    4650 2900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF7469C
P 4400 3600
F 0 "#PWR?" H 4400 3350 50  0001 C CNN
F 1 "GND" V 4400 3400 50  0000 C CNN
F 2 "" H 4400 3600 50  0001 C CNN
F 3 "" H 4400 3600 50  0001 C CNN
	1    4400 3600
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 3400 4300 2900
Wire Wire Line
	4300 2900 4500 2900
Wire Wire Line
	4300 3400 4400 3400
Wire Wire Line
	4800 2900 5100 2900
Wire Wire Line
	5100 2900 5100 3500
Wire Wire Line
	5100 3500 5000 3500
$Comp
L pspice:VSOURCE V2
U 1 1 5FF74878
P 4200 4800
F 0 "V2" H 4428 4846 50  0000 L CNN
F 1 "VSOURCE" H 4428 4755 50  0000 L CNN
F 2 "" H 4200 4800 50  0001 C CNN
F 3 "" H 4200 4800 50  0001 C CNN
F 4 "V" H 4200 4800 50  0001 C CNN "Spice_Primitive"
F 5 "12" H 4650 4650 50  0000 C CNN "Spice_Model"
F 6 "Y" H 4200 4800 50  0001 C CNN "Spice_Netlist_Enabled"
	1    4200 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF748CA
P 4200 5100
F 0 "#PWR?" H 4200 4850 50  0001 C CNN
F 1 "GND" H 4205 4927 50  0000 C CNN
F 2 "" H 4200 5100 50  0001 C CNN
F 3 "" H 4200 5100 50  0001 C CNN
	1    4200 5100
	1    0    0    -1  
$EndComp
$Comp
L pspice:VSOURCE V3
U 1 1 5FF74B5E
P 5400 4800
F 0 "V3" H 5628 4846 50  0000 L CNN
F 1 "VSOURCE" H 5628 4755 50  0000 L CNN
F 2 "" H 5400 4800 50  0001 C CNN
F 3 "" H 5400 4800 50  0001 C CNN
F 4 "V" H 5400 4800 50  0001 C CNN "Spice_Primitive"
F 5 "-12" H 5850 4650 50  0000 C CNN "Spice_Model"
F 6 "Y" H 5400 4800 50  0001 C CNN "Spice_Netlist_Enabled"
	1    5400 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FF74B64
P 5400 5100
F 0 "#PWR?" H 5400 4850 50  0001 C CNN
F 1 "GND" H 5405 4927 50  0000 C CNN
F 2 "" H 5400 5100 50  0001 C CNN
F 3 "" H 5400 5100 50  0001 C CNN
	1    5400 5100
	1    0    0    -1  
$EndComp
Text Notes 5550 2900 0    50   ~ 0
.dc V1 0 10 .5
$Comp
L Amplifier_Operational:TL072 U1
U 1 1 5FF75688
P 4700 3500
F 0 "U1" H 4700 3133 50  0000 C CNN
F 1 "TL072" H 4700 3224 50  0000 C CNN
F 2 "" H 4700 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 4700 3500 50  0001 C CNN
F 4 "X" H 4700 3500 50  0001 C CNN "Spice_Primitive"
F 5 "TL072c" H 4700 3500 50  0001 C CNN "Spice_Model"
F 6 "Y" H 4700 3500 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "TL072-dual.lib" H 4700 3500 50  0001 C CNN "Spice_Lib_File"
	1    4700 3500
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL072 U1
U 3 1 5FF75A17
P 7500 4800
F 0 "U1" H 7458 4846 50  0000 L CNN
F 1 "TL072" H 7458 4755 50  0000 L CNN
F 2 "" H 7500 4800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7500 4800 50  0001 C CNN
F 4 "X" H 7500 4800 50  0001 C CNN "Spice_Primitive"
F 5 "TL072c" H 7500 4800 50  0001 C CNN "Spice_Model"
F 6 "Y" H 7500 4800 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "TL072-dual.lib" H 7500 4800 50  0001 C CNN "Spice_Lib_File"
	3    7500 4800
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FF75DB3
P 4200 4500
F 0 "#PWR?" H 4200 4350 50  0001 C CNN
F 1 "VCC" H 4217 4673 50  0000 C CNN
F 2 "" H 4200 4500 50  0001 C CNN
F 3 "" H 4200 4500 50  0001 C CNN
	1    4200 4500
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR?
U 1 1 5FF75DE1
P 7400 4500
F 0 "#PWR?" H 7400 4350 50  0001 C CNN
F 1 "VCC" H 7417 4673 50  0000 C CNN
F 2 "" H 7400 4500 50  0001 C CNN
F 3 "" H 7400 4500 50  0001 C CNN
	1    7400 4500
	1    0    0    -1  
$EndComp
$Comp
L power:VEE #PWR?
U 1 1 5FF76041
P 5400 4500
F 0 "#PWR?" H 5400 4350 50  0001 C CNN
F 1 "VEE" H 5417 4673 50  0000 C CNN
F 2 "" H 5400 4500 50  0001 C CNN
F 3 "" H 5400 4500 50  0001 C CNN
	1    5400 4500
	1    0    0    -1  
$EndComp
$Comp
L power:VEE #PWR?
U 1 1 5FF7606F
P 7400 5100
F 0 "#PWR?" H 7400 4950 50  0001 C CNN
F 1 "VEE" H 7418 5273 50  0000 C CNN
F 2 "" H 7400 5100 50  0001 C CNN
F 3 "" H 7400 5100 50  0001 C CNN
	1    7400 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	5100 3500 6450 3500
Connection ~ 5100 3500
$Comp
L Device:R R2
U 1 1 615623F9
P 3750 3000
F 0 "R2" V 3543 3000 50  0000 C CNN
F 1 "100k" V 3634 3000 50  0000 C CNN
F 2 "" V 3680 3000 50  0001 C CNN
F 3 "~" H 3750 3000 50  0001 C CNN
	1    3750 3000
	0    1    1    0   
$EndComp
$Comp
L pspice:VSOURCE V4
U 1 1 61565B54
P 2550 2650
F 0 "V4" H 2778 2696 50  0000 L CNN
F 1 "VSOURCE" H 2778 2605 50  0000 L CNN
F 2 "" H 2550 2650 50  0001 C CNN
F 3 "" H 2550 2650 50  0001 C CNN
F 4 "V" H 2550 2650 50  0001 C CNN "Spice_Primitive"
F 5 "-5" H 3000 2500 50  0000 C CNN "Spice_Model"
F 6 "Y" H 2550 2650 50  0001 C CNN "Spice_Netlist_Enabled"
	1    2550 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61565B5E
P 2550 2950
F 0 "#PWR?" H 2550 2700 50  0001 C CNN
F 1 "GND" H 2555 2777 50  0000 C CNN
F 2 "" H 2550 2950 50  0001 C CNN
F 3 "" H 2550 2950 50  0001 C CNN
	1    2550 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2550 2350 3350 2350
Wire Wire Line
	3350 2350 3350 3000
Wire Wire Line
	3350 3000 3600 3000
Wire Wire Line
	2100 3400 3600 3400
Wire Wire Line
	3900 3000 4100 3000
Wire Wire Line
	4100 3000 4100 3400
Wire Wire Line
	4100 3400 4300 3400
Connection ~ 4300 3400
Wire Wire Line
	3900 3400 4100 3400
Connection ~ 4100 3400
$Comp
L Amplifier_Operational:TL072 U1
U 2 1 61569D1B
P 7600 2650
F 0 "U1" H 7600 2283 50  0000 C CNN
F 1 "TL072" H 7600 2374 50  0000 C CNN
F 2 "" H 7600 2650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl071.pdf" H 7600 2650 50  0001 C CNN
F 4 "X" H 7600 2650 50  0001 C CNN "Spice_Primitive"
F 5 "TL072c" H 7600 2650 50  0001 C CNN "Spice_Model"
F 6 "Y" H 7600 2650 50  0001 C CNN "Spice_Netlist_Enabled"
F 7 "TL072-dual.lib" H 7600 2650 50  0001 C CNN "Spice_Lib_File"
	2    7600 2650
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6156C0D6
P 7300 2750
F 0 "#PWR?" H 7300 2500 50  0001 C CNN
F 1 "GND" V 7300 2550 50  0000 C CNN
F 2 "" H 7300 2750 50  0001 C CNN
F 3 "" H 7300 2750 50  0001 C CNN
	1    7300 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 2550 7150 2550
Wire Wire Line
	7150 2550 7150 2150
Wire Wire Line
	7150 2150 8000 2150
Wire Wire Line
	8000 2150 8000 2650
Wire Wire Line
	8000 2650 7900 2650
$EndSCHEMATC