#ifndef TempReader_h
#define TempReader_h

#include <array>

struct temp_values_t
{
    float in;
    float out;
};

void temp_setup(uint8_t pin);
temp_values_t temp_read();

#endif
