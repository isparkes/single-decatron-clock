EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Wemos D1 A-101 decatron clock"
Date "2020-06-02"
Rev "Rev 001"
Comp "Ian Sparkes Nixie Clocks"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 3050 4250 0    70   ~ 0
Power regulator
$Comp
L WemosDecatron-rescue:RCL_C-EU050-024X044-4DigitIN12Main-rescue-4DigitIN12Main-rescue C8
U 1 1 5696B8D8
P 2900 5500
F 0 "C8" H 2750 5300 70  0000 L BNN
F 1 "100nF" H 2550 5500 70  0000 L BNN
F 2 "NixieClockMaster:C025-024X044" H 2890 5290 70  0001 L TNN
F 3 "" H 2900 5500 60  0001 C CNN
	1    2900 5500
	1    0    0    1   
$EndComp
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C10
U 1 1 5696BD88
P 4200 5200
F 0 "C10" H 4250 5050 70  0000 L BNN
F 1 "220uF" V 4050 5050 70  0000 L BNN
F 2 "NixieClockMaster:C_Radial_D6.3_L11.2_P2.5" H 4190 4990 70  0001 L TNN
F 3 "" H 4200 5200 60  0001 C CNN
F 4 "Value" H 3950 4850 60  0000 C CNN "Fieldname"
F 5 "+" V 4177 5216 50  0000 L BNN "Field5"
	1    4200 5200
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:GND-power #GND01
U 1 1 5696C1D4
P 5050 5800
F 0 "#GND01" H 4950 5700 70  0001 L BNN
F 1 "GND" H 5000 5550 70  0000 L BNN
F 2 "" H 5050 5800 60  0001 C CNN
F 3 "" H 5050 5800 60  0001 C CNN
	1    5050 5800
	1    0    0    -1  
$EndComp
Text Label 5050 4700 0    65   ~ 0
VCC
Text Label 2600 4700 0    65   ~ 0
VIN
$Comp
L WemosDecatron-rescue:PWR_FLAG-power #FLG02
U 1 1 56B900AF
P 2900 5100
F 0 "#FLG02" H 2900 5195 50  0001 C CNN
F 1 "PWR_FLAG" H 2900 5280 50  0000 C CNN
F 2 "" H 2900 5100 50  0000 C CNN
F 3 "" H 2900 5100 50  0000 C CNN
	1    2900 5100
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:D-4DigitIN12Main-rescue-4DigitIN12Main-rescue D1
U 1 1 572B3850
P 2050 5200
F 0 "D1" H 2050 5300 50  0000 C CNN
F 1 "UF4007" H 2050 5100 50  0000 C CNN
F 2 "NixieClockMaster:Diode_DO-41_SOD81_Vertical_AnodeUp" H 2050 5200 50  0001 C CNN
F 3 "" H 2050 5200 50  0000 C CNN
F 4 "Value" H 2050 5200 60  0001 C CNN "Fieldname"
	1    2050 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	1400 5700 1700 5700
Wire Wire Line
	3400 5700 3400 5500
Wire Wire Line
	2900 5600 2900 5700
Wire Wire Line
	4200 5350 4200 5700
Connection ~ 2900 5700
Connection ~ 3400 5700
Wire Wire Line
	3900 4700 4200 4700
Wire Wire Line
	3900 4700 3900 5200
Wire Wire Line
	3900 5200 3700 5200
Wire Wire Line
	4200 5050 4200 4700
Wire Wire Line
	2900 5100 2900 5200
Wire Wire Line
	2500 5200 2500 4700
Wire Wire Line
	2500 4700 2600 4700
Connection ~ 2500 5200
Connection ~ 2900 5200
Wire Wire Line
	5050 5700 5050 5800
Wire Wire Line
	1400 5200 1900 5200
Wire Wire Line
	2200 5200 2500 5200
Wire Wire Line
	1400 5200 1400 5450
Wire Wire Line
	1200 5550 1400 5550
Wire Wire Line
	1400 5550 1400 5700
$Comp
L WemosDecatron-rescue:CONN_01X02-4DigitIN12Main-rescue-4DigitIN12Main-rescue J3
U 1 1 59F6E039
P 1000 5500
F 0 "J3" H 1000 5650 50  0000 C CNN
F 1 "CONN_01X02" V 1100 5500 50  0000 C CNN
F 2 "NixieClockMaster:Header_MA02-1" H 1000 5500 50  0001 C CNN
F 3 "" H 1000 5500 50  0001 C CNN
	1    1000 5500
	-1   0    0    1   
$EndComp
Wire Wire Line
	1400 5450 1200 5450
$Comp
L WemosDecatron-rescue:FRAMES_FRAME_A_L-4DigitIN12Main-rescue-4DigitIN12Main-rescue #FRAME2
U 1 1 5BDEB8FE
P 1550 8350
F 0 "#FRAME2" H 1600 8400 60  0001 C CNN
F 1 "~" H 1550 -33250 60  0001 C CNN
F 2 "" H 1550 -33250 60  0001 C CNN
F 3 "" H 1550 -33250 60  0001 C CNN
	1    1550 8350
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:GND-power #GND04
U 1 1 5BDEB8FF
P 1550 7600
F 0 "#GND04" H 1450 7500 70  0001 L BNN
F 1 "GND" H 1450 7400 70  0000 L BNN
F 2 "" H 1550 7600 60  0001 C CNN
F 3 "" H 1550 7600 60  0001 C CNN
	1    1550 7600
	1    0    0    -1  
$EndComp
Text Label 1850 9500 0    65   ~ 0
BTN1
Text Label 1850 9700 0    65   ~ 0
GND
$Comp
L WemosDecatron-rescue:TEST_1P-4DigitIN12Main-rescue-4DigitIN12Main-rescue W2
U 1 1 5BDEB914
P 1450 7400
F 0 "W2" H 1450 7670 50  0000 C CNN
F 1 "GND" H 1450 7600 50  0000 C CNN
F 2 "NixieClockMaster:TESTPAD_P1-13" H 1650 7400 50  0001 C CNN
F 3 "" H 1650 7400 50  0000 C CNN
	1    1450 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 9600 1850 9600
Wire Wire Line
	1450 7500 1550 7500
Wire Wire Line
	1650 9500 1850 9500
Wire Wire Line
	1450 7500 1450 7400
Wire Wire Line
	1650 9700 1850 9700
$Comp
L WemosDecatron-rescue:TEST_1P-4DigitIN12Main-rescue-4DigitIN12Main-rescue W4
U 1 1 5BDEB915
P 14730 3800
F 0 "W4" H 14730 4070 50  0000 C CNN
F 1 "170V" H 14730 4000 50  0000 C CNN
F 2 "NixieClockMaster:TESTPAD_P1-13" H 14930 3800 50  0001 C CNN
F 3 "" H 14930 3800 50  0001 C CNN
	1    14730 3800
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:TEST_1P-4DigitIN12Main-rescue-4DigitIN12Main-rescue W3
U 1 1 5BDEB916
P 1650 7400
F 0 "W3" H 1650 7670 50  0000 C CNN
F 1 "GND" H 1650 7600 50  0000 C CNN
F 2 "NixieClockMaster:TESTPAD_P1-13" H 1850 7400 50  0001 C CNN
F 3 "" H 1850 7400 50  0000 C CNN
	1    1650 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 7500 1650 7400
