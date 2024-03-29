EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Hushbox Control"
Date "2020-11-16"
Rev "1.1"
Comp "pixelplastic.de"
Comment1 "Marcel Hoyer"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Barrel_Jack_MountingPin J1
U 1 1 5F9F856C
P 1050 1600
F 0 "J1" H 900 1800 50  0000 C CNN
F 1 "Barrel_Jack_MountingPin" H 1050 1200 50  0000 C CNN
F 2 "Connector_BarrelJack:BarrelJack_Horizontal" H 1100 1560 50  0001 C CNN
F 3 "~" H 1100 1560 50  0001 C CNN
	1    1050 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3350 1400 3500 1400
$Comp
L Device:C C2
U 1 1 5FA02A69
P 3500 1550
F 0 "C2" H 3615 1596 50  0000 L CNN
F 1 "100n" H 3600 1500 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3538 1400 50  0001 C CNN
F 3 "~" H 3500 1550 50  0001 C CNN
	1    3500 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1
U 1 1 5FA02F76
P 2500 1550
F 0 "C1" H 2615 1596 50  0000 L CNN
F 1 "100n" H 2615 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2538 1400 50  0001 C CNN
F 3 "~" H 2500 1550 50  0001 C CNN
	1    2500 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR02
U 1 1 5FA04FF7
P 4350 1950
F 0 "#PWR02" H 4350 1800 50  0001 C CNN
F 1 "+3.3V" H 4365 2123 50  0000 C CNN
F 2 "" H 4350 1950 50  0001 C CNN
F 3 "" H 4350 1950 50  0001 C CNN
	1    4350 1950
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR01
U 1 1 5FA0547C
P 1450 1050
F 0 "#PWR01" H 1450 900 50  0001 C CNN
F 1 "+12V" H 1465 1223 50  0000 C CNN
F 2 "" H 1450 1050 50  0001 C CNN
F 3 "" H 1450 1050 50  0001 C CNN
	1    1450 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5FA0FAA0
P 4350 4050
F 0 "#PWR03" H 4350 3800 50  0001 C CNN
F 1 "GND" H 4355 3877 50  0000 C CNN
F 2 "" H 4350 4050 50  0001 C CNN
F 3 "" H 4350 4050 50  0001 C CNN
	1    4350 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R6
U 1 1 5FFE0A47
P 5850 3950
F 0 "R6" V 5750 3850 50  0000 C CNN
F 1 "100" V 5750 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5780 3950 50  0001 C CNN
F 3 "~" H 5850 3950 50  0001 C CNN
	1    5850 3950
	0    1    1    0   
$EndComp
$Comp
L Device:D D2
U 1 1 5FFE0A4D
P 5950 3400
F 0 "D2" H 5950 3300 50  0000 C CNN
F 1 "1N4001" H 5700 3350 50  0000 C CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 5950 3400 50  0001 C CNN
F 3 "~" H 5950 3400 50  0001 C CNN
	1    5950 3400
	-1   0    0    1   
$EndComp
$Comp
L Device:R R8
U 1 1 5FFE0A5A
P 7000 4150
F 0 "R8" V 6900 4250 50  0000 C CNN
F 1 "10k" V 6900 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6930 4150 50  0001 C CNN
F 3 "~" H 7000 4150 50  0001 C CNN
	1    7000 4150
	0    -1   -1   0   
$EndComp
$Comp
L Transistor_FET:IRLML2060 Q2
U 1 1 5FFE0A6C
P 7200 3950
F 0 "Q2" H 7400 4050 50  0000 L CNN
F 1 "IRLML2502" H 7400 3800 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7400 3875 50  0001 L CIN
F 3 "https://www.infineon.com/dgdl/irlml2060pbf.pdf?fileId=5546d462533600a401535664b7fb25ee" H 7200 3950 50  0001 L CNN
	1    7200 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4150 7300 4150
