#include <WiFi.h>
#include "./WiFiCnx/WiFiCnx.h"

WiFiClient wifiClient;

WiFiCnx::WiFiCnx(String hostname, String ssid, String password)
{
    this->client = new WiFiClient();
    this->_hostname = hostname;
    this->_ssid = ssid;
    this->_password = password;
}

void WiFiCnx::connect()
{
    Serial.print("Connecting to: ");
    Serial.println(this->_ssid);

    WiFi.setHostname(this->_hostname.c_str());
    WiFi.begin(this->_ssid.c_str(), this->_password.c_str());

    int wait_ms = 500;
    int max_wait_ms = 20*1000; // in ms

    for (int i = 0; i < max_wait_ms; i = i+wait_ms)
    {
        if (WiFi.status() != WL_CONNECTED)
        {
            delay(wait_ms);
            Serial.print(".");
            continue;
        }
        break;
    }

    if (WiFi.status() != WL_CONNECTED) {
        Serial.println("");
        Serial.println("Unable to connect to WiFi. Resetting in 3s.");
        delay(3000);
        esp_restart();
    }

    Serial.println("");
    Serial.println("WiFi connected");
    Serial.print("IP address: ");
    Serial.println(WiFi.localIP());
}

void WiFiCnx::loop()
{
    if (WiFi.status() != WL_CONNECTED)
    {
        Serial.println("WiFi not connected?");
    }
}
