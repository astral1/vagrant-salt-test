import netifaces as nif

def hello():
    return {
            'mac_addresses': __mac()
            }

def __mac():
    macs = {}
    for iface in nif.interfaces():
        macs[iface] = nif.ifaddresses(iface)[nif.AF_LINK][0]['addr']

    return macs