$Comp
L power:GND #PWR08
U 1 1 5FFE0A7A
P 6400 4800
F 0 "#PWR08" H 6400 4550 50  0001 C CNN
F 1 "GND" H 6405 4627 50  0000 C CNN
F 2 "" H 6400 4800 50  0001 C CNN
F 3 "" H 6400 4800 50  0001 C CNN
	1    6400 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5FFE0A80
P 7300 4450
F 0 "#PWR012" H 7300 4200 50  0001 C CNN
F 1 "GND" H 7305 4277 50  0000 C CNN
F 2 "" H 7300 4450 50  0001 C CNN
F 3 "" H 7300 4450 50  0001 C CNN
	1    7300 4450
	1    0    0    -1  
$EndComp
Connection ~ 7300 4150
Wire Wire Line
	7300 4450 7300 4150
$Comp
L power:+12V #PWR010
U 1 1 5FFE0A97
P 7300 3200
F 0 "#PWR010" H 7300 3050 50  0001 C CNN
F 1 "+12V" H 7315 3373 50  0000 C CNN
F 2 "" H 7300 3200 50  0001 C CNN
F 3 "" H 7300 3200 50  0001 C CNN
	1    7300 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R2
U 1 1 5FFE0AA4
P 5650 3150
F 0 "R2" V 5550 3050 50  0000 C CNN
F 1 "4.7k" V 5550 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5580 3150 50  0001 C CNN
F 3 "~" H 5650 3150 50  0001 C CNN
	1    5650 3150
	-1   0    0    1   
$EndComp
$Comp
L power:+3.3V #PWR04
U 1 1 5FFE0A9E
P 5650 3000
F 0 "#PWR04" H 5650 2850 50  0001 C CNN
F 1 "+3.3V" H 5665 3173 50  0000 C CNN
F 2 "" H 5650 3000 50  0001 C CNN
F 3 "" H 5650 3000 50  0001 C CNN
	1    5650 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 3300 5650 3400
Wire Wire Line
	5650 3400 5800 3400
Wire Wire Line
	4950 2600 5500 2600
Wire Wire Line
	4950 3000 5300 3000
$Comp
L Sensor_Temperature:DS18B20 U4
U 1 1 601BC310
P 6750 2700
F 0 "U4" H 6950 2450 50  0000 R CNN
F 1 "DS18B20" H 6700 2450 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 5750 2450 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS18B20.pdf" H 6600 2950 50  0001 C CNN
	1    6750 2700
	-1   0    0    -1  
$EndComp
$Comp
L Motor:Fan_Tacho_PWM M2
U 1 1 601DC0E5
P 7300 3500
F 0 "M2" H 7458 3596 50  0000 L CNN
F 1 "Fan_Tacho_PWM" H 7500 3750 50  0000 L CNN
F 2 "Connector:FanPinHeader_1x04_P2.54mm_Vertical" H 7300 3510 50  0001 C CNN
F 3 "http://www.formfactors.org/developer%5Cspecs%5Crev1_2_public.pdf" H 7300 3510 50  0001 C CNN
	1    7300 3500
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 602C6241
P 1450 1200
F 0 "#FLG0101" H 1450 1275 50  0001 C CNN
F 1 "PWR_FLAG" V 1450 1327 50  0000 L CNN
F 2 "" H 1450 1200 50  0001 C CNN
F 3 "~" H 1450 1200 50  0001 C CNN
	1    1450 1200
	0    -1   -1   0   
$EndComp
Connection ~ 1450 1200
Wire Wire Line
	1450 1200 1450 1500
Wire Wire Line
	1450 1050 1450 1200
$Comp
L power:GND #PWR013
U 1 1 603F01BF
P 2500 1700
F 0 "#PWR013" H 2500 1450 50  0001 C CNN
F 1 "GND" H 2505 1527 50  0000 C CNN
F 2 "" H 2500 1700 50  0001 C CNN
F 3 "" H 2500 1700 50  0001 C CNN
	1    2500 1700
	1    0    0    -1  
$EndComp
Connection ~ 2500 1700
Connection ~ 2500 1400
Wire Wire Line
	2500 1400 2750 1400