$Comp
L WemosDecatron-rescue:C-4DigitIN12Main-rescue-4DigitIN12Main-rescue C6
U 1 1 5BDEB917
P 3000 7700
F 0 "C6" H 3025 7800 50  0000 L CNN
F 1 "100nF" H 2750 7600 50  0000 L CNN
F 2 "NixieClockMaster:C025-024X044" H 3038 7550 50  0001 C CNN
F 3 "" H 3000 7700 50  0001 C CNN
	1    3000 7700
	1    0    0    -1  
$EndComp
Text Notes 950  8150 0    70   ~ 0
Front panel components
$Comp
L WemosDecatron-rescue:WeMos_mini-4DigitIN12Main-rescue-4DigitIN12Main-rescue U2
U 1 1 5BDEB933
P 4650 8250
F 0 "U2" H 4650 8750 60  0000 C CNN
F 1 "WeMos_mini" H 4650 7750 60  0000 C CNN
F 2 "NixieClockMaster:WeMos_D1_mini_board_flipped" H 5200 7550 60  0001 C CNN
F 3 "" H 5200 7550 60  0000 C CNN
	1    4650 8250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 8400 3800 8400
Wire Wire Line
	4150 8300 3800 8300
Wire Wire Line
	3900 7900 4150 7900
Wire Wire Line
	3900 7300 3900 7450
Text Label 3900 7300 0    60   ~ 0
VCC
Wire Wire Line
	3000 8000 3350 8000
Wire Wire Line
	3350 8000 3350 8800
$Comp
L WemosDecatron-rescue:GND-power #PWR05
U 1 1 5BDEB934
P 3350 8800
F 0 "#PWR05" H 3350 8550 50  0001 C CNN
F 1 "GND" H 3350 8650 50  0000 C CNN
F 2 "" H 3350 8800 50  0001 C CNN
F 3 "" H 3350 8800 50  0001 C CNN
	1    3350 8800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 8500 5500 8500
Text Label 5500 8500 2    60   ~ 0
GPIO2
Text Label 3800 8200 0    60   ~ 0
BTN1
NoConn ~ 64050 34300
NoConn ~ 5150 8600
Text Label 3800 8100 0    60   ~ 0
PIR
Text Label 3800 8300 0    60   ~ 0
SDA
Text Label 3800 8400 0    60   ~ 0
SCL
Wire Wire Line
	1650 9400 1850 9400
Text Label 1850 9400 0    60   ~ 0
PIR
Wire Wire Line
	5150 8000 5500 8000
$Comp
L WemosDecatron-rescue:TEST_1P-4DigitIN12Main-rescue-4DigitIN12Main-rescue W1
U 1 1 5BDEB951
P 3550 7400
F 0 "W1" H 3550 7670 50  0000 C CNN
F 1 "5V" H 3550 7600 50  0000 C CNN
F 2 "NixieClockMaster:TESTPAD_P1-13" H 3750 7400 50  0001 C CNN
F 3 "" H 3750 7400 50  0000 C CNN
	1    3550 7400
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:MC34063A-4DigitIN12Main-rescue-4DigitIN12Main-rescue U4
U 1 1 5BDEB952
P 10200 4450
F 0 "U4" H 9900 5000 60  0000 L CNN
F 1 "MC34063A" H 10100 4450 60  0000 L CNN
F 2 "NixieClockMaster:MC34063_DIL8" H 10200 3950 60  0001 C CNN
F 3 "" H 10200 3950 60  0000 C CNN
	1    10200 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 4850 9550 4850
Wire Wire Line
	9550 4850 9550 5050
$Comp
L WemosDecatron-rescue:C-4DigitIN12Main-rescue-4DigitIN12Main-rescue C11
U 1 1 5BDEB953
P 10950 5050
F 0 "C11" H 10975 5150 50  0000 L CNN
F 1 "330pF" H 10700 4950 50  0000 L CNN
F 2 "NixieClockMaster:C025-024X044" H 10988 4900 50  0001 C CNN
F 3 "" H 10950 5050 50  0000 C CNN
	1    10950 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10900 4850 10950 4850
Wire Wire Line
	10950 4850 10950 4900
Wire Wire Line
	10950 5250 10950 5200
Wire Wire Line
	9700 4050 9650 4050
Wire Wire Line
	9650 3800 9650 4050
Wire Wire Line
	9400 4150 9650 4150
Wire Wire Line
	10900 4050 10950 4050
Wire Wire Line
	10950 4050 10950 3800
Wire Wire Line
	9650 3800 10950 3800
Connection ~ 9650 4050
$Comp
L WemosDecatron-rescue:R-4DigitIN12Main-rescue-4DigitIN12Main-rescue R1
U 1 1 5BDEB955
P 9650 4350
F 0 "R1" V 9730 4350 50  0000 C CNN
F 1 "0R18 2W" V 9550 4350 50  0000 C CNN
F 2 "NixieClockMaster:R_2W" V 9580 4350 50  0001 C CNN
F 3 "" H 9650 4350 50  0000 C CNN
	1    9650 4350
	1    0    0    -1  
$EndComp
Connection ~ 9650 4150
Wire Wire Line
	9650 4500 9650 4550
Connection ~ 9650 4550
Wire Wire Line
	10300 5300 10300 5250
Wire Wire Line
	9550 5250 10300 5250
Connection ~ 10300 5250
Text Label 8900 4550 0    60   ~ 0
VIN
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C9
U 1 1 5BDEB956
P 9400 4850
F 0 "C9" H 9500 4950 70  0000 L BNN
F 1 "220uF" H 9050 4700 70  0000 L BNN
F 2 "NixieClockMaster:C_Radial_D6.3_L11.2_P2.5" H 9390 4640 70  0001 L TNN
F 3 "" H 9400 4850 60  0001 C CNN
F 4 "Value" H 9250 4550 60  0001 C CNN "Fieldname"
F 5 "+" V 9377 4866 50  0000 L BNN "Field5"
	1    9400 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 4150 9400 4700
Wire Wire Line
	9400 5000 9400 5050
Wire Wire Line
	9400 5050 9550 5050
Connection ~ 9550 5050
$Comp
L WemosDecatron-rescue:R-4DigitIN12Main-rescue-4DigitIN12Main-rescue R3
U 1 1 5BDEB957
P 11150 4450
F 0 "R3" V 11050 4450 50  0000 C CNN
F 1 "1k" V 11150 4450 50  0000 C CNN
F 2 "NixieClockMaster:R-0207_2V" V 11080 4450 50  0001 C CNN
F 3 "" H 11150 4450 50  0000 C CNN
	1    11150 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11150 5250 11150 4600
Connection ~ 10950 5250
Wire Wire Line
	11150 4300 11150 4250
Wire Wire Line
	10900 4250 11150 4250
