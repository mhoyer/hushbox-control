from time import sleep
from linear_fan_control import LinearFanControl
from temp_reader import TempReader
from rpm_reader import RPMReader
from wifi import connect_wifi

connect_wifi()

lfcIn = LinearFanControl(pwm_pin=22, min_temp=25, max_temp=38)
lfcOut = LinearFanControl(pwm_pin=27, min_temp=25, max_temp=35)

rpmIn = RPMReader(rpm_pin=23)
rpmOut = RPMReader(rpm_pin=26)

temp_reader = TempReader(pin=18)

while True:
    temps = temp_reader.read_temps()
    temp = list(temps)[0]
    lfcIn.update_pwm_for_temp(temp)
    lfcOut.update_pwm_for_temp(temp)
    print("Temp={:<7}°C => IN [PWM={:<4} RPM={:<5}] OUT [PWM={:<4} RPM={:<5}]".format(
        temp,
        lfcIn.pwm.duty(), rpmIn.rpm,
        lfcOut.pwm.duty(), rpmOut.rpm))
    sleep(3)
