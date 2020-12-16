#include <Arduino.h>
#include <InfraredCtrl.h>

void setup()
{
  Serial.begin(9600);
  ir_setup();
}

void loop()
{
  ir_decode();
  delay(300);
  Serial.println("loop");
}