$Comp
L WemosDecatron-rescue:C-4DigitIN12Main-rescue-4DigitIN12Main-rescue C12
U 1 1 5BDEB958
P 11350 5050
F 0 "C12" H 11375 5150 50  0000 L CNN
F 1 "100nF" H 11375 4950 50  0000 L CNN
F 2 "NixieClockMaster:C025-024X044" H 11388 4900 50  0001 C CNN
F 3 "" H 11350 5050 50  0000 C CNN
	1    11350 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	11350 5250 11350 5200
Connection ~ 11150 5250
$Comp
L WemosDecatron-rescue:R-4DigitIN12Main-rescue-4DigitIN12Main-rescue R5
U 1 1 5BDEB959
P 12450 4450
F 0 "R5" V 12530 4450 50  0000 C CNN
F 1 "2k7" V 12450 4450 50  0000 C CNN
F 2 "NixieClockMaster:R-0207_2V" V 12380 4450 50  0001 C CNN
F 3 "" H 12450 4450 50  0000 C CNN
	1    12450 4450
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:POT-4DigitIN12Main-rescue-4DigitIN12Main-rescue RV1
U 1 1 5BDEB95A
P 12450 4800
F 0 "RV1" V 12275 4800 50  0000 C CNN
F 1 "1k" V 12350 4800 50  0000 C CNN
F 2 "NixieClockMaster:Potentiometer_Trimmer_Bourns_3296X" H 12450 4800 50  0001 C CNN
F 3 "" H 12450 4800 50  0000 C CNN
	1    12450 4800
	1    0    0    -1  
$EndComp
Connection ~ 11350 5250
$Comp
L WemosDecatron-rescue:R-4DigitIN12Main-rescue-4DigitIN12Main-rescue R4
U 1 1 5BDEB95B
P 12450 4050
F 0 "R4" V 12530 4050 50  0000 C CNN
F 1 "390k" V 12450 4050 50  0000 C CNN
F 2 "NixieClockMaster:R-0207_2V" V 12380 4050 50  0001 C CNN
F 3 "" H 12450 4050 50  0000 C CNN
	1    12450 4050
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:RCL_L-US6000-XXX-RC-4DigitIN12Main-rescue-4DigitIN12Main-rescue L1
U 1 1 5BDEB95C
P 11450 3800
F 0 "L1" V 11400 3750 70  0000 L BNN
F 1 "100uH" V 11600 3600 70  0000 L BNN
F 2 "NixieClockMaster:Inductor-100mH" H 11440 3590 70  0001 L TNN
F 3 "" H 11450 3800 60  0001 C CNN
	1    11450 3800
	0    -1   -1   0   
$EndComp
Connection ~ 10950 3800
$Comp
L WemosDecatron-rescue:D-RESCUE-KickstarterNixie-4DigitIN12-rescue-4DigitIN12Main-rescue D3
U 1 1 5BDEB95D
P 12150 3800
F 0 "D3" H 12150 3900 70  0000 C CNN
F 1 "UF4007" H 11850 3700 70  0000 C CNN
F 2 "NixieClockMaster:Diode_DO-41_1N4001" H 12150 3800 50  0001 C CNN
F 3 "" H 12150 3800 50  0000 C CNN
	1    12150 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	12850 3800 12850 4250
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C13
U 1 1 5BDEB95E
P 12850 4400
F 0 "C13" H 12950 4500 70  0000 L BNN
F 1 "1uF 250V" H 12900 4250 70  0000 L BNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 12840 4190 70  0001 L TNN
F 3 "" H 12850 4400 60  0001 C CNN
F 4 "Value" H 12700 4100 60  0001 C CNN "Fieldname"
F 5 "+" V 12827 4416 50  0000 L BNN "Field5"
	1    12850 4400
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:D-RESCUE-KickstarterNixie-4DigitIN12-rescue-4DigitIN12Main-rescue D2
U 1 1 5BDEB95F
P 11450 4250
F 0 "D2" H 11450 4350 70  0000 C CNN
F 1 "1N5819" H 11450 4100 50  0000 C CNN
F 2 "NixieClockMaster:Diode_DO-41_SOD81_Vertical_AnodeUp" H 11450 4250 50  0001 C CNN
F 3 "" H 11450 4250 50  0000 C CNN
	1    11450 4250
	-1   0    0    1   
$EndComp
Connection ~ 11150 4250
$Comp
L WemosDecatron-rescue:Q_PNP_EBC-4DigitIN12Main-rescue-4DigitIN12Main-rescue Q1
U 1 1 5BDEB960
P 11550 4500
F 0 "Q1" H 11700 4400 50  0000 L CNN
F 1 "2N3906" H 11300 4650 50  0000 L CNN
F 2 "NixieClockMaster:TO-92_inline_2N3906" H 11750 4600 50  0001 C CNN
F 3 "" H 11550 4500 50  0000 C CNN
	1    11550 4500
	1    0    0    1   
$EndComp
Wire Wire Line
	11600 4250 11650 4250
Wire Wire Line
	11650 4250 11650 4300
Wire Wire Line
	11250 4500 11350 4500
Wire Wire Line
	11250 4500 11250 4250
Connection ~ 11250 4250
Wire Wire Line
	10900 4750 11350 4750
Wire Wire Line
	11350 4750 11350 4900
Wire Wire Line
	11650 4700 11650 5250
Connection ~ 11650 5250
Connection ~ 11350 4750
Wire Wire Line
	11750 3800 11800 3800
$Comp
L WemosDecatron-rescue:IRF540N-RESCUE-DDIN18-4DigitIN12Main-rescue-4DigitIN12Main-rescue Q2
U 1 1 5BDEB961
P 11900 4200
F 0 "Q2" H 12100 4300 50  0000 L CNN
F 1 "IRF640" H 12000 3950 50  0000 L CNN
F 2 "NixieClockMaster:TO-220-3_H" H 12150 4125 50  0001 L CIN
F 3 "" H 11900 4200 50  0000 L CNN
	1    11900 4200
	1    0    0    -1  
$EndComp
Connection ~ 11650 4250
Wire Wire Line
	12000 4000 12000 3950
Wire Wire Line
	12000 3950 11800 3950
Wire Wire Line
	11800 3950 11800 3800
Connection ~ 11800 3800
Wire Wire Line
	12000 4400 12000 5250
Connection ~ 12850 3800
Text Label 14830 3800 0    60   ~ 0
140V
Text Notes 11450 1250 0    70   ~ 0
High Voltage Generator
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C7
U 1 1 5BDEB962
P 3550 7650
F 0 "C7" H 3600 7750 50  0000 L BNN
F 1 "220uF" H 3300 7500 50  0000 L BNN
F 2 "NixieClockMaster:C_Radial_D6.3_L11.2_P2.5" H 3540 7440 70  0001 L TNN
F 3 "" H 3550 7650 60  0001 C CNN
F 4 "Value" H 3400 7350 60  0001 C CNN "Fieldname"
F 5 "+" V 3527 7666 50  0000 L BNN "Field5"
	1    3550 7650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 7400 3550 7450
Wire Wire Line
	3000 7450 3550 7450
Connection ~ 3900 7450
Wire Wire Line
	3550 7800 3550 8000
