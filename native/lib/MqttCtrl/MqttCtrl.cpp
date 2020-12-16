#include <Arduino.h>
#include <WiFi.h>
#include <MqttCtrl.h>

void connect_wifi(const char *hostname, const char *ssid, const char *password)
{
  Serial.print("Connecting to: ");
  Serial.println(ssid);

  WiFi.setHostname(hostname);
  WiFi.begin(ssid, password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.print("IP address: ");
  Serial.println(WiFi.localIP());
}
