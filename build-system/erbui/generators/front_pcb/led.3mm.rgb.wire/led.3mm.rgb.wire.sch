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
L Connector:TestPoint Pin0
U 1 1 60B93D2A
P 5150 4500
F 0 "Pin0" V 5150 4750 50  0000 C CNN
F 1 "TestPoint" V 5254 4572 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5350 4500 50  0001 C CNN
F 3 "~" H 5350 4500 50  0001 C CNN
	1    5150 4500
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED_RGBA D1
U 1 1 60BBD1E1
P 6200 4700
F 0 "D1" H 6200 5197 50  0000 C CNN
F 1 "LED_RGBA" H 6200 5106 50  0000 C CNN
F 2 "LED_SMD:LED_Cree-PLCC4_3.2x2.8mm_CCW" H 6200 4650 50  0001 C CNN
F 3 "~" H 6200 4650 50  0001 C CNN
	1    6200 4700
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0101
U 1 1 60BC0C13
P 6400 4700
F 0 "#PWR0101" H 6400 4550 50  0001 C CNN
F 1 "+3V3" V 6415 4828 50  0000 L CNN
F 2 "" H 6400 4700 50  0001 C CNN
F 3 "" H 6400 4700 50  0001 C CNN
	1    6400 4700
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint Pin1
U 1 1 60BC16D9
P 5150 4700
F 0 "Pin1" V 5150 4950 50  0000 C CNN
F 1 "TestPoint" V 5254 4772 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5350 4700 50  0001 C CNN
F 3 "~" H 5350 4700 50  0001 C CNN
	1    5150 4700
	0    -1   -1   0   
$EndComp
$Comp
L Connector:TestPoint Pin2
U 1 1 60BC1964
P 5150 4900
F 0 "Pin2" V 5150 5150 50  0000 C CNN
F 1 "TestPoint" V 5254 4972 50  0001 C CNN
F 2 "TestPoint:TestPoint_Pad_D1.5mm" H 5350 4900 50  0001 C CNN
F 3 "~" H 5350 4900 50  0001 C CNN
	1    5150 4900
	0    -1   -1   0   
$EndComp
Text GLabel 6000 4500 0    50   Input ~ 0
Pin0
Text GLabel 6000 4700 0    50   Input ~ 0
Pin1
Text GLabel 6000 4900 0    50   Input ~ 0
Pin2
Text GLabel 5150 4500 2    50   Output ~ 0
Pin0
Text GLabel 5150 4700 2    50   Output ~ 0
Pin1
Text GLabel 5150 4900 2    50   Output ~ 0
Pin2
$EndSCHEMATC