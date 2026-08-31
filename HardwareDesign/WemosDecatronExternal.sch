EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Decatron Clock External Components"
Date "2021-01-09"
Rev "Rev001"
Comp "Ian Sparkes Nixie Clocks"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L WemosDecatronExternal-rescue:SPST-ModularRev3External-rescue-ModularRev3External-rescue SW1
U 1 1 58DB95A5
P 5600 4000
F 0 "SW1" H 5600 4100 50  0000 C CNN
F 1 "SPST" H 5600 3900 50  0000 C CNN
F 2 "" H 5600 4000 50  0000 C CNN
F 3 "" H 5600 4000 50  0000 C CNN
	1    5600 4000
	0    -1   -1   0   
$EndComp
$Comp
L WemosDecatronExternal-rescue:PIR_Motion_Sensor-ModularRev3External-rescue-ModularRev3External-rescue PIR1
U 1 1 58DB9868
P 6500 3550
F 0 "PIR1" H 6500 4450 60  0000 C CNN
F 1 "PIR_Motion_Sensor" H 6500 4350 60  0000 C CNN
F 2 "" H 6500 4350 60  0000 C CNN
F 3 "" H 6500 4350 60  0000 C CNN
	1    6500 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 3500 7000 3500
Wire Wire Line
	7000 3500 7000 4750
Connection ~ 6600 3500
Wire Wire Line
	7000 4750 5600 4750
Wire Wire Line
	5600 4500 5600 4750
Text Label 5600 2700 1    60   ~ 0
BTN
Text Label 6600 2750 1    60   ~ 0
GND
Text Label 6400 3050 1    60   ~ 0
5V
Text Label 6500 2900 1    60   ~ 0
PIR
Wire Wire Line
	6600 3500 6600 3550
Text Notes 5650 1550 0    50   ~ 0
Front panel components
Text Notes 7850 2460 0    59   ~ 0
3V3\nVCC\nGPIO1\nDLS\nPIR\nBTN1\nGND\nGND
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5FFA85A6
P 7770 2040
F 0 "J2" H 7720 2480 50  0000 L CNN
F 1 "FRONT" H 7640 1530 50  0000 L CNN
F 2 "" H 7770 2040 50  0001 C CNN
F 3 "~" H 7770 2040 50  0001 C CNN
	1    7770 2040
	1    0    0    -1  
$EndComp
Wire Wire Line
	7570 2340 6600 2340
Wire Wire Line
	6600 2340 6600 3500
Wire Wire Line
	7570 2240 5600 2240
Wire Wire Line
	5600 2240 5600 3500
Wire Wire Line
	7570 1840 6400 1840
Wire Wire Line
	6400 1840 6400 3550
Wire Wire Line
	6500 2140 6500 3550
Wire Wire Line
	6500 2140 7570 2140
NoConn ~ 7570 1740
NoConn ~ 7570 1940
NoConn ~ 7570 2040
NoConn ~ 7570 2440
$EndSCHEMATC
