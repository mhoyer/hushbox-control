#include <Arduino.h>

#include "config.h"
#include "./OTA/OTA.h"
#include "./WiFiCnx/WiFiCnx.h"
#include "./MqttCtrl/MqttCtrl.h"
#include "./InfraredCtrl/InfraredCtrl.h"
#include "./TempReader/TempReader.h"

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

void set_fan_mode(String payload)
{
  Serial.println("Setting fan " + payload);

  if (strcmp(payload.c_str(), "on") == 0)
  {
    digitalWrite(cfg_pin_fan_switch_in, HIGH);
    digitalWrite(cfg_pin_fan_switch_out, HIGH);
  }
  else if (strcmp(payload.c_str(), "off") == 0)
  {
    digitalWrite(cfg_pin_fan_switch_in, LOW);
    digitalWrite(cfg_pin_fan_switch_out, LOW);
  }
}

void setup()
{
  Serial.begin(9600);
  
  ir_setup();
  temp_setup(cfg_pin_temp);
  pinMode(cfg_pin_fan_switch_in, OUTPUT);
  pinMode(cfg_pin_fan_switch_out, OUTPUT);
  
  wiFiCnx = new WiFiCnx(cfg_hostname, cfg_wifi_ssid, cfg_wifi_pwd);
  wiFiCnx->connect();
  delay(500);
  ota_setup(cfg_hostname);

  mqtt = new MqttCtrl(*(wiFiCnx->client), cfg_mqtt_server, cfg_hostname);
  mqtt->connect();
  delay(1000);
  mqtt->subscribe("hushboxctrl/movie_mode", set_movie_mode);
  mqtt->subscribe("hushboxctrl/fan_mode", set_fan_mode);
  mqtt->subscribe("hushboxctrl", ping);
}

void loop()
{
  wiFiCnx->loop();
  ArduinoOTA.handle();
  mqtt->loop();

  ir_decode();
  auto temps = temp_read();

  Serial.print("in=");
  Serial.print(temps[0]);
  Serial.print("C  out=");
  Serial.print(temps[1]);
  Serial.println("C");

  delay(100);

  // restart ESP after 24h?
}
