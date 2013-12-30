# -*- mode: yaml -*-
# vi: set ft=yaml :
---
include:
  - ruby
rails:
  gem.installed:
    - name: rails
    - ruby: 2.1.0
    - require:
      - rvm: ruby-2.1.0
