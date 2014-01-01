# -*- mode: yaml -*-
# vi: set ft=yaml :
---
base:
  '*':
    - minion
  master:
    - ruby
  rails:
    - match: nodegroup
    - rails
  db:
    - match: nodegroup
    - postgresql
