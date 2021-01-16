#include <Arduino.h>

#include "config.h"
#include "./OTA/OTA.h"
#include "./WiFiCnx/WiFiCnx.h"
#include "./MqttCtrl/MqttCtrl.h"
#include "./InfraredCtrl/InfraredCtrl.h"
#include "./LinearFanSpeed/LinearFanSpeed.h"
#include "./RPMReader/RPMReader.h"
#include "./TempReader/TempReader.h"

WiFiCnx *wiFiCnx;
MqttCtrl *mqtt;

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

lfc_t lfc_in, lfc_out;
void setup()
{
    Serial.begin(9600);

    ir_setup();
    temp_setup(cfg_pin_temp);
    pinMode(cfg_pin_fan_switch_in, OUTPUT);
    pinMode(cfg_pin_fan_switch_out, OUTPUT);
    rpm_setup(cfg_pin_fan_rpm_in, cfg_pin_fan_rpm_out);
    digitalWrite(cfg_pin_fan_switch_in, HIGH);
    digitalWrite(cfg_pin_fan_switch_out, HIGH);

    lfc_in.pin = cfg_pin_fan_pwm_in;
    lfc_in.minTemp = 20;
    lfc_in.maxTemp = 30;
    lfc_out.pin = cfg_pin_fan_pwm_out;
    lfc_out.minTemp = 20;
    lfc_out.maxTemp = 30;

    lfc_setup(lfc_in);
    lfc_setup(lfc_out);

    wiFiCnx = new WiFiCnx(cfg_hostname, cfg_wifi_ssid, cfg_wifi_pwd);
    wiFiCnx->connect();
    delay(500);
    ota_setup(cfg_hostname);

    mqtt = new MqttCtrl(*(wiFiCnx->client), cfg_mqtt_server, cfg_hostname);
    mqtt->connect();
    delay(1000);
    mqtt->subscribe("hushboxctrl/movie_mode", set_movie_mode);
    mqtt->subscribe("hushboxctrl/fan_mode", set_fan_mode);
}

unsigned long _prev_monitor_millis;
void loop()
{
    wiFiCnx->loop();
    ArduinoOTA.handle();
    mqtt->loop();

    ir_decode();
    auto temps = temp_read();
    auto rpms = rpm_read();

    if (millis() > 15000 && millis() < 16000)
        set_speed_by_temperature(lfc_in, 25);
    if (millis() > 40000 && millis() < 41000)
        set_speed_by_temperature(lfc_in, 20);
    if (millis() > 60000 && millis() < 61000)
        digitalWrite(cfg_pin_fan_switch_in, LOW);
        digitalWrite(cfg_pin_fan_switch_out, LOW);

    if (millis() - _prev_monitor_millis > 3000)
    {
        _prev_monitor_millis = millis();
        Serial.print(millis());
        Serial.print(" | Temp in=");
        Serial.print(temps.in);
        Serial.print("C  out=");
        Serial.print(temps.out);
        Serial.print("C | Fan speed in=");
        Serial.print(rpms.in);
        Serial.print("RPM  out=");
        Serial.print(rpms.out);
        Serial.println("RPM");
    }
    delay(100);

    // restart ESP after 24h?
}
