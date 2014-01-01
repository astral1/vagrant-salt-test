# -*- mode: yaml -*-
# vi: set ft=yaml :
---
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
