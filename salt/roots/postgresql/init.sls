# -*- mode: yaml -*-
# vi: set ft=yaml :
---
add_repository_key:
  cmd.run:
    - name: wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
    - unless: apt-key list | grep -q 'PostgreSQL Debian Repository'

/etc/apt/sources.list.d/postgresql.list:
  file.managed:
    - source: salt://postgresql/postgres-apt.list

postgresql:
  pkg.installed:
    - name: postgresql-9.2
    - refresh: True
    - require:
      - cmd: add_repository_key
      - file: /etc/apt/sources.list.d/postgresql.list

