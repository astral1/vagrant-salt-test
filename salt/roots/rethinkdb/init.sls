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

rethinkdb:
  pkg.installed