Connection ~ 3550 8000
Wire Wire Line
	3000 8000 3000 7850
Connection ~ 3350 8000
Wire Wire Line
	3000 7550 3000 7450
Connection ~ 3550 7450
Wire Wire Line
	1550 7500 1550 7600
Connection ~ 1550 7500
Text Notes 4450 7200 0    70   ~ 0
Controller
Text Notes 1200 7000 0    70   ~ 0
Test Points
Text Label 9450 4550 0    20   ~ 0
V_PWR_IN
Text Label 10200 3800 0    20   ~ 0
V_PWR_L1
Text Label 11900 3800 0    20   ~ 0
V_PWR_D2
Text Label 12550 3800 0    20   ~ 0
V_PWR_HV
Wire Wire Line
	3800 8100 4150 8100
Wire Wire Line
	3800 8200 4150 8200
NoConn ~ 4150 8600
Text Label 5500 8000 2    60   ~ 0
G1_D
Text Notes 3600 1050 0    70   ~ 0
RTC (option)
$Comp
L WemosDecatron-rescue:DS1307+-4DigitIN12Main-rescue-4DigitIN12Main-rescue U5
U 1 1 5BE00B0C
P 3600 2250
F 0 "U5" H 3870 2800 50  0000 C CNN
F 1 "DS1307+" H 3900 1700 50  0000 C CNN
F 2 "NixieClockMaster:DS1307_DIL8" H 3600 2250 50  0001 C CNN
F 3 "" H 3600 2250 50  0001 C CNN
	1    3600 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1400 3600 1550
Text Label 3600 1400 0    60   ~ 0
VCC
$Comp
L WemosDecatron-rescue:GND-power #GND08
U 1 1 5BE00B0D
P 3600 3000
F 0 "#GND08" H 3500 2900 70  0001 L BNN
F 1 "GND" H 3500 2800 70  0000 L BNN
F 2 "" H 3600 3000 60  0001 C CNN
F 3 "" H 3600 3000 60  0001 C CNN
	1    3600 3000
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:Battery_Cell-4DigitIN12Main-rescue-4DigitIN12Main-rescue BT1
U 1 1 5BE00B0E
P 4600 2800
F 0 "BT1" H 4700 2900 50  0000 L CNN
F 1 "Battery_Cell" H 4700 2800 50  0000 L CNN
F 2 "NixieClockMaster:CR1220-CoinCell" V 4600 2860 50  0001 C CNN
F 3 "" V 4600 2860 50  0001 C CNN
	1    4600 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2600 4600 2550
Wire Wire Line
	4600 2550 4200 2550
Wire Wire Line
	3600 2950 4600 2950
Wire Wire Line
	4600 2950 4600 2900
Connection ~ 3600 2950
$Comp
L WemosDecatron-rescue:Crystal-4DigitIN12Main-rescue-4DigitIN12Main-rescue Y1
U 1 1 5BE00B0F
P 2350 2600
F 0 "Y1" H 2350 2750 50  0000 C CNN
F 1 "Crystal" H 2350 2450 50  0000 C CNN
F 2 "NixieClockMaster:Crystal_DS10_d1.0mm_l4.3mm_Vertical" H 2350 2600 50  0001 C CNN
F 3 "" H 2350 2600 50  0001 C CNN
	1    2350 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	2350 2450 2350 2400
Wire Wire Line
	2350 2400 2900 2400
Wire Wire Line
	2900 2400 2900 2450
Wire Wire Line
	2900 2450 3000 2450
Wire Wire Line
	2350 2750 2350 2800
Wire Wire Line
	2350 2800 2900 2800
Wire Wire Line
	2900 2800 2900 2650
Wire Wire Line
	2900 2650 3000 2650
Connection ~ 4600 2950
$Comp
L WemosDecatron-rescue:C-4DigitIN12Main-rescue-4DigitIN12Main-rescue C14
U 1 1 5BE00B10
P 5200 2250
F 0 "C14" H 5225 2350 50  0000 L CNN
F 1 "100nF" H 5225 2150 50  0000 L CNN
F 2 "NixieClockMaster:C025-024X044" H 5238 2100 50  0001 C CNN
F 3 "" H 5200 2250 50  0001 C CNN
	1    5200 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 2100 5200 1550
Wire Wire Line
	5200 1550 3600 1550
Connection ~ 3600 1550
Text Label 2100 1950 0    60   ~ 0
SCL
Text Label 2100 2150 0    60   ~ 0
SDA
NoConn ~ 4200 1950
Wire Wire Line
	5200 2950 5200 2400
Wire Wire Line
	3600 2850 3600 2950
Wire Notes Line
	550  6550 15950 6550
Wire Wire Line
	2900 5700 3400 5700
Wire Wire Line
	3400 5700 4200 5700
Wire Wire Line
	2500 5200 2900 5200
Wire Wire Line
	2900 5200 2900 5300
Wire Wire Line
	2900 5200 3100 5200
Wire Wire Line
	9650 4050 9650 4150
Wire Wire Line
	9650 4150 9700 4150
Wire Wire Line
	9650 4150 9650 4200
Wire Wire Line
	9650 4550 9700 4550
Wire Wire Line
	10300 5250 10950 5250
Wire Wire Line
	9550 5050 9550 5250
Wire Wire Line
	10950 5250 11150 5250
Wire Wire Line
	11150 5250 11350 5250
Wire Wire Line
	11350 5250 11650 5250
Wire Wire Line
	10950 3800 11150 3800
Wire Wire Line
	11150 4250 11250 4250
Wire Wire Line
	11250 4250 11300 4250
Wire Wire Line
	11650 5250 12000 5250
Wire Wire Line
	11350 4750 12350 4750
Wire Wire Line
	11650 4250 11700 4250
Wire Wire Line
	11800 3800 12000 3800
Wire Wire Line
	3900 7450 3900 7900
Wire Wire Line
	3550 8000 4150 8000
Wire Wire Line
	3350 8000 3550 8000
Wire Wire Line
	3550 7450 3550 7500
Wire Wire Line
	3550 7450 3900 7450
Wire Wire Line
	1550 7500 1650 7500
Wire Wire Line
	3600 2950 3600 3000
Wire Wire Line
	4600 2950 5200 2950
Wire Wire Line
	3600 1550 3600 1650
Connection ~ 4200 4700
Wire Wire Line
	5050 5700 4200 5700
Connection ~ 4200 5700
$Comp
L WemosDecatron-rescue:L7805-Regulator_Linear U3
U 1 1 5C0E3703
P 3400 5200
F 0 "U3" H 3400 5442 50  0000 C CNN
F 1 "L7805" H 3400 5351 50  0000 C CNN
F 2 "NixieClockMaster:TO-220-3_H" H 3425 5050 50  0001 L CIN
F 3 "http://www.st.com/content/ccc/resource/technical/document/datasheet/41/4f/b3/b0/12/d4/47/88/CD00000444.pdf/files/CD00000444.pdf/jcr:content/translations/en.CD00000444.pdf" H 3400 5150 50  0001 C CNN
	1    3400 5200
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:R-Device R6
U 1 1 5C1DFB53
P 2450 1550
F 0 "R6" H 2520 1596 50  0000 L CNN
F 1 "10k" H 2520 1505 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 2380 1550 50  0001 C CNN
F 3 "~" H 2450 1550 50  0001 C CNN
	1    2450 1550
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:R-Device R7
U 1 1 5C1DFC23
P 2900 1550
F 0 "R7" H 2970 1596 50  0000 L CNN
F 1 "10k" H 2970 1505 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 2830 1550 50  0001 C CNN
F 3 "~" H 2900 1550 50  0001 C CNN
	1    2900 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1550 3300 1550
