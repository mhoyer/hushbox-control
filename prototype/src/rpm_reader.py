from machine import Pin
from time import ticks_ms

class RPMReader:
    count = 0
    ticks = None
    rpm = 0

    def __init__(self, rpm_pin):
        self.pin = Pin(rpm_pin, Pin.IN)
        self.pin.irq(trigger=Pin.IRQ_FALLING, handler=self.process)

    def uninit(self):
        self.pin.irq(handler=None)

    def process(self, _pin):
        self.count += 1

        millis = ticks_ms()
        if self.ticks is None:
            self.ticks = millis
        elif (millis - self.ticks) > 3000:
            # print(millis, self.count, millis - self.ticks)
            self.rpm = int(60 * 1000 * self.count/(2*(millis - self.ticks)))
            self.ticks = None
            self.count = 0
