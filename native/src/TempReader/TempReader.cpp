#define REQUIRESALARMS false
#include <DallasTemperature.h>

#include "./TempReader/TempReader.h"

OneWire* oneWire;
DallasTemperature* sensors;
DeviceAddress in_sensor, out_sensor;

void temp_setup(uint8_t pin) {
  oneWire = new OneWire(pin);
  sensors = new DallasTemperature(oneWire);
  sensors->begin();

  Serial.print("Found ");
  Serial.print(sensors->getDeviceCount(), DEC);
  Serial.print(" devices on pin ");
  Serial.print(pin);
  Serial.println(".");

  // search for devices on the bus and assign based on an index.
  if (!sensors->getAddress(in_sensor, 0)) Serial.println("Unable to find address for Device 0"); 
  if (!sensors->getAddress(out_sensor, 1)) Serial.println("Unable to find address for Device 1"); 
}

float temp_in = 0;
float temp_out = 0;

std::array<float,2> temp_read() {
  std::array<float,2> result;
  
  sensors->requestTemperatures();
  temp_in = sensors->getTempC(in_sensor);
  temp_out = sensors->getTempC(out_sensor);
  result[0] = temp_in;
  result[1] = temp_out;
  
  return result;
}
