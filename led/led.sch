EESchema Schematic File Version 4
EELAYER 26 0
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
L power:PWR_FLAG #FLG0101
U 1 1 5FC83467
P 7300 4000
F 0 "#FLG0101" H 7300 4075 50  0001 C CNN
F 1 "PWR_FLAG" H 7300 4174 50  0000 C CNN
F 2 "" H 7300 4000 50  0001 C CNN
F 3 "~" H 7300 4000 50  0001 C CNN
	1    7300 4000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5FC83485
P 7300 4000
F 0 "#PWR0106" H 7300 3750 50  0001 C CNN
F 1 "GND" H 7305 3827 50  0000 C CNN
F 2 "" H 7300 4000 50  0001 C CNN
F 3 "" H 7300 4000 50  0001 C CNN
	1    7300 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5FD25C62
P 3700 4000
F 0 "J1" H 3620 3675 50  0000 C CNN
F 1 "IN" H 3620 3766 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3700 4000 50  0001 C CNN
F 3 "~" H 3700 4000 50  0001 C CNN
F 4 "Male Hader" H 3700 4000 50  0001 C CNN "Device"
F 5 "CONN HEADER VERT 2POS 2.54MM" H 3700 4000 50  0001 C CNN "Description"
F 6 "No" H 3700 4000 50  0001 C CNN "Place"
F 7 "Digikey" H 3700 4000 50  0001 C CNN "Dist"
F 8 "609-3506-ND" H 3700 4000 50  0001 C CNN "DistPartNumber"
F 9 "https://www.digikey.de/product-detail/en/amphenol-icc-fci/68001-102HLF/609-3506-ND/1493701" H 3700 4000 50  0001 C CNN "DistLink"
	1    3700 4000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5FD27361
P 5400 4000
F 0 "#PWR0101" H 5400 3750 50  0001 C CNN
F 1 "GND" V 5400 3800 50  0000 C CNN
F 2 "" H 5400 4000 50  0001 C CNN
F 3 "" H 5400 4000 50  0001 C CNN
	1    5400 4000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 5FD62CC1
P 4750 4000
F 0 "R1" V 4543 4000 50  0000 C CNN
F 1 "100" V 4634 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 4680 4000 50  0001 C CNN
F 3 "~" H 4750 4000 50  0001 C CNN
F 4 "Resistor" H 4750 4000 50  0001 C CNN "Device"
F 5 "RES SMD 100 OHM 1% 1/10W 0603" H 4750 4000 50  0001 C CNN "Description"
F 6 "Yes" H 4750 4000 50  0001 C CNN "Place"
F 7 "Digikey" H 4750 4000 50  0001 C CNN "Dist"
F 8 "P100HCT-ND" H 4750 4000 50  0001 C CNN "DistPartNumber"
F 9 "https://www.digikey.de/product-detail/en/panasonic-electronic-components/ERJ-3EKF1000V/P100HCT-ND/198109" H 4750 4000 50  0001 C CNN "DistLink"
	1    4750 4000
	0    1    1    0   
$EndComp
$Comp
L Device:LED D1
U 1 1 5FD62DCA
P 5150 4000
F 0 "D1" H 5142 3745 50  0000 C CNN
F 1 "LED" H 5142 3836 50  0000 C CNN
F 2 "LED_THT:LED_D3.0mm" H 5150 4000 50  0001 C CNN
F 3 "~" H 5150 4000 50  0001 C CNN
F 4 "LED" H 5150 4000 50  0001 C CNN "Device"
F 5 "LED GREEN DIFFUSED T-1 T/H" H 5150 4000 50  0001 C CNN "Description"
F 6 "No" H 5150 4000 50  0001 C CNN "Place"
F 7 "Digikey" H 5150 4000 50  0001 C CNN "Dist"
F 8 "754-1603-ND" H 5150 4000 50  0001 C CNN "DistPartNumber"
F 9 "https://www.digikey.de/product-detail/en/kingbright/WP710A10GD/754-1603-ND/2769808" H 5150 4000 50  0001 C CNN "DistLink"
	1    5150 4000
	-1   0    0    1   
$EndComp
Text GLabel 3900 4000 2    50   Output ~ 0
IN
Text GLabel 4500 4000 0    50   Input ~ 0
IN
$Comp
L power:GND #PWR0102
U 1 1 5FD6301D
P 3900 3900
F 0 "#PWR0102" H 3900 3650 50  0001 C CNN
F 1 "GND" V 3900 3700 50  0000 C CNN
F 2 "" H 3900 3900 50  0001 C CNN
F 3 "" H 3900 3900 50  0001 C CNN
	1    3900 3900
	0    -1   -1   0   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J2
U 1 1 5FD63147
P 6300 4000
F 0 "J2" H 6220 3675 50  0000 C CNN
F 1 "GND" H 6220 3766 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6300 4000 50  0001 C CNN
F 3 "~" H 6300 4000 50  0001 C CNN
F 4 "Male Hader" H 6300 4000 50  0001 C CNN "Device"
F 5 "CONN HEADER VERT 2POS 2.54MM" H 6300 4000 50  0001 C CNN "Description"
F 6 "No" H 6300 4000 50  0001 C CNN "Place"
F 7 "Digikey" H 6300 4000 50  0001 C CNN "Dist"
F 8 "609-3506-ND" H 6300 4000 50  0001 C CNN "DistPartNumber"
F 9 "https://www.digikey.de/product-detail/en/amphenol-icc-fci/68001-102HLF/609-3506-ND/1493701" H 6300 4000 50  0001 C CNN "DistLink"
	1    6300 4000
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5FD631A0
P 6100 4000
F 0 "#PWR0103" H 6100 3750 50  0001 C CNN
F 1 "GND" V 6100 3800 50  0000 C CNN
F 2 "" H 6100 4000 50  0001 C CNN
F 3 "" H 6100 4000 50  0001 C CNN
	1    6100 4000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5FD631BB
P 6100 3900
F 0 "#PWR0104" H 6100 3650 50  0001 C CNN
F 1 "GND" V 6100 3700 50  0000 C CNN
F 2 "" H 6100 3900 50  0001 C CNN
F 3 "" H 6100 3900 50  0001 C CNN
	1    6100 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	4900 4000 5000 4000
Wire Wire Line
	5300 4000 5400 4000
Wire Wire Line
	4500 4000 4600 4000
$EndSCHEMATC