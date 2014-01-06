# -*- mode: yaml -*-
# vi: set ft=yaml :
---
salt-api:
  pkg:
    - installed
  service:
    - running
    - watch:
      - file: /etc/salt/master.d/api.conf

/etc/salt/master.d/api.conf:
  file.managed:
    - source: salt://salt-api/config
