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
lfs_t lfs_in, lfs_out;

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

void set_fan_speed(String payload)
{
    float speed = ::atof(payload.c_str());
    Serial.println("Setting fan speed to " + payload);

    setSpeedByTemperature(lfs_in, speed);
    setSpeedByTemperature(lfs_out, speed);
}

// payload is: "(i|o) [<IR_CODE>, ...]"
// example: "i 0x5EA1B847 0x5EA1D827"
void send_ir_codes(String payload)
{
    Serial.println("Sending IR codes: " + payload);

    bool use_ir_out = true;
    if (payload.charAt(0) == 'i')
    {
        use_ir_out = false;
    }
    
    Serial.printf("  Using '%s' IR port.\n", use_ir_out ? "out" : "in");

    const char* delim = " ";
    char* token = strtok(&payload[2], delim);

    do
    {
        uint64_t code = strtoull(token, NULL, 16);
        Serial.printf("  Token: %llu\n", code);
        if (use_ir_out)
        {
            IR::send_ir_out(code);
        }
        else
        {
            IR::send_ir_in(code);
        }
    }
    while ((token = strtok(NULL, delim)));
}

void restart(String payload)
{
    esp_restart();
}

void setup()
{
    Serial.begin(115200);

    setupIR(CFG_PIN_IR_RECEIVE, CFG_PIN_IR_SEND_IN, CFG_PIN_IR_SEND_OUT);
    // setupTemperaturesReader(CFG_PIN_TEMP);
    pinMode(CFG_PIN_FAN_SWITCH_IN, OUTPUT);
    pinMode(CFG_PIN_FAN_SWITCH_OUT, OUTPUT);
    pinMode(LED_BUILTIN, OUTPUT);
    setupRPMReader(CFG_PIN_FAN_RPM_IN, CFG_PIN_FAN_RPM_OUT);
    digitalWrite(CFG_PIN_FAN_SWITCH_IN, LOW);
    digitalWrite(CFG_PIN_FAN_SWITCH_OUT, LOW);

    lfs_in.pin = CFG_PIN_FAN_PWM_IN;
    lfs_in.min_temp = 20;
    lfs_in.max_temp = 30;
    lfs_out.pin = CFG_PIN_FAN_PWM_OUT;
    lfs_out.min_temp = 20;
    lfs_out.max_temp = 30;

    setupLinearFanSpeed(lfs_in);
    setupLinearFanSpeed(lfs_out);
    setSpeedByTemperature(lfs_in, 24);
    setSpeedByTemperature(lfs_out, 24);

    wiFiCnx = new WiFiCnx(CFG_HOSTNAME, CFG_WIFI_SSID, CFG_WIFI_PWD);
    wiFiCnx->connect();
    delay(500);
    setupOTA(CFG_HOSTNAME);

    mqtt = new MqttCtrl(*(wiFiCnx->client), CFG_MQTT_SERVER, CFG_HOSTNAME);
    mqtt->connect();
    delay(1000);
    mqtt->subscribe("hushboxctrl/movie_mode", set_movie_mode);
    mqtt->subscribe("hushboxctrl/fan_mode", set_fan_mode);
    mqtt->subscribe("hushboxctrl/fan_speed", set_fan_speed);
    mqtt->subscribe("hushboxctrl/restart", restart);
    mqtt->subscribe("hushboxctrl/send_ir_codes", send_ir_codes);

    Serial.println("Setup done");
}

unsigned long _prev_monitor_millis;
void loop()
{
    wiFiCnx->loop();
    ArduinoOTA.handle();
    mqtt->loop();

    decodeIR();
    // auto temps = readTemperatures();
    auto rpms = readRPMValues();

    // if (millis() > 15000 && millis() < 16000)
    //     setSpeedByTemperature(lfs_in, 25);
    // if (millis() > 40000 && millis() < 41000)
    //     setSpeedByTemperature(lfs_in, 20);
    // if (millis() > 60000 && millis() < 61000)
    //     digitalWrite(CFG_PIN_FAN_SWITCH_IN, LOW);
    //     digitalWrite(CFG_PIN_FAN_SWITCH_OUT, LOW);

    if (millis() - _prev_monitor_millis > 10000)
    {
        _prev_monitor_millis = millis();
        Serial.print(millis());
        
        // Serial.print(" | Temp in=");
        // Serial.print(temps.in);
        // Serial.print("C  out=");
        // Serial.print(temps.out);
        // Serial.print("C");

        Serial.print(" | Fan speed in=");
        Serial.print(rpms.in);
        Serial.print("RPM  out=");
        Serial.print(rpms.out);
        Serial.println("RPM");
        
        digitalWrite(LED_BUILTIN, HIGH);
        delay(20);
        digitalWrite(LED_BUILTIN, LOW);
    }
    yield();
}
