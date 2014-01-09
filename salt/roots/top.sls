# -*- mode: yaml -*-
# vi: set ft=yaml :
---
base:
  '*':
    - prerequisites
    - minion
  master:
    - ruby
    - salt-api
    - halite
    - rethinkdb.python
  rails:
    - match: nodegroup
    - rails
  db:
    - match: nodegroup
    - postgresql
    - rethinkdb
