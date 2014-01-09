import logging

try:
    import rethinkdb as r
    rethinkdb_loaded = True
except ImportError:
    rethinkdb_loaded = False

def __virtual__():
    if rethinkdb_loaded:
        return 'rethinkdb'
    else:
        return False
