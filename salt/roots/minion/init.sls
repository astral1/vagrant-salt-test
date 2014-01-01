# -*- mode: yaml -*-
# vi: set ft=yaml :
---
salt-minion:
  service:
    - running
    - watch:
      - file: /etc/salt/minion.d/managed.conf

/etc/salt/minion.d/managed.conf:
  file.managed:
    - source: salt://minion/managed
