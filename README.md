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


### Getting infos about ESP32

While the ESP32 is connected to the serial adaptor you can run this `esptool` command and instantly have to press the `BOOT` button on the ESP32:

```bash
$ ./esptool --baud 921600 flash_id
esptool.py v4.4
Found 1 serial ports
Serial port /dev/ttyUSB0
Connecting....
Detecting chip type... Unsupported detection protocol, switching and trying again...
Connecting....
Detecting chip type... ESP32
Chip is ESP32-D0WDQ6 (revision v1.0)
Features: WiFi, BT, Dual Core, Coding Scheme None
Crystal is 40MHz
MAC: 24:0a:c4:13:9a:90
Uploading stub...
Running stub...
Stub running...
Changing baud rate to 921600
Changed.
Manufacturer: c8
Device: 4016
Detected flash size: 4MB
Hard resetting via RTS pin...
```

#### Reading out the existing memory as a backup

```bash
./esptool --baud 921600 read_flash 0 0x400000 backup.bin
```
