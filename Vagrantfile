# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create master node
  config.vm.define :master do |master_config|
    master_config.vm.box = "ubuntu/trusty64"
    master_config.vm.hostname = "master"
    master_config.vm.network :private_network, ip: "10.0.15.11"
    master_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
    end

    # ansible provisioner for master
    master_config.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/master.yml"
        ansible.inventory_path = "ansible/inventory.ini"
    end
  end

  # create worker nodes
  (1..3).each do |i|
    config.vm.define "worker#{i}" do |worker_config|
        worker_config.vm.box = "ubuntu/trusty64"
        worker_config.vm.hostname = "worker#{i}"
        worker_config.vm.network :private_network, ip: "10.0.15.2#{i}"
        worker_config.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end

        # ansible provisioner for worker
        worker_config.vm.provision "ansible" do |ansible|
            ansible.playbook = "ansible/worker.yml"
            ansible.inventory_path = "ansible/inventory.ini"
        end
    end
  end
end
