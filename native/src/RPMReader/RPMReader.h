#ifndef RPMReader_h
#define RPMReader_h

#include <stdint.h>

struct rpm_values_t
{
    uint16_t in;
    uint16_t out;
};

void rpm_setup(uint8_t rpm_in_pin, uint8_t rpm_out_pin);
rpm_values_t rpm_read();

#endif
