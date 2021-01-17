#include <Arduino.h>
#include <functional>

#include "rpm-reader.h"

unsigned long rpm_in_cnt, rpm_out_cnt;
unsigned long _last_millis;

void ICACHE_RAM_ATTR _rpm_in_handler() { rpm_in_cnt++; }
void ICACHE_RAM_ATTR _rpm_out_handler() { rpm_out_cnt++; }

void setupRPMReader(uint8_t rpm_in_pin, uint8_t rpm_out_pin)
{
    pinMode(rpm_in_pin, INPUT);
    pinMode(rpm_out_pin, INPUT);
    attachInterrupt(digitalPinToInterrupt(rpm_in_pin), _rpm_in_handler, FALLING);
    attachInterrupt(digitalPinToInterrupt(rpm_out_pin), _rpm_out_handler, FALLING);
}

rpm_values_t _recent_rpm_values;
rpm_values_t readRPMValues()
{
    auto millis_diff = millis() - _last_millis;
    if (millis_diff > 2000)
    {
        _recent_rpm_values.in = 1000 * 60 * rpm_in_cnt / millis_diff / 2;
        _recent_rpm_values.out = 1000 * 60 * rpm_out_cnt / millis_diff / 2;

        _last_millis = millis();
        rpm_in_cnt = 0;
        rpm_out_cnt = 0;
    }

    return _recent_rpm_values;
}
