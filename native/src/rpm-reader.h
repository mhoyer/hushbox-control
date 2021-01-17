#ifndef RPM_READER_H
#define RPM_READER_H

#include <stdint.h>

typedef struct rpm_values
{
    uint16_t in;
    uint16_t out;
} rpm_values_t;

void setupRPMReader(uint8_t rpm_in_pin, uint8_t rpm_out_pin);
rpm_values_t readRPMValues();

#endif
