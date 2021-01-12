#include <map>
#include "Client.h"
#include <PubSubClient.h>

void connect_wifi(String hostname, String ssid, String password);

#define TOPIC_RCV_CALLBACK_SIGNATURE std::function<void(String)>

class MqttCtrl {
private:
    Client* _netClient;
    PubSubClient* _pubSubClient;
    String _server, _clientId;
    std::map<String, TOPIC_RCV_CALLBACK_SIGNATURE> _subscriptions;
    void _reconnect();
    unsigned long _lastConnect;
    void _resubscribe();
    void receivedCallback(char* topic, byte* payload, unsigned int length);

public:
    MqttCtrl(Client& netClient, String mqttServer, String clientId);
    void connect();
    void loop();
    void subscribe(String topic, TOPIC_RCV_CALLBACK_SIGNATURE cb);
};
