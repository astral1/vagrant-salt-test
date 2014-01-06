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
    - master
  rails:
    - match: nodegroup
    - rails
  db:
    - match: nodegroup
    - postgresql
