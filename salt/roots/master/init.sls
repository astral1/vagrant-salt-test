# -*- mode: yaml -*-
# vi: set ft=yaml :
---
salt-master:
  service:
    - running
    - watch:
      - file: /etc/salt/master.d/*
