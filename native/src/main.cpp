#include <Arduino.h>

#include <WiFiCnx.h>
#include <MqttCtrl.h>
#include <InfraredCtrl.h>

#include "config.h"

WiFiCnx* wiFiCnx;
MqttCtrl* mqtt;

void say_hello(String payload) {
  Serial.println("Hi " + payload);
}

void setup()
{
  Serial.begin(9600);
  ir_setup();
  wiFiCnx = new WiFiCnx(cfg_hostname, cfg_wifi_ssid, cfg_wifi_pwd);
  wiFiCnx->connect();
  delay(500);

  mqtt = new MqttCtrl(*(wiFiCnx->client), cfg_mqtt_server, cfg_hostname);
  mqtt->connect();
  mqtt->subscribe("/hushboxctrl", say_hello);
}

void loop()
{
  wiFiCnx->loop();
  mqtt->loop();

  // ir_decode();
  delay(100);

  // restart ESP after 24h?
}
