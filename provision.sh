#!/bin/sh

# set ssh key
cd /root
mkdir .ssh
chmod 700 .ssh
cd .ssh
cat /vagrant/.ssh/test_id_rsa.pub >> authorized_keys
chmod 600 authorized_keys
cp /vagrant/.ssh/test_id_rsa ./id_rsa
chmod 600 id_rsa

# install chef
curl -L https://www.chef.io/chef/install.sh | bash

#echo 'export PATH=/opt/chef/embedded/bin:$PATH' >> /root/.bash_profile
#export PATH=/opt/chef/embedded/bin:$PATH

# git clone provisioner
cd /home/vagrant
git clone https://github.com/gomesuit/provisioner_chef_zero.git

# run chef
cd /home/vagrant/provisioner_chef_zero
#bundle install
#bundle exec knife zero bootstrap localhost
#bundle exec berks vendor cookbooks
#bundle exec knife node run_list add ansible zsh
#bundle exec knife zero chef_client 'name:ansible' --attribute ipaddress
chef-client -z
