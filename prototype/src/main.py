from time import sleep
from linear_fan_control import LinearFanControl
from temp_reader import TempReader
from rpm_reader import RPMReader
from wifi import connect_wifi
from metrics import send_metrics
from machine import Pin

connect_wifi()

lfc_in = LinearFanControl(pwm_pin=23, min_temp=23, max_temp=30)
lfc_out = LinearFanControl(pwm_pin=18, min_temp=23, max_temp=30)

rpm_in = RPMReader(rpm_pin=22)
rpm_out = RPMReader(rpm_pin=5)

temp_reader = TempReader(pin=19)
# temp_reader_2 = TempReader(pin=16)
fan_switch = Pin(21, Pin.OUT)
fan_switch_2 = Pin(17, Pin.OUT)

while True:
    temp = 100
    temp2 = 100
    try:
        temps = list(temp_reader.read_temps())
        temp = temps[0]
        temp2 = temps[1]
    except Exception:
        pass

    if temp < lfc_out.min_temp:
        fan_switch.off()
        print("Temp={:<7}C Temp2={:<7}C".format(temp, temp2))
        send_metrics('temperature temp={}'.format(temp))
    else:
        fan_switch.on()
        lfc_in.update_pwm_for_temp(temp)
        lfc_out.update_pwm_for_temp(temp)

        print("Temp={:<7}C => IN [PWM={:<4} RPM={:<5}] OUT [PWM={:<4} RPM={:<5}]".format(
            temp,
            lfc_in.pwm.duty(), rpm_in.rpm,
            lfc_out.pwm.duty(), rpm_out.rpm))

        send_metrics('\n'.join([
            'temperature temp={}'.format(temp),
            'fan,id=in pwm={},rpm={}'.format(lfc_in.pwm.duty(), rpm_in.rpm),
            'fan,id=out pwm={},rpm={}'.format(lfc_out.pwm.duty(), rpm_out.rpm)
        ]))
    sleep(3)
