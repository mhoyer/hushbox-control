#ifndef LINEAR_FAN_SPEED_H
#define LINEAR_FAN_SPEED_H

#include <stdint.h>

typedef struct lfs
{
    uint8_t pin;
    float min_temp, max_temp;
    float range()
    {
        return max_temp - min_temp;
    }
} lfs_t;

void setupLinearFanSpeed(lfs_t lfc);
void setSpeedByTemperature(lfs_t lfc, float temp);

#endif
