#include <analogWrite.h>
#include "./LinearFanSpeed.h"

void lfc_setup(lfc_t lfc)
{
    pinMode(lfc.pin, OUTPUT);
    analogWriteFrequency(8000);
    analogWrite(lfc.pin, 255);
}

void set_speed_by_temperature(lfc_t lfc, float temp)
{
    auto tempFactor = (temp - lfc.minTemp) / lfc.range();
    auto duty = max(0, min(255, (int)(tempFactor * 256)));
    analogWrite(lfc.pin, duty);
}
