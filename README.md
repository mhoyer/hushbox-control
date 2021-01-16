# ESP32 - Fan Control

## Resources

### ESP32 Pin Out

- [ESP32 - General Pinout](https://randomnerdtutorials.com/esp32-pinout-reference-gpios/)
- [Doit ESP32 DevKit - Pinout](https://github.com/playelek/pinout-doit-32devkitv1)

### Fan Control

- [ESP32 Fan Controller](https://github.com/KlausMu/esp32-fan-controller)
- [4-Wire PWM Controlled Fans - Pinout](https://allpinouts.org/pinouts/connectors/motherboards/motherboard-cpu-4-pin-fan/)
- [How to read RPM from 3-wire fan](https://electronics.stackexchange.com/a/214082)
- [Raspberry Pi - Building a PWM Fan Controller with DotNet IoT](http://blog.timwheeler.io/building-a-pwm-fan-controller-with-dotnet-iot/)
- [IRLML2502 - MOSFET for switching the fan on/off](https://www.infineon.com/dgdl/irlml2502pbf.pdf)
- [0x1A Transistor (MOSFET) als Schalter](https://www.youtube.com/watch?v=d1yEUiCsBWc)

### Temperature Reading

- [Dallas DS18B20 - 1-Wire Digital Thermometer](https://datasheets.maximintegrated.com/en/ds/DS18B20.pdf)
- [Interfacing DS18B20 1-Wire Digital Temperature Sensor with Arduino](https://lastminuteengineers.com/ds18b20-arduino-tutorial/)


## Micropython

Flashing the firmware:

1. Press and hold the BOOT button and run: `esptool.py --chip esp32 --port /dev/ttyUSB0 erase_flash`
2. Now run: `esptool.py --chip esp32 --port /dev/ttyUSB0 --baud 460800 write_flash -z 0x1000 esp32-idf4-20200902-v1.13.bin`

I tested `esp32-idf4-20191220-v1.12.bin` and `esp32-idf4-20191220-v1.13.bin` from https://micropython.org/download/esp32/.
