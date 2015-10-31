import logging

try:
    import rethinkdb as r
    rethinkdb_loaded = True
except ImportError:
    rethinkdb_loaded = False

__virtualname__ = 'rethinkdb'
def __virtual__():
    if rethinkdb_loaded:
        return __virtualname__
    else:
        return False
