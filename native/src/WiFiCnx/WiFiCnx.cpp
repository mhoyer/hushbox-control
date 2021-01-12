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

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(500);
        Serial.print(".");
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