Wire Wire Line
	3300 1550 3300 1300
Wire Wire Line
	3300 1300 2900 1300
Wire Wire Line
	2450 1300 2450 1400
Wire Wire Line
	2900 1400 2900 1300
Connection ~ 2900 1300
Wire Wire Line
	2900 1300 2450 1300
Wire Wire Line
	2900 1700 2900 2150
Connection ~ 2900 2150
Wire Wire Line
	2900 2150 3000 2150
Wire Wire Line
	2450 1700 2450 1950
Connection ~ 2450 1950
Wire Wire Line
	2450 1950 3000 1950
Wire Wire Line
	2100 1950 2450 1950
Wire Wire Line
	2100 2150 2900 2150
NoConn ~ 4150 8500
Wire Wire Line
	5150 8100 5500 8100
Text Label 5500 8100 2    60   ~ 0
G2_D
Wire Wire Line
	5150 8200 5500 8200
Text Label 5500 8200 2    60   ~ 0
IDX
$Comp
L Connector_Generic:Conn_01x05 J1
U 1 1 5EE09AB4
P 15050 7850
F 0 "J1" H 14968 7425 50  0000 C CNN
F 1 "Conn_01x05" H 14968 7516 50  0000 C CNN
F 2 "NixieClockMaster:Header_MA05-1" H 15050 7850 50  0001 C CNN
F 3 "~" H 15050 7850 50  0001 C CNN
	1    15050 7850
	1    0    0    -1  
$EndComp
Wire Wire Line
	14850 8050 14400 8050
Wire Wire Line
	14850 7950 14400 7950
Wire Wire Line
	14850 7850 14400 7850
Wire Wire Line
	14850 7750 14400 7750
Wire Wire Line
	14850 7650 14400 7650
Text Label 14400 7650 2    60   ~ 0
450V
Text Label 14400 8050 2    60   ~ 0
G1
Text Label 14400 7950 2    60   ~ 0
G2
Text Label 14400 7850 2    60   ~ 0
RTN
Text Label 14400 7750 2    60   ~ 0
IDX_IN
$Comp
L WemosDecatron-rescue:R-Device R8
U 1 1 5EE309E1
P 6700 8400
F 0 "R8" V 6493 8400 50  0000 C CNN
F 1 "10k" V 6584 8400 50  0000 C CNN
F 2 "NixieClockMaster:R-0207_2V" V 6630 8400 50  0001 C CNN
F 3 "~" H 6700 8400 50  0001 C CNN
	1    6700 8400
	0    1    1    0   
$EndComp
$Comp
L WemosDecatron-rescue:Q_NPN_EBC-Device Q3
U 1 1 5EE386DC
P 7150 8400
F 0 "Q3" H 7341 8446 50  0000 L CNN
F 1 "MPSA42" H 7341 8355 50  0000 L CNN
F 2 "NixieClockMaster:TO-92_inline_MPSA42" H 7350 8500 50  0001 C CNN
F 3 "~" H 7150 8400 50  0001 C CNN
	1    7150 8400
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:R-Device R9
U 1 1 5EE3AC60
P 7250 7950
F 0 "R9" H 7320 7996 50  0000 L CNN
F 1 "470k" H 7320 7905 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 7180 7950 50  0001 C CNN
F 3 "~" H 7250 7950 50  0001 C CNN
	1    7250 7950
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:GND-power #GND02
U 1 1 5EE3B5B9
P 7250 8650
F 0 "#GND02" H 7150 8550 70  0001 L BNN
F 1 "GND" H 7150 8450 70  0000 L BNN
F 2 "" H 7250 8650 60  0001 C CNN
F 3 "" H 7250 8650 60  0001 C CNN
	1    7250 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 8600 7250 8650
Wire Wire Line
	7250 8100 7250 8150
Wire Wire Line
	6850 8400 6950 8400
Wire Wire Line
	7250 7800 7250 7550
Wire Wire Line
	7250 7550 7300 7550
Text Label 7300 7550 0    60   ~ 0
110V
Wire Wire Line
	7250 8150 7650 8150
Connection ~ 7250 8150
Wire Wire Line
	7250 8150 7250 8200
Text Label 7650 8150 0    60   ~ 0
G1
Text Label 6300 8400 2    60   ~ 0
G1_D
Wire Wire Line
	6300 8400 6550 8400
$Comp
L WemosDecatron-rescue:R-Device R10
U 1 1 5EE9192E
P 8650 8400
F 0 "R10" V 8443 8400 50  0000 C CNN
F 1 "10k" V 8534 8400 50  0000 C CNN
F 2 "NixieClockMaster:R-0207_2V" V 8580 8400 50  0001 C CNN
F 3 "~" H 8650 8400 50  0001 C CNN
	1    8650 8400
	0    1    1    0   
$EndComp
$Comp
L WemosDecatron-rescue:Q_NPN_EBC-Device Q4
U 1 1 5EE91938
P 9100 8400
F 0 "Q4" H 9291 8446 50  0000 L CNN
F 1 "MPSA42" H 9291 8355 50  0000 L CNN
F 2 "NixieClockMaster:TO-92_inline_MPSA42" H 9300 8500 50  0001 C CNN
F 3 "~" H 9100 8400 50  0001 C CNN
	1    9100 8400
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:R-Device R11
U 1 1 5EE91942
P 9200 7950
F 0 "R11" H 9270 7996 50  0000 L CNN
F 1 "470k" H 9270 7905 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 9130 7950 50  0001 C CNN
F 3 "~" H 9200 7950 50  0001 C CNN
	1    9200 7950
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:GND-power #GND0101
U 1 1 5EE9194C
P 9200 8650
F 0 "#GND0101" H 9100 8550 70  0001 L BNN
F 1 "GND" H 9100 8450 70  0000 L BNN
F 2 "" H 9200 8650 60  0001 C CNN
F 3 "" H 9200 8650 60  0001 C CNN
	1    9200 8650
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 8600 9200 8650
Wire Wire Line
	9200 8100 9200 8150
Wire Wire Line
	8800 8400 8900 8400
Wire Wire Line
	9200 7800 9200 7550
Wire Wire Line
	9200 7550 9250 7550
Text Label 9250 7550 0    60   ~ 0
110V
Wire Wire Line
	9200 8150 9600 8150
Connection ~ 9200 8150
Wire Wire Line
	9200 8150 9200 8200
Text Label 9600 8150 0    60   ~ 0
G2
Text Label 8250 8400 2    60   ~ 0
G2_D
Wire Wire Line
	8250 8400 8500 8400
