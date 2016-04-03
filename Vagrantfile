# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create management node
  config.vm.define :management do |management_config|
      management_config.vm.box = "ubuntu/trusty64"
      management_config.vm.hostname = "management"
      management_config.vm.network :private_network, ip: "10.0.15.10"
      management_config.vm.provider "virtualbox" do |vb|
        vb.memory = "256"
      end
      management_config.vm.provision :shell, path: "bootstrap-management.sh"
  end

  # create master
  config.vm.define :master do |master_config|
      master_config.vm.box = "ubuntu/trusty64"
      master_config.vm.hostname = "master"
      master_config.vm.network :private_network, ip: "10.0.15.11"
      master_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
  end

  # create worker nodes
  (1..3).each do |i|
    config.vm.define "worker#{i}" do |worker|
        worker.vm.box = "ubuntu/trusty64"
        worker.vm.hostname = "worker#{i}"
        worker.vm.network :private_network, ip: "10.0.15.2#{i}"
        worker.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end
    end
  end
end
