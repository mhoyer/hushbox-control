from network import WLAN, STA_IF
from wifi_secrets import ssid, password

wlan = WLAN(STA_IF)
wlan.active(True)

def connect_wifi():
    if wlan.isconnected():
        return

    print('connecting to network...')
    wlan.connect(ssid, password)
    wlan.config(dhcp_hostname='hbfc')
    while not wlan.isconnected():
        pass
    print('network config:', wlan.ifconfig())