$Comp
L WemosDecatron-rescue:D-RESCUE-KickstarterNixie-4DigitIN12-rescue-4DigitIN12Main-rescue D7
U 1 1 5EEE310A
P 12300 3250
F 0 "D7" H 12300 3350 70  0000 C CNN
F 1 "UF4007" H 12300 3100 70  0000 C CNN
F 2 "NixieClockMaster:Diode_DO-41_1N4001" H 12300 3250 50  0001 C CNN
F 3 "" H 12300 3250 50  0000 C CNN
	1    12300 3250
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C2
U 1 1 5EEF0CBB
P 11800 3550
F 0 "C2" H 11900 3650 70  0000 L BNN
F 1 "1uF 250V" H 11250 3700 70  0000 L BNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 11790 3340 70  0001 L TNN
F 3 "" H 11800 3550 60  0001 C CNN
F 4 "Value" H 11650 3250 60  0001 C CNN "Fieldname"
F 5 "+" V 11777 3566 50  0000 L BNN "Field5"
	1    11800 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	11800 3700 11800 3800
Wire Wire Line
	11800 3400 11800 3250
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C4
U 1 1 5EF04A5D
P 12850 3000
F 0 "C4" H 12950 3100 70  0000 L BNN
F 1 "1uF 250V" H 12950 2850 70  0000 L BNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 12840 2790 70  0001 L TNN
F 3 "" H 12850 3000 60  0001 C CNN
F 4 "Value" H 12700 2700 60  0001 C CNN "Fieldname"
F 5 "+" V 12827 3016 50  0000 L BNN "Field5"
	1    12850 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 3150 12850 3250
Wire Wire Line
	12450 3250 12850 3250
Connection ~ 12850 3250
Wire Wire Line
	12850 3250 12850 3800
Wire Wire Line
	12150 3250 11800 3250
Wire Wire Line
	11800 3250 11800 2750
Wire Wire Line
	11800 2750 12150 2750
Connection ~ 11800 3250
$Comp
L WemosDecatron-rescue:D-RESCUE-KickstarterNixie-4DigitIN12-rescue-4DigitIN12Main-rescue D6
U 1 1 5EF3907F
P 12300 2750
F 0 "D6" H 12300 2850 70  0000 C CNN
F 1 "UF4007" H 12300 2600 70  0000 C CNN
F 2 "NixieClockMaster:Diode_DO-41_1N4001" H 12300 2750 50  0001 C CNN
F 3 "" H 12300 2750 50  0000 C CNN
	1    12300 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	12450 2750 12850 2750
Wire Wire Line
	12850 2750 12850 2850
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C1
U 1 1 5EF451D6
P 11800 2500
F 0 "C1" H 11900 2600 70  0000 L BNN
F 1 "1uF 250V" H 11250 2650 70  0000 L BNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 11790 2290 70  0001 L TNN
F 3 "" H 11800 2500 60  0001 C CNN
F 4 "Value" H 11650 2200 60  0001 C CNN "Fieldname"
F 5 "+" V 11777 2516 50  0000 L BNN "Field5"
	1    11800 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	11800 2650 11800 2750
Wire Wire Line
	11800 2250 11800 2350
Connection ~ 11800 2750
$Comp
L WemosDecatron-rescue:D-RESCUE-KickstarterNixie-4DigitIN12-rescue-4DigitIN12Main-rescue D5
U 1 1 5EF513C0
P 12300 2250
F 0 "D5" H 12300 2350 70  0000 C CNN
F 1 "UF4007" H 12300 2450 70  0000 C CNN
F 2 "NixieClockMaster:Diode_DO-41_1N4001" H 12300 2250 50  0001 C CNN
F 3 "" H 12300 2250 50  0000 C CNN
	1    12300 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	11800 2250 12150 2250
Wire Wire Line
	12450 2250 12850 2250
Wire Wire Line
	12850 2250 12850 2750
Connection ~ 12850 2750
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C3
U 1 1 5EF68E38
P 12850 2000
F 0 "C3" H 12950 2100 70  0000 L BNN
F 1 "1uF 250V" H 12950 1850 70  0000 L BNN
F 2 "Capacitors_THT:CP_Radial_D5.0mm_P2.50mm" H 12840 1790 70  0001 L TNN
F 3 "" H 12850 2000 60  0001 C CNN
F 4 "Value" H 12700 1700 60  0001 C CNN "Fieldname"
F 5 "+" V 12827 2016 50  0000 L BNN "Field5"
	1    12850 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	12850 2150 12850 2250
Wire Wire Line
	11800 1750 12150 1750
$Comp
L WemosDecatron-rescue:D-RESCUE-KickstarterNixie-4DigitIN12-rescue-4DigitIN12Main-rescue D4
U 1 1 5EF68E44
P 12300 1750
F 0 "D4" H 12300 1850 70  0000 C CNN
F 1 "UF4007" H 12300 1600 70  0000 C CNN
F 2 "NixieClockMaster:Diode_DO-41_1N4001" H 12300 1750 50  0001 C CNN
F 3 "" H 12300 1750 50  0000 C CNN
	1    12300 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	12450 1750 12850 1750
Wire Wire Line
	12850 1750 12850 1850
Connection ~ 12850 2250
Wire Wire Line
	11800 1750 11800 2250
Connection ~ 11800 2250
Wire Wire Line
	12850 1750 13100 1750
Connection ~ 12850 1750
Text Label 13700 1750 0    60   ~ 0
450V
$Comp
L WemosDecatron-rescue:PWR_FLAG-power #FLG0101
U 1 1 5EF9CCF4
P 1700 5650
F 0 "#FLG0101" H 1700 5745 50  0001 C CNN
F 1 "PWR_FLAG" H 1700 5830 50  0000 C CNN
F 2 "" H 1700 5650 50  0000 C CNN
F 3 "" H 1700 5650 50  0000 C CNN
	1    1700 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 5650 1700 5700
Connection ~ 1700 5700
Wire Wire Line
	1700 5700 2900 5700
$Comp
L WemosDecatron-rescue:R-Device R12
U 1 1 5EFADF21
P 13550 4100
F 0 "R12" H 13620 4146 50  0000 L CNN
F 1 "33k" H 13620 4055 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 13480 4100 50  0001 C CNN
F 3 "~" H 13550 4100 50  0001 C CNN
	1    13550 4100
	1    0    0    -1  
$EndComp
Connection ~ 14730 3800
Wire Wire Line
	14730 3800 14830 3800
Wire Wire Line
	13550 3950 13550 3800
$Comp
L WemosDecatron-rescue:R-Device R13
U 1 1 5EFC5E2B
P 13550 4550
F 0 "R13" H 13620 4596 50  0000 L CNN
F 1 "47k" H 13620 4505 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 13480 4550 50  0001 C CNN
F 3 "~" H 13550 4550 50  0001 C CNN
	1    13550 4550
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:R-Device R14
U 1 1 5EFC6523
P 13550 5170
F 0 "R14" H 13620 5216 50  0000 L CNN
F 1 "47k" H 13620 5125 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 13480 5170 50  0001 C CNN
F 3 "~" H 13550 5170 50  0001 C CNN
	1    13550 5170
	1    0    0    -1  
