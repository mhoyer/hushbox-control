#ifndef LinearFanSpeed_h
#define LinearFanSpeed_h

#include <stdint.h>

struct lfc_t
{
    uint8_t pin;
    float minTemp, maxTemp;
    float range()
    {
        return maxTemp - minTemp;
    }
};

void lfc_setup(lfc_t lfc);
void set_speed_by_temperature(lfc_t lfc, float temp);

#endif
