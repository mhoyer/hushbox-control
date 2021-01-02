#include <WiFi.h>

class WiFiCnx {
private:
    String _hostname;
    String _ssid;
    String _password;

public:
    WiFiClient* client;

    WiFiCnx(String hostname, String ssid, String password);
    void connect();
    void loop();
};