$EndComp
Text Label 14830 4340 0    60   ~ 0
110V
$Comp
L WemosDecatron-rescue:TEST_1P-4DigitIN12Main-rescue-4DigitIN12Main-rescue W5
U 1 1 5EFF67B0
P 14730 4290
F 0 "W5" H 14730 4560 50  0000 C CNN
F 1 "110V" H 14730 4490 50  0000 C CNN
F 2 "NixieClockMaster:TESTPAD_P1-13" H 14930 4290 50  0001 C CNN
F 3 "" H 14930 4290 50  0001 C CNN
	1    14730 4290
	1    0    0    -1  
$EndComp
Wire Wire Line
	14730 4290 14730 4340
Connection ~ 14730 4340
Wire Wire Line
	14730 4340 14830 4340
Text Label 14840 4860 0    60   ~ 0
RTN
$Comp
L WemosDecatron-rescue:TEST_1P-4DigitIN12Main-rescue-4DigitIN12Main-rescue W6
U 1 1 5F0118D5
P 14740 4810
F 0 "W6" H 14740 5080 50  0000 C CNN
F 1 "55V" H 14740 5010 50  0000 C CNN
F 2 "NixieClockMaster:TESTPAD_P1-13" H 14940 4810 50  0001 C CNN
F 3 "" H 14940 4810 50  0001 C CNN
	1    14740 4810
	1    0    0    -1  
$EndComp
Wire Wire Line
	14740 4810 14740 4860
Connection ~ 14740 4860
Wire Wire Line
	14740 4860 14840 4860
Wire Notes Line
	7400 6550 7400 500 
Text Notes 7850 7250 0    70   ~ 0
Guides
Wire Notes Line
	550  3500 7350 3500
Text Notes 11750 7150 0    70   ~ 0
Index
$Comp
L WemosDecatron-rescue:EL817-Isolator U1
U 1 1 5F0B4902
P 11650 8100
F 0 "U1" H 11650 8425 50  0000 C CNN
F 1 "EL817" H 11650 8334 50  0000 C CNN
F 2 "NixieClockMaster:optocoupler-DIL04" H 11450 7900 50  0001 L CIN
F 3 "http://www.everlight.com/file/ProductFile/EL817.pdf" H 11650 8100 50  0001 L CNN
	1    11650 8100
	1    0    0    -1  
$EndComp
Wire Wire Line
	11350 8200 10900 8200
Text Label 10900 8200 0    60   ~ 0
RTN
Text Label 10900 8000 0    60   ~ 0
IDX_IN
Wire Wire Line
	10900 8000 11350 8000
$Comp
L WemosDecatron-rescue:GND-power #GND03
U 1 1 5F0D02EF
P 12050 8300
F 0 "#GND03" H 11950 8200 70  0001 L BNN
F 1 "GND" H 11950 8100 70  0000 L BNN
F 2 "" H 12050 8300 60  0001 C CNN
F 3 "" H 12050 8300 60  0001 C CNN
	1    12050 8300
	1    0    0    -1  
$EndComp
Wire Wire Line
	11950 8200 12050 8200
Wire Wire Line
	12050 8200 12050 8300
$Comp
L WemosDecatron-rescue:R-Device R15
U 1 1 5F0DDBEA
P 12050 7700
F 0 "R15" H 12120 7746 50  0000 L CNN
F 1 "220k" H 12120 7655 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 11980 7700 50  0001 C CNN
F 3 "~" H 12050 7700 50  0001 C CNN
	1    12050 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	11950 8000 12050 8000
Wire Wire Line
	12050 8000 12050 7850
Wire Wire Line
	12050 7550 12050 7350
Wire Wire Line
	12050 7350 12300 7350
Wire Wire Line
	12050 8000 12300 8000
Connection ~ 12050 8000
Text Label 12300 8000 0    60   ~ 0
IDX
Text Label 12300 7350 0    60   ~ 0
3V3
Wire Wire Line
	5150 7900 5500 7900
Text Label 5500 7900 2    60   ~ 0
3V3
Text Notes 14250 7150 0    70   ~ 0
Decatron output
Wire Notes Line
	10150 6550 10150 11200
Wire Notes Line
	5800 6550 5800 11200
Wire Notes Line
	2500 6550 2500 11200
Wire Notes Line
	13400 6550 13400 9950
$Comp
L Mechanical:MountingHole H1
U 1 1 5ED87E11
P 10850 10150
F 0 "H1" H 10950 10196 50  0000 L CNN
F 1 "MountingHole" H 10950 10105 50  0000 L CNN
F 2 "NixieClockMaster:MountingHole_3.2mm_M3" H 10850 10150 50  0001 C CNN
F 3 "~" H 10850 10150 50  0001 C CNN
	1    10850 10150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5ED88600
P 10850 10350
F 0 "H2" H 10950 10396 50  0000 L CNN
F 1 "MountingHole" H 10950 10305 50  0000 L CNN
F 2 "NixieClockMaster:MountingHole_3.2mm_M3" H 10850 10350 50  0001 C CNN
F 3 "~" H 10850 10350 50  0001 C CNN
	1    10850 10350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5ED961E5
P 10850 10550
F 0 "H3" H 10950 10596 50  0000 L CNN
F 1 "MountingHole" H 10950 10505 50  0000 L CNN
F 2 "NixieClockMaster:MountingHole_3.2mm_M3" H 10850 10550 50  0001 C CNN
F 3 "~" H 10850 10550 50  0001 C CNN
	1    10850 10550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5ED961EF
P 10850 10750
F 0 "H4" H 10950 10796 50  0000 L CNN
F 1 "MountingHole" H 10950 10705 50  0000 L CNN
F 2 "NixieClockMaster:MountingHole_3.2mm_M3" H 10850 10750 50  0001 C CNN
F 3 "~" H 10850 10750 50  0001 C CNN
	1    10850 10750
	1    0    0    -1  
$EndComp
$Comp
L WemosDecatron-rescue:TEST_1P-4DigitIN12Main-rescue-4DigitIN12Main-rescue W7
U 1 1 5EDCFFD3
P 13100 1650
F 0 "W7" H 13100 1920 50  0000 C CNN
F 1 "400V" H 13100 1850 50  0000 C CNN
F 2 "NixieClockMaster:TESTPAD_P1-13" H 13300 1650 50  0001 C CNN
F 3 "" H 13300 1650 50  0001 C CNN
	1    13100 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	13100 1650 13100 1750
Wire Wire Line
	1650 9300 1850 9300
Text Label 1850 9300 0    60   ~ 0
GPIO2
$Comp
L Connector_Generic:Conn_01x08 J2
U 1 1 5EE19E6E
P 1450 9400
F 0 "J2" H 1368 8775 50  0000 C CNN
F 1 "Conn_01x08" H 1368 8866 50  0000 C CNN
F 2 "NixieClockMaster:Header_MA08-1" H 1450 9400 50  0001 C CNN
F 3 "~" H 1450 9400 50  0001 C CNN
	1    1450 9400
	-1   0    0    1   
