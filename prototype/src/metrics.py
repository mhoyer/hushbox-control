from urequests import request
from config import influx_server, influx_db

url = '{}/write?db={}'.format(influx_server, influx_db)

def send_metrics(data):
    # print("Try publish: {}".format(data))
    try:
        request('POST', url, data)
    except Exception:
        pass
