EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "OG4 tube mount"
Date "2020-07-11"
Rev "001"
Comp "Ian Sparkes Nixie Clocks"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5F09846B
P 6150 4200
F 0 "J1" V 6022 4480 50  0000 L CNN
F 1 "Conn_01x05" V 6113 4480 50  0000 L CNN
F 2 "NixieClockMaster:Header_MA05-1" H 6150 4200 50  0001 C CNN
F 3 "~" H 6150 4200 50  0001 C CNN
	1    6150 4200
	0    1    1    0   
$EndComp
Wire Wire Line
	6350 4000 6350 3650
Wire Wire Line
	6350 3650 5550 3650
Wire Wire Line
	5550 3650 5550 2850
Wire Wire Line
	5550 2850 5700 2850
Wire Wire Line
	6250 4000 6250 3550
Wire Wire Line
	6250 3550 7000 3550
Wire Wire Line
	7000 3550 7000 2800
Wire Wire Line
	6150 4000 6150 3750
Wire Wire Line
	6150 3750 6800 3750
Wire Wire Line
	6600 2900 6800 2900
Wire Wire Line
	5700 2650 5350 2650
Wire Wire Line
	5350 2650 5350 3850
Wire Wire Line
	5350 3850 6050 3850
Wire Wire Line
	6050 3850 6050 4000
Wire Wire Line
	5950 4000 5950 3750
Wire Wire Line
	5950 3750 5450 3750
Wire Wire Line
	5450 3750 5450 2750
Wire Wire Line
	5450 2750 5700 2750
$Comp
L Mechanical:MountingHole H1
U 1 1 5F09DE8B
P 7350 3200
F 0 "H1" H 7450 3246 50  0000 L CNN
F 1 "MountingHole" H 7450 3155 50  0001 L CNN
F 2 "NixieClockMaster:MountingHole_3.2mm_M3" H 7350 3200 50  0001 C CNN
F 3 "~" H 7350 3200 50  0001 C CNN
	1    7350 3200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5F09E263
P 7350 3400
F 0 "H2" H 7450 3446 50  0000 L CNN
F 1 "MountingHole" H 7450 3355 50  0001 L CNN
F 2 "NixieClockMaster:MountingHole_3.2mm_M3" H 7350 3400 50  0001 C CNN
F 3 "~" H 7350 3400 50  0001 C CNN
	1    7350 3400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5F09E4B6
P 7350 3600
F 0 "H3" H 7450 3646 50  0000 L CNN
F 1 "MountingHole" H 7450 3555 50  0001 L CNN
F 2 "NixieClockMaster:MountingHole_3.2mm_M3" H 7350 3600 50  0001 C CNN
F 3 "~" H 7350 3600 50  0001 C CNN
	1    7350 3600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5F09E80F
P 7350 3800
F 0 "H4" H 7450 3846 50  0000 L CNN
F 1 "MountingHole" H 7450 3755 50  0001 L CNN
F 2 "NixieClockMaster:MountingHole_3.2mm_M3" H 7350 3800 50  0001 C CNN
F 3 "~" H 7350 3800 50  0001 C CNN
	1    7350 3800
	1    0    0    -1  
$EndComp
$Comp
L NixieClockMaster:OG4 D1
U 1 1 600AEC11
P 6100 2750
F 0 "D1" H 6150 3634 50  0000 C CNN
F 1 "OG4" H 6150 3543 50  0000 C CNN
F 2 "NixieClockMaster:OG4" H 6100 2750 50  0001 C CNN
F 3 "" H 6100 2750 50  0001 C CNN
	1    6100 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 2800 7000 2800
Wire Wire Line
	6800 2900 6800 3750
$EndSCHEMATC