$Comp
L Switch:SW_SPST SW1
U 1 1 606A740F
P 1800 1400
F 0 "SW1" H 1800 1650 50  0000 C CNN
F 1 "SW_SPST" H 1800 1544 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 1800 1400 50  0001 C CNN
F 3 "~" H 1800 1400 50  0001 C CNN
	1    1800 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1600 1500 1600 1400
Wire Wire Line
	5400 1800 5400 2200
Wire Wire Line
	7000 1800 5400 1800
Wire Wire Line
	6000 1600 7000 1600
$Comp
L power:+3.3V #PWR014
U 1 1 607CB7E3
P 5300 1250
F 0 "#PWR014" H 5300 1100 50  0001 C CNN
F 1 "+3.3V" H 5315 1423 50  0000 C CNN
F 2 "" H 5300 1250 50  0001 C CNN
F 3 "" H 5300 1250 50  0001 C CNN
	1    5300 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5FEBA9CF
P 5300 1400
F 0 "R1" V 5200 1300 50  0000 C CNN
F 1 "4.7k" V 5200 1500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5230 1400 50  0001 C CNN
F 3 "~" H 5300 1400 50  0001 C CNN
	1    5300 1400
	-1   0    0    1   
$EndComp
$Comp
L power:+12V #PWR09
U 1 1 5FE9F6EC
P 7300 1400
F 0 "#PWR09" H 7300 1250 50  0001 C CNN
F 1 "+12V" H 7315 1573 50  0000 C CNN
F 2 "" H 7300 1400 50  0001 C CNN
F 3 "" H 7300 1400 50  0001 C CNN
	1    7300 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 5FA5D842
P 5850 1600
F 0 "D1" H 5850 1383 50  0000 C CNN
F 1 "1N4001" H 5850 1474 50  0000 C CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 5850 1600 50  0001 C CNN
F 3 "~" H 5850 1600 50  0001 C CNN
	1    5850 1600
	-1   0    0    1   
$EndComp
$Comp
L Motor:Fan_Tacho_PWM M1
U 1 1 5F9F0A6B
P 7300 1700
F 0 "M1" H 7458 1796 50  0000 L CNN
F 1 "Fan_Tacho_PWM" H 7500 1950 50  0000 L CNN
F 2 "Connector:FanPinHeader_1x04_P2.54mm_Vertical" H 7300 1710 50  0001 C CNN
F 3 "http://www.formfactors.org/developer%5Cspecs%5Crev1_2_public.pdf" H 7300 1710 50  0001 C CNN
	1    7300 1700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3950 5300 3950
Wire Wire Line
	5300 3000 5300 3950
Wire Wire Line
	6700 3950 6700 4150
Wire Wire Line
	6700 4150 6850 4150
Connection ~ 6700 3950
Wire Wire Line
	6700 3950 7000 3950
Wire Wire Line
	6000 3950 6700 3950
Wire Wire Line
	5650 3400 5500 3400
Wire Wire Line
	5500 3400 5500 2900
Connection ~ 5650 3400
Wire Wire Line
	6100 3400 7000 3400
Wire Wire Line
	7000 3600 5400 3600
Wire Wire Line
	7300 3700 7300 3750
Wire Wire Line
	5500 2150 5500 2600
$Comp
L power:GND #PWR06
U 1 1 5FDED353
P 6750 3000
F 0 "#PWR06" H 6750 2750 50  0001 C CNN
F 1 "GND" H 6755 2827 50  0000 C CNN
F 2 "" H 6750 3000 50  0001 C CNN
F 3 "" H 6750 3000 50  0001 C CNN
	1    6750 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2150 7000 2150
Wire Wire Line
	6700 2350 6700 2150
Wire Wire Line
	6850 2350 6700 2350
Connection ~ 6700 2150
Wire Wire Line
	6000 2150 6700 2150
