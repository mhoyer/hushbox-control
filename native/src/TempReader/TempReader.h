#ifndef TempReader_h
#define TempReader_h

#include <array>

void temp_setup(uint8_t pin);
std::array<float,2> temp_read();

#endif