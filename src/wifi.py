from network import WLAN, STA_IF
from config import wifi_ssid, wifi_password, wifi_hostname

wlan = WLAN(STA_IF)
wlan.active(True)

def connect_wifi():
    if wlan.isconnected():
        return

    print('connecting to network...')
    wlan.connect(wifi_ssid, wifi_password)
    wlan.config(dhcp_hostname=wifi_hostname)
    while not wlan.isconnected():
        pass
    print('network config:', wlan.ifconfig())