$Comp
L Sensor_Temperature:DS18B20 U3
U 1 1 5FE0841F
P 6150 2700
F 0 "U3" H 6350 2950 50  0000 R CNN
F 1 "DS18B20" H 6100 2950 50  0000 R CNN
F 2 "Connector_JST:JST_XH_B3B-XH-A_1x03_P2.50mm_Vertical" H 5150 2450 50  0001 C CNN
F 3 "http://datasheets.maximintegrated.com/en/ds/DS18B20.pdf" H 6000 2950 50  0001 C CNN
	1    6150 2700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7300 2650 7300 2350
Connection ~ 7300 2350
$Comp
L power:GND #PWR011
U 1 1 5FDEF9F7
P 7300 2650
F 0 "#PWR011" H 7300 2400 50  0001 C CNN
F 1 "GND" H 7305 2477 50  0000 C CNN
F 2 "" H 7300 2650 50  0001 C CNN
F 3 "" H 7300 2650 50  0001 C CNN
	1    7300 2650
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR05
U 1 1 5FDD5A44
P 5600 2400
F 0 "#PWR05" H 5600 2250 50  0001 C CNN
F 1 "+3.3V" H 5615 2573 50  0000 C CNN
F 2 "" H 5600 2400 50  0001 C CNN
F 3 "" H 5600 2400 50  0001 C CNN
	1    5600 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2350 7300 2350
Wire Wire Line
	5700 2150 5500 2150
$Comp
L Transistor_FET:IRLML2060 Q1
U 1 1 5FA13676
P 7200 2150
F 0 "Q1" H 7400 2250 50  0000 L CNN
F 1 "IRLML2502" H 7400 2000 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 7400 2075 50  0001 L CIN
F 3 "https://www.infineon.com/dgdl/irlml2060pbf.pdf?fileId=5546d462533600a401535664b7fb25ee" H 7200 2150 50  0001 L CNN
	1    7200 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5FA553A6
P 7000 2350
F 0 "R7" V 6900 2450 50  0000 C CNN
F 1 "10k" V 6900 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6930 2350 50  0001 C CNN
F 3 "~" H 7000 2350 50  0001 C CNN
	1    7000 2350
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5FAD7EE9
P 5600 2550
F 0 "R4" V 5500 2450 50  0000 C CNN
F 1 "1k" V 5500 2600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5530 2550 50  0001 C CNN
F 3 "~" H 5600 2550 50  0001 C CNN
	1    5600 2550
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 5FA52A18
P 5850 2150
F 0 "R3" V 5750 2050 50  0000 C CNN
F 1 "100" V 5750 2250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5780 2150 50  0001 C CNN
F 3 "~" H 5850 2150 50  0001 C CNN
	1    5850 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 1600 5700 1600
Connection ~ 5300 1600
Wire Wire Line
	5300 1600 5300 1550
Wire Wire Line
	7300 1900 7300 1950
NoConn ~ 4950 2400
NoConn ~ 4950 2500
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 602E2DC3
P 4350 3950
F 0 "#FLG0102" H 4350 4025 50  0001 C CNN
F 1 "PWR_FLAG" V 4350 4078 50  0000 L CNN
F 2 "" H 4350 3950 50  0001 C CNN
F 3 "~" H 4350 3950 50  0001 C CNN
	1    4350 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	4150 3700 4150 3800
Wire Wire Line
	4150 3800 4350 3800
Wire Wire Line
	4350 3800 4350 3950
Wire Wire Line
	4350 3700 4350 3800
Connection ~ 4350 3800
Wire Wire Line
	5400 2800 4950 2800
Wire Wire Line
	5400 2800 5400 3600
Wire Wire Line
	5500 2900 4950 2900
Wire Wire Line
	5300 2300 4950 2300
Wire Wire Line
	5300 1600 5300 2300
Wire Wire Line
	4950 2200 5400 2200
Wire Wire Line
	3400 2200 3550 2200
Wire Wire Line
	3400 2300 3550 2300
Wire Wire Line
	3550 2400 3400 2400
Wire Wire Line
	3400 2500 3550 2500
Wire Wire Line
	3550 2600 3400 2600
Wire Wire Line
	3550 2800 3400 2800
Wire Wire Line
	3400 2900 3550 2900
Wire Wire Line
	3550 3000 3400 3000
