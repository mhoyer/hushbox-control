from onewire import OneWire
from ds18x20 import DS18X20
from machine import Pin, sleep

class TempReader:
    def __init__(self, pin):
        self.ds = DS18X20(OneWire(Pin(pin)))
        self.roms = self.ds.scan()
        print('Found {} devices:'.format(len(self.roms)))
        for rom in self.roms:
            print(' - ', rom)

    def read_temps(self):
        self.ds.convert_temp()
        sleep(750)
        return map(self.ds.read_temp, self.roms)
