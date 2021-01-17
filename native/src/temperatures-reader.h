#ifndef TEMPERATURES_READER_H
#define TEMPERATURES_READER_H

#include <array>

typedef struct temperature_values
{
    float in;
    float out;
} temperature_values_t;

void setupTemperaturesReader(uint8_t pin);
temperature_values_t readTemperatures();

#endif