Wire Wire Line
	3550 3200 3400 3200
Wire Wire Line
	3400 3300 3550 3300
Wire Wire Line
	3550 3400 3400 3400
Wire Wire Line
	3400 3500 3550 3500
Wire Wire Line
	3550 3500 3550 3800
Wire Wire Line
	3550 3800 4150 3800
Connection ~ 4150 3800
Wire Wire Line
	3400 3600 3400 3700
Wire Wire Line
	3400 3700 3150 3700
Wire Wire Line
	3150 3700 3150 1900
Wire Wire Line
	3400 2700 3550 2700
Wire Wire Line
	3400 3100 3550 3100
$Comp
L Connector:Conn_01x15_Male J2
U 1 1 5FC0AF8C
P 3200 2900
F 0 "J2" H 3308 3781 50  0000 C CNN
F 1 "Conn_01x15_Male" V 3100 2900 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x15_P2.54mm_Vertical" H 3200 2900 50  0001 C CNN
F 3 "~" H 3200 2900 50  0001 C CNN
	1    3200 2900
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5FB49AC3
P 6050 5700
F 0 "#PWR018" H 6050 5450 50  0001 C CNN
F 1 "GND" H 6055 5527 50  0000 C CNN
F 2 "" H 6050 5700 50  0001 C CNN
F 3 "" H 6050 5700 50  0001 C CNN
	1    6050 5700
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5700 6100 5700
$Comp
L power:+3.3V #PWR017
U 1 1 5FB5181A
P 6050 5200
F 0 "#PWR017" H 6050 5050 50  0001 C CNN
F 1 "+3.3V" H 6065 5373 50  0000 C CNN
F 2 "" H 6050 5200 50  0001 C CNN
F 3 "" H 6050 5200 50  0001 C CNN
	1    6050 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 5300 6050 5200
Wire Wire Line
	6100 5300 6050 5300
Wire Wire Line
	5950 5500 6100 5500
$Comp
L Interface_Optical:TSDP341xx U5
U 1 1 5FB1E964
P 6500 5500
F 0 "U5" H 6750 5800 50  0000 R CNN
F 1 "TSDP341xx" H 6500 5200 50  0000 R CNN
F 2 "Connector_JST:JST_XH_S3B-XH-A_1x03_P2.50mm_Horizontal" H 6450 5125 50  0001 C CNN
F 3 "http://www.vishay.com/docs/82667/tsdp341.pdf" H 7150 5800 50  0001 C CNN
	1    6500 5500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5100 3200 4950 3200
Wire Wire Line
	5100 3200 5100 4650
$Comp
L Transistor_BJT:MMBT3904 Q3
U 1 1 5FB86D20
P 5200 6000
F 0 "Q3" H 5391 6046 50  0000 L CNN
F 1 "MMBT3904" H 5391 5955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5400 5925 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 5200 6000 50  0001 L CNN
	1    5200 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R9
U 1 1 5FB8F08F
P 5000 4300
F 0 "R9" V 4900 4200 50  0000 C CNN
F 1 "330" V 4900 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4930 4300 50  0001 C CNN
F 3 "~" H 5000 4300 50  0001 C CNN
	1    5000 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 4150 5000 3300
Wire Wire Line
	5000 3300 4950 3300
Connection ~ 4350 3950
Wire Wire Line
	4350 3950 4350 4050
$Comp
L power:GND #PWR016
U 1 1 5FBEF3A6
P 5300 6200
F 0 "#PWR016" H 5300 5950 50  0001 C CNN
F 1 "GND" H 5305 6027 50  0000 C CNN
F 2 "" H 5300 6200 50  0001 C CNN
F 3 "" H 5300 6200 50  0001 C CNN
	1    5300 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5500 5950 4650
Wire Wire Line
	5950 4650 5100 4650
$Comp
L Device:R R10
U 1 1 5FC4E489
P 5300 5350
F 0 "R10" V 5200 5250 50  0000 C CNN
F 1 "20" V 5200 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5230 5350 50  0001 C CNN
F 3 "~" H 5300 5350 50  0001 C CNN
	1    5300 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR015
