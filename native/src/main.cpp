#include <Arduino.h>

#include "config.h"
#include "ota.h"
#include "./WiFiCnx/WiFiCnx.h"
#include "./MqttCtrl/MqttCtrl.h"
#include "ir-io.h"
#include "linear-fan-speed.h"
#include "rpm-reader.h"
#include "temperatures-reader.h"

WiFiCnx *wiFiCnx;
MqttCtrl *mqtt;

void set_movie_mode(String payload)
{
    Serial.println("Setting movie mode " + payload);

    if (strcmp(payload.c_str(), "on") == 0)
    {
        IR::turnReceiverOn();
        IR::turnProjectorOn();
    }
    else if (strcmp(payload.c_str(), "off") == 0)
    {
        IR::turnProjectorOff();
        delay(500);
        IR::turnReceiverOff();
    }
}

void set_fan_mode(String payload)
{
    Serial.println("Setting fan " + payload);

    if (strcmp(payload.c_str(), "on") == 0)
    {
        digitalWrite(CFG_PIN_FAN_SWITCH_IN, HIGH);
        digitalWrite(CFG_PIN_FAN_SWITCH_OUT, HIGH);
    }
    else if (strcmp(payload.c_str(), "off") == 0)
    {
        digitalWrite(CFG_PIN_FAN_SWITCH_IN, LOW);
        digitalWrite(CFG_PIN_FAN_SWITCH_OUT, LOW);
    }
}

lfs_t lfs_in, lfs_out;
void setup()
{
    Serial.begin(9600);

    setupIR(CFG_PIN_IR_RECEIVE, CFG_PIN_IR_SEND_IN, CFG_PIN_IR_SEND_OUT);
    setupTemperaturesReader(CFG_PIN_TEMP);
    pinMode(CFG_PIN_FAN_SWITCH_IN, OUTPUT);
    pinMode(CFG_PIN_FAN_SWITCH_OUT, OUTPUT);
    setupRPMReader(CFG_PIN_FAN_RPM_IN, CFG_PIN_FAN_RPM_OUT);
    digitalWrite(CFG_PIN_FAN_SWITCH_IN, HIGH);
    digitalWrite(CFG_PIN_FAN_SWITCH_OUT, HIGH);

    lfs_in.pin = CFG_PIN_FAN_PWM_IN;
    lfs_in.min_temp = 20;
    lfs_in.max_temp = 30;
    lfs_out.pin = CFG_PIN_FAN_PWM_OUT;
    lfs_out.min_temp = 20;
    lfs_out.max_temp = 30;

    setupLinearFanSpeed(lfs_in);
    setupLinearFanSpeed(lfs_out);

    wiFiCnx = new WiFiCnx(CFG_HOSTNAME, CFG_WIFI_SSID, CFG_WIFI_PWD);
    wiFiCnx->connect();
    delay(500);
    setupOTA(CFG_HOSTNAME);

    mqtt = new MqttCtrl(*(wiFiCnx->client), CFG_MQTT_SERVER, CFG_HOSTNAME);
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

    decodeIR();
    auto temps = readTemperatures();
    auto rpms = readRPMValues();

    if (millis() > 15000 && millis() < 16000)
        setSpeedByTemperature(lfs_in, 25);
    if (millis() > 40000 && millis() < 41000)
        setSpeedByTemperature(lfs_in, 20);
    if (millis() > 60000 && millis() < 61000)
        digitalWrite(CFG_PIN_FAN_SWITCH_IN, LOW);
        digitalWrite(CFG_PIN_FAN_SWITCH_OUT, LOW);

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
