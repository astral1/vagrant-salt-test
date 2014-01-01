# -*- mode: yaml -*-
# vi: set ft=yaml :
---
python-pip:
  pkg:
    - installed
      
pymongo:
  pip:
    - installed
    - require:
      - pkg: python-pip