U 1 1 5FC4F504
P 5300 5200
F 0 "#PWR015" H 5300 5050 50  0001 C CNN
F 1 "+3.3V" H 5315 5373 50  0000 C CNN
F 2 "" H 5300 5200 50  0001 C CNN
F 3 "" H 5300 5200 50  0001 C CNN
	1    5300 5200
	1    0    0    -1  
$EndComp
$Comp
L LED:LD271 D3
U 1 1 5FC501B9
P 5300 5600
F 0 "D3" V 5296 5520 50  0000 R CNN
F 1 "LD271" V 5205 5520 50  0000 R CNN
F 2 "Connector_JST:JST_XH_S2B-XH-A_1x02_P2.50mm_Horizontal" H 5300 5775 50  0001 C CNN
F 3 "http://www.alliedelec.com/m/d/40788c34903a719969df15f1fbea1056.pdf" H 5250 5600 50  0001 C CNN
	1    5300 5600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 4450 5000 6000
$Comp
L Device:CP C3
U 1 1 5FD58EBD
P 2200 1550
F 0 "C3" H 2000 1600 50  0000 L CNN
F 1 "100u" H 1900 1500 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P2.50mm" H 2238 1400 50  0001 C CNN
F 3 "~" H 2200 1550 50  0001 C CNN
	1    2200 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1200 4150 1400
Wire Wire Line
	4150 1400 3900 1400
Connection ~ 3500 1400
Wire Wire Line
	1350 1700 2200 1700
Connection ~ 2200 1700
Wire Wire Line
	2200 1700 2500 1700
Wire Wire Line
	2000 1400 2200 1400
Wire Wire Line
	2200 1400 2500 1400
Connection ~ 2200 1400
$Comp
L Device:CP C4
U 1 1 5FDA478A
P 3900 1550
F 0 "C4" H 4050 1600 50  0000 L CNN
F 1 "10u" H 4050 1500 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 3938 1400 50  0001 C CNN
F 3 "~" H 3900 1550 50  0001 C CNN
	1    3900 1550
	1    0    0    -1  
$EndComp
Connection ~ 3900 1400
Wire Wire Line
	3900 1400 3500 1400
Connection ~ 1450 1500
Wire Wire Line
	1450 1500 1350 1500
Wire Wire Line
	1450 1500 1600 1500
$Comp
L Doit:ESP32-DevKit-V1 U2
U 1 1 5FB66A32
P 4250 2800
F 0 "U2" H 3700 3600 50  0000 C CNN
F 1 "ESP32-DevKit-V1" H 4750 3600 50  0000 C CNN
F 2 "Doit:Doit_ESP32_DevKit_V1" H 4250 2400 50  0001 C CNN
F 3 "" H 4250 2400 50  0001 C CNN
	1    4250 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4150 1900 4150 1950
Wire Wire Line
	3500 1700 3900 1700
Connection ~ 3500 1700
$Comp
L Device:R R11
U 1 1 5FED5D8D
P 4150 4700
F 0 "R11" V 4050 4600 50  0000 C CNN
F 1 "330" V 4050 4800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4080 4700 50  0001 C CNN
F 3 "~" H 4150 4700 50  0001 C CNN
	1    4150 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3400 4950 4100
$Comp
L Transistor_BJT:MMBT3904 Q4
U 1 1 5FF08827
P 4350 6000
F 0 "Q4" H 4541 6046 50  0000 L CNN
F 1 "MMBT3904" H 4541 5955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 4550 5925 50  0001 L CIN
F 3 "https://www.onsemi.com/pub/Collateral/2N3903-D.PDF" H 4350 6000 50  0001 L CNN
	1    4350 6000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5FF0882D
P 4450 6200
F 0 "#PWR020" H 4450 5950 50  0001 C CNN
F 1 "GND" H 4455 6027 50  0000 C CNN
F 2 "" H 4450 6200 50  0001 C CNN
F 3 "" H 4450 6200 50  0001 C CNN
	1    4450 6200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R12
