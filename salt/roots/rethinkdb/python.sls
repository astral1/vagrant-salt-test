# -*- mode: yaml -*-
# vi: set ft=yaml :
---
rethinkdb-pip:
  pip.installed:
    - name: rethinkdb
    - require:
      - pkg: python-pip
