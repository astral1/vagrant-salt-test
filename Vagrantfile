# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.package.name = File.basename(File.dirname(__FILE__))

  unless ENV['SALTY_VAGRANT_BASE'].nil?
    config.vm.box_url = ENV['SALTY_VAGRANT_BASE']
  else
    config.vm.box_url = 'basebox/saucy64.box'
  end
  config.vm.synced_folder 'salt/roots/', '/srv/salt/'

  config.vm.define :master do |master|
    master.vm.box = 'master'
    master.vm.host_name = 'master'
    master.vm.synced_folder 'salt/pillar', '/srv/pillar'
    master.vm.synced_folder 'salt/pki/', '/etc/salt/pki/'
    master.vm.network :private_network, ip: '192.168.11.100'
    master.vm.network 'forwarded_port', guest: 8000, host: 8000
    master.vm.network 'forwarded_port', guest: 8080, host: 8001
    master.vm.provision :salt do |salt|
      salt.install_master = true

      salt.master_config = 'salt/config/master'
      salt.minion_key = 'salt/pki/minion/minion.pem'
      salt.minion_pub = 'salt/pki/minion/minion.pub'
      salt.seed_master = {
        master: 'salt/pki/minion/minion.pub',
        minion1: 'salt/pki/vagrant/minion1.pub',
        minion2: 'salt/pki/vagrant/minion2.pub'
      }

      salt.install_type = :stable
      salt.minion_config = 'salt/config/minion'
    end
  end

  config.vm.define :minion1 do |minion1|
    minion1.vm.box = 'minion1'
    minion1.vm.host_name = 'minion1'
    minion1.vm.network :private_network, ip: '192.168.11.101'
    minion1.vm.provision :salt do |salt|
      salt.minion_key = 'salt/pki/vagrant/minion1.pem'
      salt.minion_pub = 'salt/pki/vagrant/minion1.pub'
      salt.install_type = :stable
      salt.minion_config = 'salt/config/minion'
      #salt.minion_config = 'salt/config/minion/1'
      #salt.run_highstate = true
    end
  end

  config.vm.define :minion2 do |minion2|
    minion2.vm.box = 'minion2'
    minion2.vm.host_name = 'minion2'
    minion2.vm.network :private_network, ip: '192.168.11.102'
    minion2.vm.network 'forwarded_port', guest: 8080, host: 8002
    minion2.vm.provision :salt do |salt|
      salt.minion_key = 'salt/pki/vagrant/minion2.pem'
      salt.minion_pub = 'salt/pki/vagrant/minion2.pub'
      salt.install_type = :stable
      salt.minion_config = 'salt/config/minion'
      #salt.minion_config = 'salt/config/minion/2'
      #salt.run_highstate = true
    end
  end

  # config.vm.boot_mode = :gui

  # config.vm.network :hostonly, "192.168.33.10"

  # Assign this VM to a bridged network, allowing you to connect directly to a
  # network using the host's network device. This makes the VM appear as another
  # physical device on your network.
  # config.vm.network :bridged

  # config.vm.forward_port 80, 8080

  # config.vm.share_folder "v-data", "/vagrant_data", "../data"

  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
end