U 1 1 5FF08833
P 4450 5350
F 0 "R12" V 4350 5250 50  0000 C CNN
F 1 "20" V 4350 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4380 5350 50  0001 C CNN
F 3 "~" H 4450 5350 50  0001 C CNN
	1    4450 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR019
U 1 1 5FF08839
P 4450 5200
F 0 "#PWR019" H 4450 5050 50  0001 C CNN
F 1 "+3.3V" H 4465 5373 50  0000 C CNN
F 2 "" H 4450 5200 50  0001 C CNN
F 3 "" H 4450 5200 50  0001 C CNN
	1    4450 5200
	1    0    0    -1  
$EndComp
$Comp
L LED:LD271 D4
U 1 1 5FF0883F
P 4450 5600
F 0 "D4" V 4446 5520 50  0000 R CNN
F 1 "LD271" V 4355 5520 50  0000 R CNN
F 2 "Connector_JST:JST_XH_S2B-XH-A_1x02_P2.50mm_Horizontal" H 4450 5775 50  0001 C CNN
F 3 "http://www.alliedelec.com/m/d/40788c34903a719969df15f1fbea1056.pdf" H 4400 5600 50  0001 C CNN
	1    4450 5600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4650 4100 4650 4550
Wire Wire Line
	4650 4550 4150 4550
Wire Wire Line
	4650 4100 4950 4100
Wire Wire Line
	4150 6000 4150 4850
$Comp
L Regulator_Linear:AMS1117-5.0 U1
U 1 1 5FBC0523
P 3050 1400
F 0 "U1" H 3050 1642 50  0000 C CNN
F 1 "AMS1117-5.0" H 3050 1551 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-223-3_TabPin2" H 3050 1600 50  0001 C CNN
F 3 "http://www.advanced-monolithic.com/pdf/ds1117.pdf" H 3150 1150 50  0001 C CNN
	1    3050 1400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1700 3050 1700
Connection ~ 3050 1700
Wire Wire Line
	3050 1700 3500 1700
Connection ~ 4150 1400
Wire Wire Line
	3150 1900 4150 1900
Wire Wire Line
	4150 1400 4150 1900
Connection ~ 4150 1900
$Comp
L power:+5V #PWR0101
U 1 1 5FBF4A39
P 4150 1200
F 0 "#PWR0101" H 4150 1050 50  0001 C CNN
F 1 "+5V" H 4165 1373 50  0000 C CNN
F 2 "" H 4150 1200 50  0001 C CNN
F 3 "" H 4150 1200 50  0001 C CNN
	1    4150 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 2700 5600 2700
Connection ~ 5600 2700
Wire Wire Line
	6750 2400 6150 2400
Wire Wire Line
	6150 2400 5600 2400
Connection ~ 6150 2400
Connection ~ 5600 2400
NoConn ~ 4950 3100
Wire Wire Line
	5600 2700 5850 2700
Wire Wire Line
	6450 2700 6450 3250
Wire Wire Line
	6450 3250 5850 3250
Wire Wire Line
	5850 3250 5850 2700
Connection ~ 5850 2700
$Comp
L power:GND #PWR0102
U 1 1 5FD871AB
P 6150 3000
F 0 "#PWR0102" H 6150 2750 50  0001 C CNN
F 1 "GND" H 6155 2827 50  0000 C CNN
F 2 "" H 6150 3000 50  0001 C CNN
F 3 "" H 6150 3000 50  0001 C CNN
	1    6150 3000
	1    0    0    -1  
$EndComp
NoConn ~ 1050 1900
$Comp
L Device:CP C?
U 1 1 6003A0F3
P 4900 1400
F 0 "C?" H 5050 1450 50  0000 L CNN
F 1 "100u" H 5050 1350 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.50mm" H 4938 1250 50  0001 C CNN
F 3 "~" H 4900 1400 50  0001 C CNN
	1    4900 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 1550 4900 1600
Wire Wire Line
	4900 1600 5300 1600
$EndSCHEMATC
