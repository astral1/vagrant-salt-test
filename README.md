Vagrant Configuration for Saltstack test
========================================

Prerequisite
------------

* [Vagrant](http://www.vagrantup.com) ~> 1.3.5
* [Salty Vagrant](https://github.com/saltstack/salty-vagrant)
* (optional) [Packer](http://www.packer.io)
* (optional) [Basebox Packer](https://github.com/misheska/basebox-packer)

Start up
--------

```
expose SALTY_VAGRANT_BASE=/path/to/basebox
vagrant up
```

Configuration
-------------
* salt/config/master
* salt/config/minion
* salt/pki/master/master.pem
* salt/pki/master/master.pub
* salt/pki/minion/minion.pem
* salt/pki/minion/minion.pub
* salt/pki/vagrant/minion[number].pub
* salt/pki/vagrant/minion[number].pem
* salt/roots
