#include <Arduino.h>
#include <functional>
#include <WiFi.h>
#include <PubSubClient.h>
#include <MqttCtrl.h>

using namespace std::placeholders; // for `_1` in std:bind

MqttCtrl::MqttCtrl(Client &netClient, String mqttServer, String clientId)
{
    this->_netClient = &netClient;
    this->_clientId = clientId;
    this->_server = mqttServer;

    Serial.println("Configuring MQTT client:");
    Serial.println("  server = " + this->_server);
    Serial.println("  client_id = " + clientId);

    this->_pubSubClient = new PubSubClient(netClient);
    this->_pubSubClient->setServer(this->_server.c_str(), 1883);
    this->_pubSubClient->setCallback(std::bind(&MqttCtrl::receivedCallback, this, _1, _2, _3));
}

void MqttCtrl::connect()
{
    this->_reconnect();
}

void MqttCtrl::_reconnect()
{
    if (!this->_pubSubClient->connected())
    {
        if (millis() - this->_lastConnect < 10000)
        {
            return;
        }
        this->_lastConnect = millis();

        this->_pubSubClient = new PubSubClient(*this->_netClient);
        this->_pubSubClient->setServer(this->_server.c_str(), 1883);
        this->_pubSubClient->setCallback(std::bind(&MqttCtrl::receivedCallback, this, _1, _2, _3));

        const char *clientId = this->_clientId.c_str();
        Serial.print("MQTT connecting to ");
        Serial.println(this->_server);
        if (this->_pubSubClient->connect(clientId))
        {
            Serial.println("Connected.");
            return;
        }
        else
        {
            Serial.print("failed, status code = ");
            Serial.print(this->_pubSubClient->state());
            Serial.println(". Try again in next loop.");
            delay(1000);
        }
    }
}

void MqttCtrl::loop()
{
    if (!this->_pubSubClient->connected())
    {
        this->_reconnect();
    }
    else
    {
        this->_pubSubClient->loop();
    }
}

void MqttCtrl::subscribe(String topic, TOPIC_RCV_CALLBACK_SIGNATURE cb)
{
    std::map<String, TOPIC_RCV_CALLBACK_SIGNATURE> subs = this->_subscriptions;

    if (subs.find(topic) == subs.end())
    {
        this->_pubSubClient->subscribe(topic.c_str());
        Serial.print("Subscribed to ");
        Serial.println(topic);
    }

    subs[topic] = cb;
}

void MqttCtrl::receivedCallback(char *topic, byte *payload, unsigned int length)
{
    Serial.print("Message received: ");
    Serial.println(topic);

    Serial.print("payload: ");
    for (int i = 0; i < length; i++)
    {
        Serial.print((char)payload[i]);
    }

    Serial.println();

    std::map<String, TOPIC_RCV_CALLBACK_SIGNATURE> subs = this->_subscriptions;
    if (subs.find(topic) != subs.end())
    {
        TOPIC_RCV_CALLBACK_SIGNATURE cb = subs[topic];
        cb((char*)payload);
    }
}
