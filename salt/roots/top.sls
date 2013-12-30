# -*- mode: yaml -*-
# vi: set ft=yaml :
---
base:
  #'*':
  master:
    - ruby
  rails:
    - match: nodegroup
    - rails
  db:
    - match: nodegroup
    - postgresql
