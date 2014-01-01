import netifaces as nif

def hello():
    return {
            'hello': 'world', 
            'goodbye': 'blue',
            'mac_addresses': mac()
            }

def mac():
    macs = {}
    for iface in nif.interfaces():
        macs[iface] = nif.ifaddresses(iface)[nif.AF_LINK][0]['addr']

    return macs
