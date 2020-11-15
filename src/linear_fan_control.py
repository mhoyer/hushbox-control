from machine import PWM, Pin

class LinearFanControl:
    def __init__(self, pwm_pin, min_temp=20, max_temp=35, freq=21000):
        self.pwm_pin = pwm_pin
        pin = Pin(pwm_pin)
        self.pwm = PWM(pin, freq=freq)
        self.min_temp = min_temp
        self.max_temp = max_temp
        self.temp_range = max_temp - min_temp
        print("New LFC for GPIO {} (t_min={}, t_max={}, freq={})".format(pwm_pin, min_temp, max_temp, freq))

    def update_pwm_for_temp(self, temp):
        temp_factor = (temp - self.min_temp) / self.temp_range
        print("  update PWM for {}: t_factor={}, temp={}, t_min={}".format(self.pwm_pin, temp_factor, temp, self.min_temp))
        duty = max(0, min(1023, temp_factor * 1024))

        self.pwm.duty(int(duty))

    def deinit(self):
        self.pwm.deinit()
