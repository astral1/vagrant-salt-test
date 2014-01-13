import logging
import json
log = logging.getLogger(__name__)

try:
    import rethinkdb as r
    has_rethinkdb = True
except ImportError:
    log.error('fail to initialize rethinkdb_returner')
    has_rethinkdb = False

def __virtual__():
    if not has_rethinkdb:
        return False
    return 'rethinkdb'

def returner(ret):
    options = __salt__['config.option']('rethinkdb')
    host_addr = options['host']
    db_name = options['db']
    table_name = options['table']
    conn = r.connect(host=host_addr, db=db_name)
    if table_name not in r.table_list().run(conn):
        log.warning('do not exist table')
        r.table_create(table_name).run(conn)
        log.info('create new table')

    result = {
            'job': ret['jid'],
            'minion': ret['id'],
            'function': ret['fun'],
            'body': json.dumps(ret['return']),
            #'body': ret['return'],
            'return_code': ret['retcode']
            }
    result = r.table(table_name).insert(result).run(conn)
