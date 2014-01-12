# -*- mode: yaml -*-
# vi: set ft=yaml :
---
include:
  - rethinkdb.python

python-pip:
  pkg:
    - installed

python-dev:
  pkg:
    - installed
      
pymongo:
  pip:
    - installed
    - require:
      - pkg: python-pip

netifaces:
  pip:
    - installed
    - require:
      - pkg: python-pip
      - pkg: python-dev

/etc/salt/minion.d/rethinkdb.conf:
  file.managed:
    - source: salt://prerequisites/rethinkdb
