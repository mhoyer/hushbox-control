#include <Arduino.h>

#include <WiFiCnx.h>
#include <MqttCtrl.h>
#include <InfraredCtrl.h>

#include "config.h"

WiFiCnx* wiFiCnx;
MqttCtrl* mqtt;

void ping(String payload)
{
  Serial.println("MQTT ping: " + payload);
}

void set_movie_mode(String payload)
{
  Serial.println("Setting movie mode " + payload);

  if (strcmp(payload.c_str(), "on") == 0)
  {
    ir_turn_receiver_on();
    ir_turn_projector_on();
  }
  else if (strcmp(payload.c_str(), "off") == 0)
  {
    ir_turn_projector_off();
    delay(500);
    ir_turn_receiver_off();
  }
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
  delay(1000);
  mqtt->subscribe("hushboxctrl/movie_mode", set_movie_mode);
  mqtt->subscribe("hushboxctrl", ping);
}

void loop()
{
  wiFiCnx->loop();
  mqtt->loop();

  ir_decode();
  delay(100);

  // restart ESP after 24h?
}
