# -*- mode: yaml -*-
# vi: set ft=yaml :
---
rethinkdb-repo:
  pkgrepo.managed:
    - ppa: rethinkdb/ppa
    - require_in:
      - pkg: rethinkdb
  pkg.latest:
    - name: rethinkdb
    - refresh: True

/etc/rethinkdb/instances.d/1.conf:
  file.managed:
    - source: salt://rethinkdb/config

rethinkdb:
  pkg:
    - installed
    - require:
      - pkgrepo: rethinkdb-repo
  service:
    - running
    - watch:
      - file: /etc/rethinkdb/instances.d/1.conf
    - require:
      - file: /etc/rethinkdb/instances.d/1.conf