$EndComp
Wire Wire Line
	1650 9200 1850 9200
Wire Wire Line
	1650 9100 1850 9100
Text Label 1850 9100 0    60   ~ 0
VCC
Text Label 1850 9000 0    60   ~ 0
3V3
Wire Wire Line
	5150 8300 5500 8300
Text Label 5500 8400 2    60   ~ 0
GPIO1
Wire Wire Line
	1650 9000 1850 9000
Text Label 1850 9200 0    60   ~ 0
GPIO1
Wire Wire Line
	5150 8400 5500 8400
Text Label 5500 8300 2    60   ~ 0
HV_EN
$Comp
L WemosDecatron-rescue:TEST_1P-4DigitIN12Main-rescue-4DigitIN12Main-rescue W8
U 1 1 5ED8C1CD
P 9150 4500
F 0 "W8" H 9150 4770 50  0000 C CNN
F 1 "VIN" H 9150 4700 50  0000 C CNN
F 2 "NixieClockMaster:TESTPAD_P1-13" H 9350 4500 50  0001 C CNN
F 3 "" H 9350 4500 50  0001 C CNN
	1    9150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 4550 9150 4550
Wire Wire Line
	9150 4500 9150 4550
Connection ~ 9150 4550
Wire Wire Line
	9150 4550 9650 4550
$Comp
L WemosDecatron-rescue:R-Device R16
U 1 1 5F04D475
P 13350 1750
F 0 "R16" V 13350 1700 50  0000 L CNN
F 1 "470k" V 13450 1650 50  0000 L CNN
F 2 "NixieClockMaster:R-0207_2V" V 13280 1750 50  0001 C CNN
F 3 "~" H 13350 1750 50  0001 C CNN
	1    13350 1750
	0    1    1    0   
$EndComp
Wire Wire Line
	12300 3800 12450 3800
Wire Wire Line
	12450 4200 12450 4250
Wire Wire Line
	12450 4250 12350 4250
Wire Wire Line
	12350 4250 12350 4750
Connection ~ 12450 4250
Wire Wire Line
	12450 4250 12450 4300
Wire Wire Line
	12600 4800 12600 4950
Wire Wire Line
	12600 4950 12450 4950
Wire Wire Line
	12450 4600 12450 4650
$Comp
L WemosDecatron-rescue:Q_NJFET_SGD-Device Q5
U 1 1 5F0A622C
P 12350 5200
F 0 "Q5" H 12541 5246 50  0000 L CNN
F 1 "2N7000" H 12541 5155 50  0000 L CNN
F 2 "NixieClockMaster:TO-92_inline_2N7000" H 12550 5300 50  0001 C CNN
F 3 "~" H 12350 5200 50  0001 C CNN
	1    12350 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	12450 5000 12450 4950
Connection ~ 12450 4950
Wire Wire Line
	12450 5400 12450 5550
Wire Wire Line
	12450 5550 12000 5550
Wire Wire Line
	12000 5550 12000 5250
Connection ~ 12000 5250
Wire Wire Line
	12450 5550 12850 5550
Wire Wire Line
	12850 4550 12850 5550
Connection ~ 12450 5550
Wire Wire Line
	12850 5550 13550 5550
Wire Wire Line
	13550 5320 13550 5550
Connection ~ 12850 5550
$Comp
L WemosDecatron-rescue:GND-power #GND07
U 1 1 5BDEB954
P 10300 5300
F 0 "#GND07" H 10200 5200 70  0001 L BNN
F 1 "GND" H 10200 5100 70  0000 L BNN
F 2 "" H 10300 5300 60  0001 C CNN
F 3 "" H 10300 5300 60  0001 C CNN
	1    10300 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	12150 5200 12100 5200
Wire Wire Line
	12100 5200 12100 5450
Text Label 11550 5450 0    60   ~ 0
HV_EN
Wire Wire Line
	11550 5450 12100 5450
Text Label 1850 9600 0    65   ~ 0
GND
Wire Wire Line
	12450 3900 12450 3800
Connection ~ 12450 3800
Wire Wire Line
	12450 3800 12850 3800
Wire Wire Line
	13100 1750 13200 1750
Connection ~ 13100 1750
Wire Wire Line
	13500 1750 13700 1750
$Comp
L WemosDecatron-rescue:SolderJumper_2_Open-Jumper JP1
U 1 1 5F3529BC
P 1450 10500
F 0 "JP1" H 1450 10705 50  0000 C CNN
F 1 "HV Test Enable" H 1450 10614 50  0000 C CNN
F 2 "NixieClockMaster:SOLDER-JUMPER" H 1450 10500 50  0001 C CNN
F 3 "~" H 1450 10500 50  0001 C CNN
	1    1450 10500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 10500 2000 10500
Wire Wire Line
	1300 10500 900  10500
Text Label 2000 10500 0    60   ~ 0
VCC
Text Label 900  10500 2    60   ~ 0
HV_EN
Wire Wire Line
	4200 4700 5050 4700
Wire Wire Line
	13550 4250 13550 4340
Connection ~ 13550 5550
Wire Wire Line
	13550 4700 13550 4860
Connection ~ 13550 4860
Wire Wire Line
	13550 4860 13550 5020
Wire Wire Line
	13550 4860 14090 4860
Wire Wire Line
	13550 4340 14090 4340
Connection ~ 13550 4340
Wire Wire Line
	13550 4340 13550 4400
Wire Wire Line
	13550 5550 14090 5550
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C15
U 1 1 60E145AD
P 14090 5220
F 0 "C15" H 14190 5320 70  0000 L BNN
F 1 "1uF 100V" H 14140 5070 70  0000 L BNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 14080 5010 70  0001 L TNN
F 3 "" H 14090 5220 60  0001 C CNN
F 4 "Value" H 13940 4920 60  0001 C CNN "Fieldname"
F 5 "+" V 14067 5236 50  0000 L BNN "Field5"
	1    14090 5220
	1    0    0    -1  
$EndComp
Wire Wire Line
	14090 5070 14090 4860
Connection ~ 14090 4860
Wire Wire Line
	14090 5370 14090 5550
$Comp
L WemosDecatron-rescue:CP-4DigitIN12Main-rescue-4DigitIN12Main-rescue C5
U 1 1 60E3435B
P 14090 4590
F 0 "C5" H 14190 4690 70  0000 L BNN
F 1 "1uF 100V" H 14140 4440 70  0000 L BNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 14080 4380 70  0001 L TNN
F 3 "" H 14090 4590 60  0001 C CNN
F 4 "Value" H 13940 4290 60  0001 C CNN "Fieldname"
F 5 "+" V 14067 4606 50  0000 L BNN "Field5"
	1    14090 4590
	1    0    0    -1  
$EndComp
Wire Wire Line
	14090 4740 14090 4860
Wire Wire Line
	14090 4440 14090 4340
Wire Wire Line
	13550 3800 14730 3800
Connection ~ 13550 3800
Wire Wire Line
	14090 4340 14730 4340
Connection ~ 14090 4340
Wire Wire Line
	14090 4860 14740 4860
Wire Wire Line
	12850 3800 13550 3800
$EndSCHEMATC
