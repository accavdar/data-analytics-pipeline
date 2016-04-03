#!/usr/bin/env bash

# install ansible
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy ansible dir to /home/vagrant (from inside the management node)
cp -a /vagrant/ansible/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
10.0.15.10  management
10.0.15.11  master
10.0.15.21  worker1
10.0.15.22  worker2
10.0.15.23  worker3
EOL
