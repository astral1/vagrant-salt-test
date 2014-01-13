import netifaces as nif
import salt.utils

import rethinkdb as r


def import_rethinkdb():
    options = __opts__['rethinkdb']
    host_addr = options['host']
    db_name = options['db']
    table_name = options['grains']
    conn = r.connect(host=host_addr, db=db_name)

    if table_name not in r.table_list().run(conn):
        r.table_create(table_name).run(conn)

    cursor = r.table(table_name).filter({'minion': __opts__['id']}).run(conn)
    result = []

    for grains in cursor:
        result.append(grains)

    if len(result) > 0:
        return result[0]

    return {}
