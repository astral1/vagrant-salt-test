# -*- mode: yaml -*-
# vi: set ft=yaml :
---
halite:
  pip:
    - installed

/etc/salt/master.d/halite.conf:
  file.managed:
    - source: salt://halite/config
