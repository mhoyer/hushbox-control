from time import sleep
from linear_fan_control import LinearFanControl
from temp_reader import TempReader
from rpm_reader import RPMReader
from wifi import connect_wifi
from metrics import send_metrics
from machine import Pin

connect_wifi()

lfc_in = LinearFanControl(pwm_pin=22, min_temp=23, max_temp=30)
lfc_out = LinearFanControl(pwm_pin=27, min_temp=23, max_temp=30)

rpm_in = RPMReader(rpm_pin=23)
rpm_out = RPMReader(rpm_pin=26)

temp_reader = TempReader(pin=18)
fan_switch = Pin(32, Pin.OUT)

while True:
    temps = temp_reader.read_temps()
    temp = 100
    try:
        temp = list(temps)[0]
    except Exception:
        pass

    if temp < lfc_out.min_temp:
        fan_switch.off()
        print("Temp={:<7}C".format(temp))
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
