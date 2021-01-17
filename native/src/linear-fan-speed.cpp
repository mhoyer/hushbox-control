#include <analogWrite.h>
#include "linear-fan-speed.h"

void setupLinearFanSpeed(lfs_t lfc)
{
    pinMode(lfc.pin, OUTPUT);
    analogWriteFrequency(8000);
    analogWrite(lfc.pin, 255);
}

void setSpeedByTemperature(lfs_t lfc, float temp)
{
    float tempFactor = (temp - lfc.min_temp) / lfc.range();
    auto duty = max(0, min(255, (int)(tempFactor * 256)));
    analogWrite(lfc.pin, duty);
}
