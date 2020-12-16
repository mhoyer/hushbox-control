#include <Arduino.h>

#include <InfraredCtrl.h>
#include <MqttCtrl.h>
#include "config.h"

void setup()
{
  Serial.begin(9600);
  ir_setup();
  connect_wifi("hostname", cfg_wifi_ssid, cfg_wifi_pwd);
}

void loop()
{
  ir_decode();
  delay(300);
  Serial.println("loop");
}
